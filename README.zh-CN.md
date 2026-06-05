# 后端与跨技术栈规格技能库

这个仓库是一个面向代码知识梳理、遗留系统理解、中央知识库建设，以及混合技术栈项目分析的开源技能库。

它吸收了 `zread` 和 `sdd-riper` 的部分思路与工作原则，并在此基础上进行了升级和扩展，形成了一个更适合团队长期复用的技能库，用于支撑跨服务分析、混合栈梳理、长期知识沉淀与中央知识库维护。

## 语言导航

- 中文：[README.zh-CN.md](./README.zh-CN.md)
- 英文：[README.md](./README.md)

## 仓库里有什么

当前仓库围绕两套并列维护的技能展开：

1. `backend-service-spec-skill`
2. `cross-tech-stack-spec-skill`

目标是把偏后端的知识地图能力与跨技术栈扩展能力放在同一个仓库里，方便统一维护、发布和阅读。

## 从这里开始

如果你是第一次进入这个仓库：

1. 先读根 README，了解安装方式、技能边界和导航路径。
2. 如果目标是后端、微服务、遗留系统或平台服务仓库，继续阅读 [后端服务规格技能 README](./backend-service-spec-skill/README.zh-CN.md)。
3. 如果目标是移动端、H5、Python 或混合技术栈工作区，继续阅读 [跨技术栈规格技能 README](./cross-tech-stack-spec-skill/README.zh-CN.md)。

## 该用哪个技能

| 场景 | 推荐技能 | 优先阅读 |
| --- | --- | --- |
| 后端、微服务、旧系统、平台型服务仓库 | `$backend-service-spec-skill` | [后端服务规格技能 README](./backend-service-spec-skill/README.zh-CN.md) |
| 移动端、H5、Python 或混合工作区 | `$backend-service-spec-skill` + `$cross-tech-stack-spec-skill` | [跨技术栈规格技能 README](./cross-tech-stack-spec-skill/README.zh-CN.md) |
| 纯非后端优先仓库，后端语义明显不够准确 | `$cross-tech-stack-spec-skill` | [跨技术栈规格技能 README](./cross-tech-stack-spec-skill/README.zh-CN.md) |

推荐表达方式：

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill 做混合栈适配。
```

## 重要说明

当前基础技能和扩展技能都已经直接使用正式名称：

- `backend-service-spec-skill`
- `cross-tech-stack-spec-skill`

例如：

```text
请使用 $backend-service-spec-skill 分析这个后端微服务项目。
```

## 快速安装与工具接入

为了方便开源用户使用，本仓库提供了跨平台辅助脚本：

- PowerShell: `./scripts/install.ps1`
- Shell: `./scripts/install.sh`

### Codex

Windows：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 codex
```

macOS / Linux：

```bash
bash ./scripts/install.sh codex
```

这会把以下两套技能安装到本地 `~/.codex/skills/` 目录：

- `backend-service-spec-skill`
- `cross-tech-stack-spec-skill`

### Claude Code / Claude

`Claude Code` 不像 `Codex` 那样有原生的一键技能安装机制，但本仓库提供了项目级的一键接入命令：

