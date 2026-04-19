# Cross Tech Stack Spec Skill

这是一套用于“跨技术栈项目分析”的显式扩展技能。

它适用于那些仅靠后端服务语义已经不够准确的仓库，例如：

- 移动端项目
- H5 / Web 前端项目
- Python 服务 / worker / task 项目
- 同时包含 app、page、bridge、backend、callback、task 的混合栈项目

## 重要说明

这个技能不会替代基础 `backend-service-spec-skill`。
它是一个需要显式开启的扩展层。

普通后端微服务项目，继续使用基础技能即可。
如果是混合栈项目或非后端优先项目，再显式启用这个技能。

## 如何使用

最推荐的表达方式：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill 做混合栈适配。
```

如果是纯移动端 / H5 / Python 项目，也可以直接说：

```text
请启用 $cross-tech-stack-spec-skill，分析这个项目。
```

如果用户希望一次性把基础流程和全部扩展开关都跑完，并分别输出所有产物，可以参考：

- [全量完整模式](../references/full-analysis-mode.zh-CN.md)
- [命令产物对照](./references/command-output-map.zh-CN.md)
- [命令速查表](./references/command-output-scenario-quickref.zh-CN.md)

注意：

- 全量模式会显著增加 token 消耗
- 对大型工作区，也会显著增加扫描时长和产物规模

## 通信梳理可信度说明

当目标包含通信梳理时，这个技能推荐输出“通信矩阵 + 数量依据 + 证据等级 + closure state + 代码位置”，以提高结果可信度。

## 噪音控制说明

当目标是大型混合工作区时，这个技能现在建议先做工作区分层，再显式记录“当前排除项 / 延后项”，避免训练代码、第三方目录、生成物目录淹没业务主链路。

## 接口对照说明

当目标包含“接口链路是否清晰、前后端谁调用谁、调用声明能否对到处理方”时，这个技能现在建议补一页接口对照页。

## 业务域页说明

当目标包含跨技术栈业务域梳理时，这个技能现在建议使用“domain -> entry surfaces -> systems/modules -> rules/specs”的混合栈域页结构，而不是直接复用纯后端的 `domain -> service -> spec`。

## 增量更新说明

当目标不是“从头梳理”，而是“基于已有知识库刷新变化部分”时，这个技能现在支持增量更新思路，建议先明确 change scope，再只更新受影响文档。

## 可选开关扩展说明

如果你需要更细粒度的接口、字段、错误码、上下文透传、跨团队依赖等分析，可以继续开启“可选开关式扩展能力”。这些能力默认关闭，不进入稳定主流程。

## 各命令和开关会产出什么

- 启用扩展技能但不开开关：通常得到工作区分层页、通信证据矩阵页、接口对照页、混合栈关键链路页
- `enable_contract_map`：通常得到契约细化页、请求/响应字段表
- `enable_gateway_map`：通常得到网关/转发链路页
- `enable_field_lineage`：通常得到字段血缘页
- `enable_context_propagation_map`：通常得到上下文透传页
- `enable_error_semantics`：通常得到失败语义页
- `enable_async_contract_map`：通常得到异步契约页
- `enable_external_dependency_dossier`：通常得到外部依赖档案页
- `enable_interface_verification_assets`：通常得到验证资产页

完整对照请看：

- [命令产物对照](./references/command-output-map.zh-CN.md)

## 建议继续阅读

- [详细使用说明](./references/extension-usage-guide.zh-CN.md)
- [命令产物对照](./references/command-output-map.zh-CN.md)
- [命令速查表](./references/command-output-scenario-quickref.zh-CN.md)
- [全量完整模式](../references/full-analysis-mode.zh-CN.md)
- [用法与区别说明](./references/usage-and-differences.zh-CN.md)
- [基础技能与扩展技能边界](./references/base-vs-extension-boundaries.md)
- [Activation And Boundaries](./references/activation-and-boundaries.md)
- [工作区分层模板](./references/workspace-layering-template.md)
- [混合栈噪音排除指南](./references/mixed-stack-noise-exclusion-guide.md)
- [接口对照模板](./references/interface-mapping-template.md)
- [混合栈业务域页指南](./references/mixed-stack-domain-mapping-guidelines.md)
- [增量更新模式](./references/incremental-update-mode.md)
- [可选开关式接口扩展](./references/optional-switch-controlled-extensions.zh-CN.md)
- [优先开关模板索引](./references/priority-switch-templates.zh-CN.md)
- [契约细化模板](./references/contract-map-template.md)
- [网关转发模板](./references/gateway-map-template.md)
- [字段血缘模板](./references/field-lineage-template.md)
- [上下文透传模板](./references/context-propagation-map-template.md)
- [失败语义模板](./references/error-semantics-map-template.md)
- [异步契约模板](./references/async-contract-map-template.md)
- [外部依赖档案模板](./references/external-dependency-dossier-template.md)
- [验证资产模板](./references/interface-verification-assets-template.md)
- [Mobile Project Guidelines](./references/mobile-project-guidelines.md)
- [H5 Project Guidelines](./references/h5-project-guidelines.md)
- [Python Project Guidelines](./references/python-project-guidelines.md)
- [Mixed Stack Routing Guidelines](./references/mixed-stack-routing-guidelines.md)
- [Communication Matrix Guidelines](./references/communication-matrix-guidelines.md)
- [通信证据等级](./references/communication-evidence-levels.md)
- [升级清单](./references/upgrade-roadmap.zh-CN.md)

