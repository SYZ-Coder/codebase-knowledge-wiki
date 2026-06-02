# 后端与跨技术栈规格技能库

这个仓库是一个面向代码知识梳理、遗留系统理解、中央知识库建设，以及混合技术栈项目分析的开源技能库。

它吸收了 `zread` 和 `sdd-riper` 的部分思路与工作原则，并在此基础上进行了升级和扩展，形成了一个更适合团队长期复用的技能库，用于支撑跨服务分析、混合栈梳理、长期知识沉淀与中央知识库维护。

## 英文版 README

如果你更习惯阅读英文说明，请从这里开始：

- [README.md](./README.md)

当前仓库围绕两套并列维护的技能展开：

1. `backend-service-spec-skill`
2. `cross-tech-stack-spec-skill`

目标是把偏后端的知识地图能力与跨技术栈扩展能力放在同一个仓库里，方便统一维护、发布和阅读。

## 重要说明

当前基础技能和扩展技能都已经直接使用正式名称：

- `backend-service-spec-skill`
- `cross-tech-stack-spec-skill`

这意味着现在应当直接用它们的正式技能名来调用。

例如：

```text
请使用 $backend-service-spec-skill 分析这个后端微服务项目。
```

## 快速安装与工具接入

为了方便开源用户使用，本仓库现在提供了跨平台辅助脚本：

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
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 claude D:\path\to\target-project
```

macOS / Linux：

```bash
bash ./scripts/install.sh claude /path/to/target-project
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
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 cursor D:\path\to\target-project
```

macOS / Linux：

```bash
bash ./scripts/install.sh cursor /path/to/target-project
```

这会把以下内容安装到目标项目中：

- `skills/backend-service-spec-skill/`
- `skills/cross-tech-stack-spec-skill/`
- `.cursor/rules/*.mdc`

安装完成后，`Cursor` 通常不需要再手工额外配置规则，因为规则文件已经被复制到 `.cursor/rules/`。
这里应理解为“基于规则的工作流执行”，而不是像 `Codex` 那样的原生技能注册表执行。

建议下一步：

1. 重新打开目标项目，或让 Cursor 刷新项目上下文。
2. 直接让 Cursor Agent 执行 `create_codemap`、`service_deep_dive`、`crate_router_map`、`build_domain_map` 等工作流意图。

## 从这里开始

如果你是第一次进入这个仓库，建议把这个根 README 当作总入口：

1. 先阅读本文，了解两套技能、它们的边界，以及常见入口提示词。
2. 如果目标是后端、微服务、遗留系统或平台服务仓库，继续阅读 [后端服务规格技能 README](./backend-service-spec-skill/README.zh-CN.md)。
3. 如果目标是移动端、H5、Python 或混合技术栈工作区，继续阅读 [跨技术栈规格技能 README](./cross-tech-stack-spec-skill/README.zh-CN.md)。

如果你主要想先知道 `backend-service-spec-skill` 能做什么，再决定是否深入子目录，可以先看下面的命令总览。

## `backend-service-spec-skill` 总览

这是仓库中的主技能，适用于后端系统、微服务版图、遗留代码库，以及平台型服务仓库。

### 1. `create_codemap`

适用场景：

- 你需要先获得一版整体服务版图
- 你想先判断下一步该深入哪些服务

典型产物：

- 服务清单
- 服务边界
- 上下游依赖
- 服务全景概览页
- 标准执行时默认还会生成架构图和服务调用关系图

继续阅读：

- [后端服务规格技能 README](./backend-service-spec-skill/README.zh-CN.md)
- [后端技能命令输出对照](./backend-service-spec-skill/references/command-output-map.zh-CN.md)

### 2. `service_deep_dive`

适用场景：

- 你已经识别出一个高价值服务
- 你希望纵向分析模块、接口、依赖和职责

典型产物：

- 单服务结构页
- 接口清单
- 依赖关系页
- 服务规则或约定页
- 标准执行时默认还会生成上下游依赖图和模块架构图

继续阅读：

- [后端服务规格技能 README](./backend-service-spec-skill/README.zh-CN.md)
- [后端技能快速开始](./backend-service-spec-skill/references/quick-start.zh-CN.md)

### 3. `crate_router_map`

适用场景：

- 你想追踪一条真实请求链或消息链
- 你需要区分同步调用、异步消息、补偿链路和实时通道

典型产物：

- 关键链路页面
- 同步 / 异步拆分视图
- 闭环状态页面
- 标准执行时默认还会生成时序图和链路调用图

继续阅读：

- [后端服务规格技能 README](./backend-service-spec-skill/README.zh-CN.md)
- [后端技能命令速查](./backend-service-spec-skill/references/command-output-scenario-quickref.zh-CN.md)

### 4. `build_domain_map`

适用场景：

- 你已经掌握了服务层事实，想上升到领域层知识
- 你正在为中央知识库准备长期沉淀的产物

典型产物：

- 业务领域页
- 领域到服务映射页
- 领域级规则页
- 标准执行时默认还会生成领域上下文图

默认输出规则：

- 对四个后端核心命令来说，标准产物现在默认表示 `正文页面 + 配套 Markdown/Mermaid 图`
- 只有在你需要更窄范围、特殊命名或纯文本输出时，才需要单独强调图产物要求

继续阅读：

- [后端服务规格技能 README](./backend-service-spec-skill/README.zh-CN.md)
- [从 `mydocs` 到中央知识库](./references/mydocs-to-central-knowledge-repo.zh-CN.md)

### 5. `requirement_fact_map`

适用场景：

- 历史项目缺少 PRD 或明确的需求证据
- 你需要按功能模块从代码里提取当前事实需求
- 你想知道系统实际上已经支持哪些业务能力，而不只是知道有哪些服务、接口或链路
- 你需要一套能被产品、测试、研发和 AI 代理复用的需求知识库

典型产物：

- 功能模块事实需求页
- 需求到代码证据矩阵
- 未闭合需求与人工确认项
- 能回链到 codemap、service deep dive、router map 和 domain map 产物的需求索引

继续阅读：

- [后端服务规格技能 README](./backend-service-spec-skill/README.zh-CN.md)
- [需求事实提取指南](./backend-service-spec-skill/references/requirement-fact-extraction.md)

## 建议阅读路径

如果你想用最短路径上手：

1. 阅读 [后端技能快速开始](./backend-service-spec-skill/references/quick-start.zh-CN.md)
2. 阅读 [后端技能命令速查](./backend-service-spec-skill/references/command-output-scenario-quickref.zh-CN.md)
3. 再回到 [后端服务规格技能 README](./backend-service-spec-skill/README.zh-CN.md) 阅读完整说明

如果你想看全貌：

1. 先读这个根 README
2. 再读 [后端服务规格技能 README](./backend-service-spec-skill/README.zh-CN.md)
3. 再读 [后端技能使用指南](./backend-service-spec-skill/references/usage-guide.md)
4. 如果项目是混合栈，再继续阅读 [跨技术栈规格技能 README](./cross-tech-stack-spec-skill/README.zh-CN.md)

## 如何理解 `mydocs` 输出结构

很多用户知道 `mydocs/` 是输出根目录，但不一定立刻清楚每个子目录分别是做什么的。最简单的理解方式如下：

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
| 你想了解完整工作流和配套材料 | 先读根 README，再读子 README 和 usage guide | [建议阅读路径](#建议阅读路径) |

## 一句话选择指南

- 看整体服务版图：先用 `create_codemap`
- 看单个关键服务：先用 `service_deep_dive`
- 看真实跨服务链路：先用 `crate_router_map`
- 补齐历史需求缺口：用 `requirement_fact_map` 从代码中抽取当前事实需求
- 沉淀长期领域知识：最后用 `build_domain_map`
- 面对混合技术栈项目：以 `$backend-service-spec-skill` 为基础流程，并启用 `$cross-tech-stack-spec-skill`

## `cross-tech-stack-spec-skill` 图产物速览

当扩展技能按标准产物执行一次混合栈分析时，通常应当把正文页面与配套 Markdown/Mermaid 图一起生成。

默认常见图产物包括：

- 混合栈架构图
- 跨层调用关系图
- 当链路需要明确先后顺序时的 page/app/backend/task/callback/bridge 时序图
- 当启用 `enable_contract_map` 且证据充分时的接口映射图
- 当启用 `enable_gateway_map` 时的网关转发图
- 当启用 `enable_context_propagation_map` 时的上下文传播图
- 当启用 `enable_async_contract_map` 时的 producer/topic/consumer 链路图

继续阅读：

- [跨技术栈规格技能 README](./cross-tech-stack-spec-skill/README.zh-CN.md)
- [扩展技能命令输出对照](./cross-tech-stack-spec-skill/references/command-output-map.zh-CN.md)
- [混合技术栈图产物输出规范](./cross-tech-stack-spec-skill/references/diagram-output-guidelines.zh-CN.md)
- [混合技术栈图产物示例模板](./cross-tech-stack-spec-skill/references/diagram-output-example-template.zh-CN.md)
- [Mermaid 自检清单](./cross-tech-stack-spec-skill/references/mermaid-safety-checklist.zh-CN.md)

## 开源配套文件

这个仓库还包含了一些技能使用的配套文件：

- [许可证](./LICENSE)
- [安装指南](./references/installation-guide.zh-CN.md)
- [目录与术语基线](./references/directory-and-terminology-baseline.zh-CN.md)
- [从 `mydocs` 到中央知识库](./references/mydocs-to-central-knowledge-repo.zh-CN.md)
- [中央知识库与 OpenSpec 协作](./references/knowledge-repo-and-openspec-collaboration.zh-CN.md)

它也包含了面向其他 AI 开发工具的通用接入说明，只要工具支持 rules、instructions、prompts 或文档上下文，就可以按通用方式接入这个仓库。

如果你最关心技能产物如何落到中央知识库，最短阅读路径是：

1. 先读 [从 `mydocs` 到中央知识库](./references/mydocs-to-central-knowledge-repo.zh-CN.md)
2. 再读 [中央知识库与 OpenSpec 协作](./references/knowledge-repo-and-openspec-collaboration.zh-CN.md)

## 仓库结构

### 1. 后端服务技能

位置：

- `./backend-service-spec-skill/`

当仓库主要是遗留后端系统、微服务版图或平台服务家族时，使用这套技能。

核心能力：

- 跨服务 `create_codemap`
- 跨服务 `build_domain_map`
- `crate_router_map`
- `service_deep_dive`
- `requirement_fact_map`

继续阅读：

- [后端技能快速开始](./backend-service-spec-skill/references/quick-start.zh-CN.md)
- [后端技能命令输出对照](./backend-service-spec-skill/references/command-output-map.zh-CN.md)
- [后端技能命令速查](./backend-service-spec-skill/references/command-output-scenario-quickref.zh-CN.md)
- [需求事实提取指南](./backend-service-spec-skill/references/requirement-fact-extraction.md)
- [后端技能元数据](./backend-service-spec-skill/SKILL.md)
- [后端技能使用指南](./backend-service-spec-skill/references/usage-guide.md)
- [后端技能 README](./backend-service-spec-skill/README.zh-CN.md)

### 2. 跨技术栈扩展技能

位置：

- `./cross-tech-stack-spec-skill/`

当仓库跨越移动端、H5、Python、bridge、backend、MQ、callback 或其他跨技术栈边界时，使用这套扩展技能。

核心增强：

- 工作区分层
- 混合栈噪音控制
- 通信证据等级
- 接口映射
- 混合栈架构与跨层图
- 混合栈领域映射
- 增量更新模式
- 八个可选的开关控制深度分析页

继续阅读：

- [扩展技能元数据](./cross-tech-stack-spec-skill/SKILL.md)
- [扩展技能详细使用指南](./cross-tech-stack-spec-skill/references/extension-usage-guide.zh-CN.md)
- [扩展技能命令输出对照](./cross-tech-stack-spec-skill/references/command-output-map.zh-CN.md)
- [扩展技能命令速查](./cross-tech-stack-spec-skill/references/command-output-scenario-quickref.zh-CN.md)
- [混合技术栈图产物输出规范](./cross-tech-stack-spec-skill/references/diagram-output-guidelines.zh-CN.md)
- [Mermaid 自检清单](./cross-tech-stack-spec-skill/references/mermaid-safety-checklist.zh-CN.md)
- [全量分析模式](./references/full-analysis-mode.zh-CN.md)
- [可选开关扩展说明](./cross-tech-stack-spec-skill/references/optional-switch-controlled-extensions.zh-CN.md)
- [扩展技能 README](./cross-tech-stack-spec-skill/README.zh-CN.md)

## 如何选择

### 只使用 `$backend-service-spec-skill` 的情况

- 仓库主要是后端或微服务
- 用服务层语言依然足够准确
- 不需要跨技术栈适配

### 使用 `$cross-tech-stack-spec-skill` 的情况

- 仓库是移动端优先、H5 优先、Python 优先或混合技术栈
- 接口和链路分析必须跨越前端、网关、后端、MQ、callback 或 task 层
- 只用后端服务术语会扭曲项目结构

### 两者一起使用的情况

- 你想以后台技能为主流程
- 同时需要在其上启用混合栈适配

推荐表达方式：

```text
请以 $backend-service-spec-skill 作为基础工作流，并启用 $cross-tech-stack-spec-skill 进行混合技术栈适配。
```

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

## 推荐阅读顺序

- [团队标准工作流](./references/team-standard-workflow.zh-CN.md)
- [全量分析模式](./references/full-analysis-mode.zh-CN.md)
- [从 `mydocs` 到中央知识库](./references/mydocs-to-central-knowledge-repo.zh-CN.md)
- [中央知识库与 OpenSpec 协作](./references/knowledge-repo-and-openspec-collaboration.zh-CN.md)
- [场景命令配方](./references/scenario-command-recipes.zh-CN.md)
- [从接口或功能追踪完整链路](./references/full-chain-by-interface-or-feature.zh-CN.md)
- [锚点选择指南](./references/anchor-selection-guide.zh-CN.md)

1. 先读后端 quick-start 指南。
2. 再读 backend-service README 或 usage guide。
3. 如果项目是混合栈，再读 extension README。
4. 如果需要更深入的接口分析，再继续读 extension usage guide 和 optional-switch guide。

## 补充导航

- [团队标准工作流](./references/team-standard-workflow.zh-CN.md)
- [后端微服务项目个人工作流](./backend-service-spec-skill/references/personal-workflow.zh-CN.md)
- [后端技能命令输出对照](./backend-service-spec-skill/references/command-output-map.zh-CN.md)
- [后端技能命令速查](./backend-service-spec-skill/references/command-output-scenario-quickref.zh-CN.md)
- [扩展技能命令输出对照](./cross-tech-stack-spec-skill/references/command-output-map.zh-CN.md)
- [扩展技能命令速查](./cross-tech-stack-spec-skill/references/command-output-scenario-quickref.zh-CN.md)

## 中文导航

中文读者可以从这里继续：

- [中文根 README](./README.zh-CN.md)
- [中文指南：从 `mydocs` 到中央知识库](./references/mydocs-to-central-knowledge-repo.zh-CN.md)
- [中文指南：中央知识库与 OpenSpec 协作](./references/knowledge-repo-and-openspec-collaboration.zh-CN.md)
- [后端技能中文快速开始](./backend-service-spec-skill/references/quick-start.zh-CN.md)
- [后端技能中文 README](./backend-service-spec-skill/README.zh-CN.md)
- [扩展技能中文 README](./cross-tech-stack-spec-skill/README.zh-CN.md)
- [扩展技能中文使用指南](./cross-tech-stack-spec-skill/references/extension-usage-guide.zh-CN.md)
