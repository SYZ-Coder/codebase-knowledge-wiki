#!/usr/bin/env bash

set -euo pipefail

tool="${1:-}"
target_path="${2:-}"

usage() {
  cat <<'EOF'
Usage:
  ./scripts/install.sh codex
  ./scripts/install.sh claude /path/to/target-project
  ./scripts/install.sh cursor /path/to/target-project
  ./scripts/install.sh opencode /path/to/target-project
EOF
}

if [[ -z "$tool" ]]; then
  usage
  exit 1
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
backend_skill="$repo_root/backend-service-spec-skill"
cross_skill="$repo_root/cross-tech-stack-spec-skill"
claude_commands="$repo_root/.claude/commands"
cursor_rules="$repo_root/.cursor/rules"

copy_dir_safe() {
  local src="$1"
  local dest="$2"
  mkdir -p "$(dirname "$dest")"
  rm -rf "$dest"
  cp -R "$src" "$dest"
}

copy_file_safe() {
  local src="$1"
  local dest="$2"
  mkdir -p "$(dirname "$dest")"
  cp "$src" "$dest"
}

case "$tool" in
  codex)
    skills_root="${HOME}/.codex/skills"
    mkdir -p "$skills_root"
    copy_dir_safe "$backend_skill" "$skills_root/backend-service-spec-skill"
    copy_dir_safe "$cross_skill" "$skills_root/cross-tech-stack-spec-skill"
    echo "Installed Codex skills to: $skills_root"
    echo "Next step: restart Codex or open a new session."
    ;;

  claude)
    if [[ -z "$target_path" ]]; then
      echo "Target project path is required for Claude installation."
      usage
      exit 1
    fi
    project_root="$(cd "$target_path" && pwd)"
    skills_root="$project_root/.claude/skills"
    commands_root="$project_root/.claude/commands"
    mkdir -p "$skills_root" "$commands_root"
    copy_dir_safe "$backend_skill" "$skills_root/backend-service-spec-skill"
    copy_dir_safe "$cross_skill" "$skills_root/cross-tech-stack-spec-skill"
    for file in "$claude_commands"/*; do
      copy_file_safe "$file" "$commands_root/$(basename "$file")"
    done
    echo "Installed Claude project assets into: $project_root/.claude"
    echo "Included: .claude/skills and .claude/commands"
    ;;

  cursor)
    if [[ -z "$target_path" ]]; then
      echo "Target project path is required for Cursor installation."
      usage
      exit 1
    fi
    project_root="$(cd "$target_path" && pwd)"
    skills_root="$project_root/skills"
    rules_root="$project_root/.cursor/rules"
    mkdir -p "$skills_root" "$rules_root"
    copy_dir_safe "$backend_skill" "$skills_root/backend-service-spec-skill"
    copy_dir_safe "$cross_skill" "$skills_root/cross-tech-stack-spec-skill"
    for file in "$cursor_rules"/*; do
      copy_file_safe "$file" "$rules_root/$(basename "$file")"
    done
    echo "Installed Cursor project assets into: $project_root"
    echo "Included: skills/ and .cursor/rules/"
    ;;

  opencode)
    if [[ -z "$target_path" ]]; then
      echo "Target project path is required for OpenCode installation."
      usage
      exit 1
    fi
    project_root="$(cd "$target_path" && pwd)"
    skills_root="$project_root/.opencode/skills"
    mkdir -p "$skills_root"
    copy_dir_safe "$backend_skill" "$skills_root/backend-service-spec-skill"
    copy_dir_safe "$cross_skill" "$skills_root/cross-tech-stack-spec-skill"
    echo "Installed OpenCode project skills into: $project_root/.opencode/skills"
    echo "Included: .opencode/skills/"
    ;;

  *)
    echo "Unsupported tool: $tool"
    usage
    exit 1
    ;;
esac
