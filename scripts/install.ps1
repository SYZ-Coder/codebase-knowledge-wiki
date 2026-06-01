param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("codex", "claude", "cursor")]
    [string]$Tool,

    [string]$TargetPath
)

$ErrorActionPreference = "Stop"

function Get-RepoRoot {
    return (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
}

function New-DirectoryIfMissing {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
    }
}

function Copy-DirectorySafe {
    param(
        [string]$Source,
        [string]$Destination
    )

    New-DirectoryIfMissing -Path (Split-Path -Parent $Destination)

    if (Test-Path -LiteralPath $Destination) {
        Remove-Item -LiteralPath $Destination -Recurse -Force
    }

    Copy-Item -LiteralPath $Source -Destination $Destination -Recurse -Force
}

function Copy-FileSafe {
    param(
        [string]$Source,
        [string]$Destination
    )

    New-DirectoryIfMissing -Path (Split-Path -Parent $Destination)
    Copy-Item -LiteralPath $Source -Destination $Destination -Force
}

$repoRoot = Get-RepoRoot
$backendSkill = Join-Path $repoRoot "backend-service-spec-skill"
$crossSkill = Join-Path $repoRoot "cross-tech-stack-spec-skill"
$claudeCommands = Join-Path $repoRoot ".claude\commands"
$cursorRules = Join-Path $repoRoot ".cursor\rules"

switch ($Tool) {
    "codex" {
        $homeDir = if ($env:USERPROFILE) { $env:USERPROFILE } else { $HOME }
        if (-not $homeDir) {
            throw "Cannot determine home directory for Codex installation."
        }

        $skillsRoot = Join-Path $homeDir ".codex\skills"
        New-DirectoryIfMissing -Path $skillsRoot

        Copy-DirectorySafe -Source $backendSkill -Destination (Join-Path $skillsRoot "backend-service-spec-skill")
        Copy-DirectorySafe -Source $crossSkill -Destination (Join-Path $skillsRoot "cross-tech-stack-spec-skill")

        Write-Host "Installed Codex skills to: $skillsRoot"
        Write-Host "Next step: restart Codex or open a new session."
    }

    "claude" {
        if (-not $TargetPath) {
            throw "TargetPath is required for Claude project installation."
        }

        $projectRoot = (Resolve-Path $TargetPath).Path
        $skillsRoot = Join-Path $projectRoot ".claude\skills"
        $commandsRoot = Join-Path $projectRoot ".claude\commands"

        New-DirectoryIfMissing -Path $skillsRoot
        New-DirectoryIfMissing -Path $commandsRoot

        Copy-DirectorySafe -Source $backendSkill -Destination (Join-Path $skillsRoot "backend-service-spec-skill")
        Copy-DirectorySafe -Source $crossSkill -Destination (Join-Path $skillsRoot "cross-tech-stack-spec-skill")

        Get-ChildItem -LiteralPath $claudeCommands -File | ForEach-Object {
            Copy-FileSafe -Source $_.FullName -Destination (Join-Path $commandsRoot $_.Name)
        }

        Write-Host "Installed Claude project assets into: $projectRoot\.claude"
        Write-Host "Included: .claude/skills and .claude/commands"
    }

    "cursor" {
        if (-not $TargetPath) {
            throw "TargetPath is required for Cursor project installation."
        }

        $projectRoot = (Resolve-Path $TargetPath).Path
        $skillsRoot = Join-Path $projectRoot "skills"
        $rulesRoot = Join-Path $projectRoot ".cursor\rules"

        New-DirectoryIfMissing -Path $skillsRoot
        New-DirectoryIfMissing -Path $rulesRoot

        Copy-DirectorySafe -Source $backendSkill -Destination (Join-Path $skillsRoot "backend-service-spec-skill")
        Copy-DirectorySafe -Source $crossSkill -Destination (Join-Path $skillsRoot "cross-tech-stack-spec-skill")

        Get-ChildItem -LiteralPath $cursorRules -File | ForEach-Object {
            Copy-FileSafe -Source $_.FullName -Destination (Join-Path $rulesRoot $_.Name)
        }

        Write-Host "Installed Cursor project assets into: $projectRoot"
        Write-Host "Included: skills/ and .cursor/rules/"
    }
}
