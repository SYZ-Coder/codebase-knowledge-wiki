# Backend And Cross-Tech-Stack Spec Skill Library

这是一个面向代码知识梳理、旧系统理解、中央知识库建设、混合项目分析的开源技能库。

它基于 `zread` 与 `sdd-riper` 的部分原理思路进行吸收、升级与增强，进一步演进为一套更适合团队项目长期使用的技能库，用于支撑项目知识复用、跨服务分析、混合栈梳理与中央知识库维护。

当前技能库统一维护两套平级技能：

1. `backend-service-spec-skill`
2. `cross-tech-stack-spec-skill`

这样做的目的，是把“偏服务端 / 微服务知识梳理能力”和“跨技术栈扩展能力”放在同一个仓库中维护，方便开源发布、团队使用和统一阅读。

## 重要说明

当前仓库中的基础技能与扩展技能，都已经直接使用各自的正式名称：

- `backend-service-spec-skill`
- `cross-tech-stack-spec-skill`

也就是说，用户现在应直接使用正式技能名下命令。

例如：

```text
请用 backend-service-spec-skill 梳理这个后端微服务项目。
```

## 快速入口

如果你是第一次接触这个仓库，建议按下面的顺序阅读：

1. 先看本文档，了解仓库里有哪些技能、适用边界和常见命令入口。
2. 如果你的目标是后端 / 微服务 / 旧系统梳理，继续看 [Backend Service Spec Skill 详细说明](./backend-service-spec-skill/README.zh-CN.md)。
3. 如果你的项目是 App、H5、Python 或混合工作区，再继续看 [Cross Tech Stack Spec Skill 详细说明](./cross-tech-stack-spec-skill/README.zh-CN.md)。

如果你只想先知道 `backend-service-spec-skill` 最常用的命令和用途，可以先看下面这张总览表，再决定是否进入子目录阅读全文。

## `backend-service-spec-skill` 命令总览

这是仓库里最常用的一套基础技能，适合后端系统、微服务系统、旧系统和平台型服务仓库。

### 1. `create_codemap`

适合什么时候用：

- 你刚接手一个系统，想先看整体服务版图
- 你还不确定应该优先深入哪些服务

通常会产出：

- 服务清单
- 服务职责边界
- 上下游依赖关系
- 服务级总览图

详细说明：

- [Backend Service Spec Skill README](./backend-service-spec-skill/README.zh-CN.md)
- [命令产物对照](./backend-service-spec-skill/references/command-output-map.zh-CN.md)

### 2. `service_deep_dive`

适合什么时候用：

- 你已经锁定了一个关键服务
- 你要纵向梳理接口、模块、依赖、职责边界

通常会产出：

- 单服务结构页
- 接口清单
- 依赖关系页
- 服务规范页

详细说明：

- [Backend Service Spec Skill README](./backend-service-spec-skill/README.zh-CN.md)
- [快速上手](./backend-service-spec-skill/references/quick-start.zh-CN.md)

### 3. `crate_router_map`

适合什么时候用：

- 你想追一条真实请求链路或消息链路
- 你需要把同步调用、异步消息、补偿链路拆开看

通常会产出：

- 关键链路页
- 同步 / 异步分段页
- 闭环状态页

详细说明：

- [Backend Service Spec Skill README](./backend-service-spec-skill/README.zh-CN.md)
- [命令速查表](./backend-service-spec-skill/references/command-output-scenario-quickref.zh-CN.md)

### 4. `build_domain_map`

适合什么时候用：

- 你已经有了一些服务级事实，准备上升到业务域层面
- 你要为团队中央知识库沉淀较稳定的结构化知识

通常会产出：

- 业务域页
- 域到服务映射页
- 域级规则页

详细说明：

- [Backend Service Spec Skill README](./backend-service-spec-skill/README.zh-CN.md)
- [从 `mydocs` 到项目中央知识库](./references/mydocs-to-central-knowledge-repo.zh-CN.md)

## 推荐阅读路径

如果你只想快速使用：

1. 看 [服务端技能快速上手](./backend-service-spec-skill/references/quick-start.zh-CN.md)
2. 看 [服务端技能命令速查表](./backend-service-spec-skill/references/command-output-scenario-quickref.zh-CN.md)
3. 按需回到 [Backend Service Spec Skill README](./backend-service-spec-skill/README.zh-CN.md) 看完整说明

如果你想系统理解：

1. 先读本文档
2. 再读 [Backend Service Spec Skill README](./backend-service-spec-skill/README.zh-CN.md)
3. 再读 [服务端技能使用指南](./backend-service-spec-skill/references/usage-guide.md)
4. 如果是混合栈项目，再读 [Cross Tech Stack Spec Skill README](./cross-tech-stack-spec-skill/README.zh-CN.md)

## 场景导航表

如果你不确定该从哪个命令开始，可以先按场景选入口：