Windows：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 claude <target-project-dir>
```

macOS / Linux：

```bash
bash ./scripts/install.sh claude <target-project-dir>
```

这会把以下内容安装到目标项目中：

- `.claude/skills/backend-service-spec-skill/`
- `.claude/skills/cross-tech-stack-spec-skill/`
- `.claude/commands/*.md`

安装完成后，`Claude Code` 就可以在该项目里使用这些项目内技能目录和命令模板。
这种方式更接近“项目内技能 / 命令使用”，而不是 `Codex` 那种原生技能注册表执行。

### Cursor

`Cursor` 也没有针对本仓库的原生一键技能安装机制，但本仓库提供了项目级的一键接入命令：

Windows：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 cursor <target-project-dir>
```

macOS / Linux：

```bash
bash ./scripts/install.sh cursor <target-project-dir>
```

这会把以下内容安装到目标项目中：

- `skills/backend-service-spec-skill/`
- `skills/cross-tech-stack-spec-skill/`
- `.cursor/rules/*.mdc`

安装完成后，`Cursor` 通常不需要再手工额外配置规则，因为规则文件已经被复制到 `.cursor/rules/`。

建议下一步：

1. 重新打开目标项目，或让 Cursor 刷新项目上下文。
2. 直接让 Cursor Agent 执行 `create_codemap`、`service_deep_dive`、`crate_router_map`、`build_domain_map` 等工作流意图。

### OpenCode

`OpenCode` 原生支持项目内技能发现，所以本仓库提供了针对 `.opencode/skills/` 的项目级一键接入命令：

Windows：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 opencode <target-project-dir>
```

macOS / Linux：

```bash
bash ./scripts/install.sh opencode <target-project-dir>
```

这会把以下内容安装到目标项目中：

- `.opencode/skills/backend-service-spec-skill/`
- `.opencode/skills/cross-tech-stack-spec-skill/`

安装完成后，重新打开目标项目或刷新 OpenCode 项目上下文，即可让它发现这些项目内技能。

更多安装说明：

- [通用参考文档导航](./references/README.zh-CN.md)
- [安装指南](./references/installation-guide.zh-CN.md)
- [Installation Guide](./references/installation-guide.md)

## 最快上手方式

如果你想用最短路径开始：

1. 先按项目类型选技能。
2. 直接复用下面的提示词。
3. 需要完整规则、产物细节或模板时，再进入对应子 README。

### 后端项目首轮提示词

```text
请使用 $backend-service-spec-skill 分析这个后端微服务项目，并按标准产物输出。
请同时生成常规正文页面及配套的 Markdown/Mermaid 图。
```

### 混合栈项目首轮提示词

```text
请以 $backend-service-spec-skill 作为基础工作流，并启用 $cross-tech-stack-spec-skill 进行混合技术栈适配。
请输出标准产物，并同时生成 Markdown/Mermaid 配套图。
```

## 核心能力总览

### `backend-service-spec-skill`

这是仓库中的主技能，适用于后端系统、微服务版图、遗留代码库，以及平台型服务仓库。

| 命令 | 适用场景 | 常见产物 | 继续阅读 |
| --- | --- | --- | --- |
| `create_codemap` | 需要先获得一版整体服务版图 | 服务清单、服务边界、上下游依赖、架构图、服务调用关系图 | [后端技能 README](./backend-service-spec-skill/README.zh-CN.md) |
| `service_deep_dive` | 已识别一个高价值服务 | 单服务结构页、接口清单、依赖页、服务规则页、模块架构图 | [后端技能快速开始](./backend-service-spec-skill/references/quick-start.zh-CN.md) |
| `crate_router_map` | 想追踪一条真实请求链或消息链 | 关键链路页、同步/异步拆分视图、闭环状态页、时序图、链路调用图 | [后端技能命令速查](./backend-service-spec-skill/references/command-output-scenario-quickref.zh-CN.md) |
| `build_domain_map` | 想把服务事实沉淀为领域知识 | 业务领域页、领域到服务映射页、领域级规则页、领域上下文图 | [后端技能命令输出对照](./backend-service-spec-skill/references/command-output-map.zh-CN.md) |
| `requirement_fact_map` | 历史需求缺失，需要从代码提取事实需求 | 功能模块事实需求页、需求到代码证据矩阵、未闭环需求、需求索引 | [需求事实提取指南](./backend-service-spec-skill/references/requirement-fact-extraction.md) |

详细的命令语义、示例、产物规则和目录说明，已经下沉到子 README：

- [后端服务规格技能 README](./backend-service-spec-skill/README.zh-CN.md)

### `cross-tech-stack-spec-skill`

当“只用后端语义”已经不足以准确描述项目时，启用这个显式扩展技能。

典型增强：

- 工作区分层
- 混合栈噪音控制
- 接口映射
- 上下文传播追踪
- gateway 转发分析
- 异步契约分析
- 混合栈架构与跨层调用图

详细的扩展行为、可选开关、上下文规则和模板，已经放到：

- [跨技术栈规格技能 README](./cross-tech-stack-spec-skill/README.zh-CN.md)
- [扩展技能使用指南](./cross-tech-stack-spec-skill/references/extension-usage-guide.zh-CN.md)

## 如何理解 `mydocs` 输出结构

很多用户知道 `mydocs/` 是输出根目录，但不一定立刻清楚每个子目录分别是做什么的。

| 目录 | 它主要回答什么问题 | 更适合谁使用 |
| --- | --- | --- |
| `mydocs/codemap/` | 整个工作区是什么结构，核心系统和关系是什么？ | 首次建立全局认知的人或 AI |
| `mydocs/services/` | 某个重要服务的内部结构、接口和依赖是什么？ | 准备修改单个服务的人或 AI |
| `mydocs/routermap/` | 一条真实请求链或消息链是怎样运行的？ | 做联调、链路追踪或故障分析的人或 AI |
| `mydocs/domains/` | 如何把服务事实沉淀成可长期维护的业务领域知识？ | 建设中央知识库的人或 AI |
| `mydocs/requirements/` | 当前系统按事实支持了哪些功能需求，证据是否闭环？ | 补历史需求缺口、建设需求知识库的人或 AI |
| `mydocs/context/` | 跨服务共享的契约、字段、上下文传播、错误语义、异步契约和外部依赖有哪些？ | 做跨模块编码、接口对齐或调试的人或 AI |
| `mydocs/validation/` | 哪些结论证据完整，哪些仍只是线索，风险还剩什么？ | 复用前需要验证可信度的人或 AI |
| `mydocs/index/` | 这一轮分析的索引、阅读顺序和范围边界是什么？ | 所有消费产物的人 |

最容易被误解的目录是 `mydocs/context/`：

- 它不是某一个服务的私有目录
- 更适合把它理解为当前分析范围内的全局横切上下文层
- 它主要服务跨端、跨服务和跨链路协作
- 它的边界是当前分析范围纳入的系统，而不是一个组织里的所有仓库

## 场景导航表

如果你不确定从哪里开始，可以按场景选入口：

| 你的场景 | 推荐命令 / 用法 | 优先阅读 |
| --- | --- | --- |
| 你刚接手一个后端或微服务仓库，需要先看全局 | `create_codemap` | [后端服务规格技能 README](./backend-service-spec-skill/README.zh-CN.md) |
| 你已经锁定一个高价值服务，想做纵向分析 | `service_deep_dive` | [后端技能快速开始](./backend-service-spec-skill/references/quick-start.zh-CN.md) |
| 你想追踪一条真实请求链或消息链 | `crate_router_map` | [后端技能命令速查](./backend-service-spec-skill/references/command-output-scenario-quickref.zh-CN.md) |
| 你想把服务事实沉淀成业务领域知识 | `build_domain_map` | [后端技能命令输出对照](./backend-service-spec-skill/references/command-output-map.zh-CN.md) |
| 历史需求缺失，你需要按功能模块抽取事实需求 | `requirement_fact_map` | [需求事实提取指南](./backend-service-spec-skill/references/requirement-fact-extraction.md) |
| 项目是移动端、H5、Python 或混合技术栈 | `$backend-service-spec-skill` + `$cross-tech-stack-spec-skill` | [跨技术栈规格技能 README](./cross-tech-stack-spec-skill/README.zh-CN.md) |
| 你想要一条可直接发给 Codex 的现成提示词 | 复用根 README 里的快速命令示例 | [快速命令](#快速命令) |
| 你想了解完整工作流和配套材料 | 先读根 README，再读子 README 和 usage guide | [推荐阅读顺序](#推荐阅读顺序) |

## 快速命令

### 仅使用后端技能

```text
请使用 $backend-service-spec-skill 分析这个后端微服务项目，并按标准产物输出。
请同时生成常规正文页面及配套的 Markdown/Mermaid 图。
```

### 后端轻量完整分析

```text
请使用 $backend-service-spec-skill 对这个后端微服务项目执行一轮轻量完整分析。
要求：
1. 先识别项目范围
2. 执行 create_codemap
3. 对 1 到 2 个高价值服务执行 service_deep_dive
4. 对 1 到 2 条关键链路执行 crate_router_map
5. 输出标准产物，并默认附带 Markdown/Mermaid 配套图
6. 严格基于代码事实，不要脱离证据推断
```

### 后端重型完整分析

```text
请使用 $backend-service-spec-skill 对这个后端微服务项目执行一轮重型完整分析。
要求：
1. 先识别项目范围
2. 执行 create_codemap
3. 对多个高价值服务执行 service_deep_dive
4. 对多条关键链路执行 crate_router_map
5. 最后执行 build_domain_map
6. 输出标准产物，并默认附带 Markdown/Mermaid 配套图
7. 输出验证页面和未闭环链路摘要
8. 严格基于代码事实，不要脱离证据推断
```

### 历史需求事实提取

```text
请使用 $backend-service-spec-skill 为这个历史项目提取事实需求。
要求：
1. 先执行 create_codemap，识别系统边界、服务和核心入口
2. 对高价值服务执行 service_deep_dive
3. 对关键业务链路执行 crate_router_map
4. 最后执行 requirement_fact_map，按功能模块提取当前事实需求
5. 产物输出到 mydocs/requirements/
6. 严格基于代码事实，不要把线索升级成已确认需求
```

### 仅使用扩展技能

```text
请使用 $cross-tech-stack-spec-skill 分析这个混合技术栈项目。
```

### 后端 + 扩展技能

```text
请以 $backend-service-spec-skill 作为基础工作流，并启用 $cross-tech-stack-spec-skill 进行混合技术栈适配。
请输出标准产物，并同时生成 Markdown/Mermaid 配套图。
```

### 启用全部可选开关的扩展分析

```text
请以 $backend-service-spec-skill 作为基础工作流，启用 $cross-tech-stack-spec-skill，
并打开 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets，
对项目执行一轮完整增强分析。
请输出标准产物，并同时生成 Markdown/Mermaid 配套图。
```

### 全量分析模式

```text
请以 $backend-service-spec-skill 作为基础工作流，启用 $cross-tech-stack-spec-skill，
打开 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets，
并为所有已启用能力分别生成标准产物，包括配套的 Markdown/Mermaid 图。
```

说明：

- full analysis mode 会明显增加 token 消耗
- 也会增加扫描时间和输出规模
- 详细说明见 [Full Analysis Mode](./references/full-analysis-mode.zh-CN.md)

## 仓库结构

### 1. 后端服务技能

位置：

- `./backend-service-spec-skill/`

当仓库主要是遗留后端系统、微服务版图或平台服务家族时，使用这套技能。

继续阅读：

- [后端技能 README](./backend-service-spec-skill/README.zh-CN.md)
- [后端技能快速开始](./backend-service-spec-skill/references/quick-start.zh-CN.md)
- [后端技能命令输出对照](./backend-service-spec-skill/references/command-output-map.zh-CN.md)
- [后端技能命令速查](./backend-service-spec-skill/references/command-output-scenario-quickref.zh-CN.md)
- [需求事实提取指南](./backend-service-spec-skill/references/requirement-fact-extraction.md)
- [后端技能使用指南](./backend-service-spec-skill/references/usage-guide.md)

### 2. 跨技术栈扩展技能

位置：

- `./cross-tech-stack-spec-skill/`

当仓库跨越移动端、H5、Python、bridge、backend、MQ、callback 或其他跨技术栈边界时，使用这套扩展技能。

继续阅读：

- [扩展技能 README](./cross-tech-stack-spec-skill/README.zh-CN.md)
- [扩展技能详细使用指南](./cross-tech-stack-spec-skill/references/extension-usage-guide.zh-CN.md)
- [扩展技能命令输出对照](./cross-tech-stack-spec-skill/references/command-output-map.zh-CN.md)
- [扩展技能命令速查](./cross-tech-stack-spec-skill/references/command-output-scenario-quickref.zh-CN.md)
- [混合技术栈图产物输出规范](./cross-tech-stack-spec-skill/references/diagram-output-guidelines.zh-CN.md)
- [可选开关扩展说明](./cross-tech-stack-spec-skill/references/optional-switch-controlled-extensions.zh-CN.md)

## 推荐阅读顺序

### 首次使用

1. 先读这个根 README。
2. 再读与你项目类型匹配的子 README。
3. 直接复用上面的快速命令。

### 深入后端场景

- [后端技能快速开始](./backend-service-spec-skill/references/quick-start.zh-CN.md)
- [后端技能 README](./backend-service-spec-skill/README.zh-CN.md)
- [后端技能使用指南](./backend-service-spec-skill/references/usage-guide.md)

### 深入混合栈场景

- [跨技术栈规格技能 README](./cross-tech-stack-spec-skill/README.zh-CN.md)
- [扩展技能使用指南](./cross-tech-stack-spec-skill/references/extension-usage-guide.zh-CN.md)
- [可选开关扩展说明](./cross-tech-stack-spec-skill/references/optional-switch-controlled-extensions.zh-CN.md)

### 通用参考

- [通用参考文档导航](./references/README.zh-CN.md)
- [团队标准工作流](./references/team-standard-workflow.zh-CN.md)
- [全量分析模式](./references/full-analysis-mode.zh-CN.md)
- [从 `mydocs` 到中央知识库](./references/mydocs-to-central-knowledge-repo.zh-CN.md)
- [中央知识库与 OpenSpec 协作](./references/knowledge-repo-and-openspec-collaboration.zh-CN.md)
- [场景命令配方](./references/scenario-command-recipes.zh-CN.md)
- [从接口或功能追踪完整链路](./references/full-chain-by-interface-or-feature.zh-CN.md)
- [锚点选择指南](./references/anchor-selection-guide.zh-CN.md)

## 补充导航

- [通用参考文档导航](./references/README.zh-CN.md)
- [安装指南](./references/installation-guide.zh-CN.md)
- [目录与术语基线](./references/directory-and-terminology-baseline.zh-CN.md)
- [Backend Skill README](./backend-service-spec-skill/README.md)
- [Extension Skill README](./cross-tech-stack-spec-skill/README.md)
- [English Guide: `mydocs` To Central Knowledge Repository](./references/mydocs-to-central-knowledge-repo.md)
- [English Guide: Knowledge Repository And OpenSpec Collaboration](./references/knowledge-repo-and-openspec-collaboration.md)
