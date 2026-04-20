# 安装指南

这个仓库更适合作为 AI 开发工具的技能源与规则源来使用。

它支持两种接入方式：

1. 原生技能目录安装
2. 仓库规则 / 指令接入

## 1. 快速选择

先按工具类型选择：

- `Codex`：把技能目录复制到本地 Codex 技能目录
- `Claude Code / Claude`：通过 `CLAUDE.md` 或项目指令引用本仓库
- `Cursor`：通过 `.cursor/rules/` 引用本仓库
- `VS Code + AI 扩展`：通过项目规则、prompt 或文档引用本仓库
- 其他 AI 工具：使用文末的“通用接入模板”

## 2. Codex

把下面两个目录复制到 Codex 的技能目录：

- `backend-service-spec-skill`
- `cross-tech-stack-spec-skill`

常见技能目录：

- Windows：`%USERPROFILE%\\.codex\\skills\\`
- macOS：`~/.codex/skills/`
- Linux：`~/.codex/skills/`

建议步骤：

1. 克隆本仓库。
2. 把 `backend-service-spec-skill` 复制到 Codex 技能目录。
3. 把 `cross-tech-stack-spec-skill` 复制到 Codex 技能目录。
4. 重启 Codex 或开启新会话。

示例：

```text
请用 backend-service-spec-skill 梳理这个后端微服务项目。
```

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill 做混合栈适配。
```

## 3. Claude Code / Claude

推荐方式：

1. 把本仓库克隆到项目内或项目旁，例如 `ai-skill-lib/`。
2. 创建或更新 `CLAUDE.md`。
3. 引用这两个文件：
   - `./ai-skill-lib/backend-service-spec-skill/SKILL.md`
   - `./ai-skill-lib/cross-tech-stack-spec-skill/SKILL.md`

`CLAUDE.md` 示例：

```md
本项目分析时，使用以下仓库作为规则源：

- ./ai-skill-lib/backend-service-spec-skill/SKILL.md
- ./ai-skill-lib/cross-tech-stack-spec-skill/SKILL.md

要求：
- 严格按代码事实输出
- 区分已闭环、部分闭环、线索级
- 以 create_codemap、build_domain_map、crate_router_map、service_deep_dive 作为核心分析动作
```

## 4. Cursor

推荐方式：

1. 把本仓库克隆到项目内或项目旁，例如 `ai-skill-lib/`。
2. 创建 `.cursor/rules/backend-service-spec.mdc`。
3. 创建 `.cursor/rules/cross-tech-stack-spec.mdc`。
4. 在规则文件中写简版规则。
5. 在规则文件中回指本仓库。

规则片段示例：

```md
本项目分析时，使用以下规则源：

- ./ai-skill-lib/backend-service-spec-skill/SKILL.md
- ./ai-skill-lib/cross-tech-stack-spec-skill/SKILL.md

规则：
- 严格按代码事实输出
- 区分 fact-closed、仅发送侧、仅接收侧、contract-visible、clue
- 以 create_codemap、build_domain_map、crate_router_map、service_deep_dive 作为核心分析动作
```

## 5. VS Code

VS Code 通常通过 AI 扩展使用这套仓库，而不是直接原生安装技能。

推荐方式：

1. 把本仓库克隆到工作区内或旁边，例如 `ai-skill-lib/`。
2. 增加项目说明文件，例如 `docs/ai-analysis-guide.md`。
3. 在说明文件中引用两个 `SKILL.md`。
4. 如果扩展支持项目规则，再把扩展指向这些文件。

示例说明内容：

```md
项目分析与知识梳理时，优先参考：

- ./ai-skill-lib/backend-service-spec-skill/SKILL.md
- ./ai-skill-lib/cross-tech-stack-spec-skill/SKILL.md

优先规则：
- 严格按代码事实
- 显式区分闭环状态
- 先 codemap，再做链路深挖
```

## 6. 通用接入模板

如果你的 AI 开发工具不在上面的列表里，可以通过规则文件、prompt 模板、自定义指令或 docs context 接入本仓库。

最小可迁移模板：

```md
本项目分析时，使用以下仓库作为规则源：

- ./backend-service-spec-skill/SKILL.md
- ./cross-tech-stack-spec-skill/SKILL.md

核心规则：
- 严格按代码事实输出
- 区分已闭环、部分闭环、线索级
- 以 create_codemap、build_domain_map、crate_router_map、service_deep_dive 作为核心分析动作
- 如果项目涉及移动端、H5、Python、前后端混合链路、callback、task、消息链路，则启用跨技术栈扩展规则
```

## 7. 一句话总结

对外可以把这个仓库理解为：

- 在 Codex 中作为原生技能安装
- 在 Claude、Cursor、VS Code 及其他类似工具中作为规则仓库接入

## 8. 生成的 `mydocs/` 产物如何落地

技能分析完成后，不建议把 `mydocs/` 直接当成团队知识的最终落点。

建议继续阅读：

- [从 `mydocs` 到项目中央知识库](./mydocs-to-central-knowledge-repo.zh-CN.md)
- [中央知识库与 OpenSpec 协同规则](./knowledge-repo-and-openspec-collaboration.zh-CN.md)