| 你的场景 | 推荐命令 / 用法 | 先看哪里 |
| --- | --- | --- |
| 刚接手一个后端或微服务仓库，想先看全局 | `create_codemap` | [服务端技能 README](./backend-service-spec-skill/README.zh-CN.md) |
| 已经锁定一个关键服务，想做纵向梳理 | `service_deep_dive` | [快速上手](./backend-service-spec-skill/references/quick-start.zh-CN.md) |
| 想跟一条真实请求链路或消息链路 | `crate_router_map` | [命令速查表](./backend-service-spec-skill/references/command-output-scenario-quickref.zh-CN.md) |
| 想把多服务事实沉淀成业务域知识 | `build_domain_map` | [命令产物对照](./backend-service-spec-skill/references/command-output-map.zh-CN.md) |
| 项目是 App、H5、Python 或混合工作区 | `backend-service-spec-skill` + `$cross-tech-stack-spec-skill` | [扩展技能 README](./cross-tech-stack-spec-skill/README.zh-CN.md) |
| 想快速抄一条可直接发给 Codex 的提示词 | 直接复用根 README 里的“快速命令”区块 | [快速命令](#快速命令) |
| 想系统掌握完整使用方法 | 先看根 README，再进子技能 README 与 usage guide | [推荐阅读路径](#推荐阅读路径) |

## 一句话选型

- 看整体版图：先用 `create_codemap`
- 看单个关键服务：先用 `service_deep_dive`
- 看跨服务真实链路：先用 `crate_router_map`
- 看稳定业务域沉淀：最后用 `build_domain_map`
- 看混合栈项目：以 `backend-service-spec-skill` 为主流程，再启用 `$cross-tech-stack-spec-skill`

## 开源配套文件

当前仓库也补充了与技能使用直接相关的配套文档：

- [License](./LICENSE)
- [安装指南](./references/installation-guide.zh-CN.md)
- [从 `mydocs` 到项目中央知识库](./references/mydocs-to-central-knowledge-repo.zh-CN.md)
- [中央知识库与 OpenSpec 协同规则](./references/knowledge-repo-and-openspec-collaboration.zh-CN.md)

同时也补充了面向其他 AI 开发工具的通用接入说明，只要工具支持规则、指令、prompt 或文档上下文，就可以按通用方式接入本仓库。

如果你最关心“技能产物怎么落到中央知识库”，最短路径是：

1. 先看 [从 `mydocs` 到项目中央知识库](./references/mydocs-to-central-knowledge-repo.zh-CN.md)
2. 再看 [中央知识库与 OpenSpec 协同规则](./references/knowledge-repo-and-openspec-collaboration.zh-CN.md)

## 仓库结构

### 1. 服务端基础技能

位置：

- `./backend-service-spec-skill/`

这个技能适用于：

- 旧系统
- 微服务系统
- 平台型后端仓库
- 服务家族级知识梳理

核心能力：

- 跨服务 `create_codemap`
- 跨服务 `build_domain_map`
- `crate_router_map`
- `service_deep_dive`

建议阅读：

- [服务端技能快速上手](./backend-service-spec-skill/references/quick-start.zh-CN.md)
- [服务端技能命令产物对照](./backend-service-spec-skill/references/command-output-map.zh-CN.md)
- [服务端技能命令速查表](./backend-service-spec-skill/references/command-output-scenario-quickref.zh-CN.md)
- [服务端技能元数据](./backend-service-spec-skill/SKILL.md)
- [服务端技能使用指南](./backend-service-spec-skill/references/usage-guide.md)
- [服务端技能 README](./backend-service-spec-skill/README.zh-CN.md)

### 2. 跨技术栈扩展技能

位置：

- `./cross-tech-stack-spec-skill/`

这个技能适用于：

- 移动端项目
- H5 / Web 前端项目
- Python worker / task / service 项目
- App + H5 + Backend + MQ + Callback + Task 混合工作区
- 需要跨页面、网关、后端、消息系统一起梳理的场景

核心增强：

- 工作区分层
- 混合栈噪音控制
- 通信证据等级
- 接口对照页
- 混合栈业务域页
- 增量更新模式
- 8 个可选开关式深度增强页

建议阅读：

- [扩展技能元数据](./cross-tech-stack-spec-skill/SKILL.md)
- [扩展技能详细使用说明](./cross-tech-stack-spec-skill/references/extension-usage-guide.zh-CN.md)
- [扩展技能命令产物对照](./cross-tech-stack-spec-skill/references/command-output-map.zh-CN.md)
- [扩展技能命令速查表](./cross-tech-stack-spec-skill/references/command-output-scenario-quickref.zh-CN.md)
- [全量完整模式](./references/full-analysis-mode.zh-CN.md)
- [可选开关式扩展说明](./cross-tech-stack-spec-skill/references/optional-switch-controlled-extensions.zh-CN.md)
- [扩展技能 README](./cross-tech-stack-spec-skill/README.zh-CN.md)

## 怎么选择使用哪套技能

### 只用 `backend-service-spec-skill`

适合：

- 仓库本身就是后端 / 微服务导向
- 用“服务”就足够描述结构
- 不需要跨技术栈适配

### 启用 `cross-tech-stack-spec-skill`

适合：

- 仓库是移动端、H5、Python 或混合工作区
- 需要分析前端、网关、后端、MQ、callback 等跨层链路
- 只用后端服务语义会造成失真

### `backend-service-spec-skill` + 扩展技能一起用

适合：

- 仍然以服务端基础技能为主流程
- 但需要跨技术栈扩展技能做混合栈适配

推荐命令：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill 做混合栈适配。
```

## 快速命令

### 只用服务端基础技能

```text
请用 backend-service-spec-skill 梳理这个后端微服务项目。
```

### 服务端基础技能轻量全量

```text
请用 backend-service-spec-skill 对这个后端微服务项目做一轮轻量全量分析。
要求：
1. 先做范围识别
2. 再做 create_codemap
3. 再对 1 到 2 个高价值服务做 service_deep_dive
4. 再对 1 到 2 条关键链路做 crate_router_map
5. 严格按代码事实输出
```

### 服务端基础技能重型全量

```text
请用 backend-service-spec-skill 对这个后端微服务项目做一轮重型全量分析。
要求：
1. 先做范围识别
2. 再做 create_codemap
3. 对多个高价值服务做 service_deep_dive
4. 对多条关键链路做 crate_router_map
5. 最后做 build_domain_map
6. 输出验证页与未闭环清单
7. 严格按代码事实输出
```

### 只用扩展技能

```text
请启用 $cross-tech-stack-spec-skill，分析这个混合栈项目。
```

### 服务端基础技能 + 扩展技能

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill 做混合栈适配。
```

### 扩展技能全开

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets，对项目做完整增强梳理。
```

### 全量完整模式

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，
同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets，
对项目做一次全量完整分析，并为所有能力分别输出产物文档。
```

提示：

- 全量模式会显著增加 token 消耗、扫描时长和产物数量
- 更详细说明见：[全量完整模式](./references/full-analysis-mode.zh-CN.md)

## 推荐阅读顺序

- [团队标准使用顺序](./references/team-standard-workflow.zh-CN.md)
- [全量完整模式](./references/full-analysis-mode.zh-CN.md)
- [从 `mydocs` 到项目中央知识库](./references/mydocs-to-central-knowledge-repo.zh-CN.md)
- [中央知识库与 OpenSpec 协同规则](./references/knowledge-repo-and-openspec-collaboration.zh-CN.md)
- [场景化命令合集](./references/scenario-command-recipes.zh-CN.md)
- [按接口或功能查看完整链路](./references/full-chain-by-interface-or-feature.zh-CN.md)
- [锚点选择表](./references/anchor-selection-guide.zh-CN.md)

1. 先读服务端基础技能快速上手。
2. 再读服务端基础技能 README 或使用指南。
3. 如果项目是混合栈，再读扩展技能 README。
4. 如果还需要更细粒度接口分析，再读扩展技能详细使用说明。

## 统一导航

- [团队标准使用顺序](./references/team-standard-workflow.zh-CN.md)
- [场景化命令合集](./references/scenario-command-recipes.zh-CN.md)
- [按接口或功能查看完整链路](./references/full-chain-by-interface-or-feature.zh-CN.md)
- [锚点选择表](./references/anchor-selection-guide.zh-CN.md)

### 服务端基础技能

- [服务端技能快速上手](./backend-service-spec-skill/references/quick-start.zh-CN.md)
- [个人使用流程（偏微服务后端）](./backend-service-spec-skill/references/personal-workflow.zh-CN.md)
- [服务端技能命令产物对照](./backend-service-spec-skill/references/command-output-map.zh-CN.md)
- [服务端技能命令速查表](./backend-service-spec-skill/references/command-output-scenario-quickref.zh-CN.md)
- [服务端技能元数据](./backend-service-spec-skill/SKILL.md)
- [服务端技能使用指南](./backend-service-spec-skill/references/usage-guide.md)
- [服务端技能质量清单](./backend-service-spec-skill/references/quality-checklist.md)

### 跨技术栈扩展技能

- [扩展技能 README](./cross-tech-stack-spec-skill/README.zh-CN.md)
- [扩展技能详细使用说明](./cross-tech-stack-spec-skill/references/extension-usage-guide.zh-CN.md)
- [扩展技能命令产物对照](./cross-tech-stack-spec-skill/references/command-output-map.zh-CN.md)
- [扩展技能命令速查表](./cross-tech-stack-spec-skill/references/command-output-scenario-quickref.zh-CN.md)
- [可选开关式扩展说明](./cross-tech-stack-spec-skill/references/optional-switch-controlled-extensions.zh-CN.md)
- [高优先级开关模板索引](./cross-tech-stack-spec-skill/references/priority-switch-templates.zh-CN.md)
