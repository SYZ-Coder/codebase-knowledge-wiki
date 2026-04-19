# 扩展技能库详细使用说明

本文用于帮助用户快速理解 `cross-tech-stack-spec-skill` 的增强能力、适用场景、开启方式，以及如何在真实项目中选择“全部开启”或“部分开启”。

## 1. 这是什么

`cross-tech-stack-spec-skill` 是一个显式启用的扩展技能。

它不是基础 `backend-service-spec-skill` 的替代品，而是用于以下场景的增强层：

- 移动端项目
- H5 / Web 前端项目
- Python 服务 / worker / task 项目
- App + H5 + Backend + MQ + Callback + Task 混合工作区
- 需要跨页面、客户端、网关、后端、消息系统、第三方依赖一起梳理的项目

## 2. 它增强了什么

相对于基础主流程，这个扩展技能主要增强了两层能力。

### 基础增强层

默认启用扩展技能后，会增强这些能力：

- 工作区分层
- 混合栈噪音控制
- 通信证据等级
- 接口对照页
- 混合栈业务域页
- 增量更新模式

这些能力仍然属于扩展技能的稳定主流程。

### 可选开关增强层

在此之上，还可以继续显式开启更细粒度的 8 个开关：

- `enable_contract_map`
- `enable_gateway_map`
- `enable_field_lineage`
- `enable_context_propagation_map`
- `enable_error_semantics`
- `enable_async_contract_map`
- `enable_external_dependency_dossier`
- `enable_interface_verification_assets`

这些开关默认关闭，只有用户明确要求时才会生效。

## 3. 什么时候使用这个扩展技能

建议在以下情况启用：

- 只用“后端服务”已经不足以描述项目结构
- 需要分析 App/H5/Python/Bridge/Backend 混合链路
- 需要梳理前后端接口对应关系
- 需要梳理跨层通信，例如 HTTP、MQ、Kafka、WebSocket、callback
- 需要沉淀跨团队或第三方依赖档案
- 需要在中央知识库中长期维护混合项目知识

如果仓库本身就是普通后端微服务，并且不存在明显跨技术栈边界，继续使用 `backend-service-spec-skill` 即可。

## 4. 最常用的三种用法

### 只启用扩展技能

适用于纯移动端、纯 H5、纯 Python 项目。

```text
请启用 $cross-tech-stack-spec-skill，分析这个项目。
```

### 基础主流程 + 扩展技能

适用于混合工作区，也是最推荐的写法。

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill 做混合栈适配。
```

### 基础主流程 + 扩展技能 + 可选开关

适用于你已经知道还要更细一层分析的时候。

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_contract_map + enable_field_lineage，对这条链路做细粒度梳理。
```

## 5. 团队标准流程

推荐先阅读：

- [团队标准使用顺序](../../references/team-standard-workflow.zh-CN.md)

这份文档用于说明团队在真实项目里最稳的使用顺序，以及什么时候需要开启可选开关。

## 6. 如何快速开始

如果你是第一次使用，推荐按下面顺序：

1. 先启用扩展技能，不开任何可选开关。
2. 先拿到工作区分层、通信矩阵、接口对照、router-map 等基础结果。
3. 再判断是不是还需要更细的契约、字段、错误、异步、依赖档案。
4. 最后按需开启 1 到 3 个可选开关，而不是一开始全开。

推荐起手命令：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，先做工作区分层、codemap、router-map，并严格按代码证据输出。
```

对应常见产物：

- 工作区分层页
- 通信证据矩阵页
- 接口对照页
- 混合栈关键链路页

## 7. 全部开启怎么用

### 什么叫“全部开启”

这里的“全部开启”是指：

- 启用扩展技能本身
- 同时开启全部 8 个可选开关

也就是：

- `enable_contract_map`
- `enable_gateway_map`
- `enable_field_lineage`
- `enable_context_propagation_map`
- `enable_error_semantics`
- `enable_async_contract_map`
- `enable_external_dependency_dossier`
- `enable_interface_verification_assets`

### 全开适合什么场景

建议只在这些场景使用：

- 高价值核心项目
- 团队要做中央知识库沉淀
- 需要一次性形成比较完整的基线知识包
- 系统链路复杂且跨团队协作频繁

### 全开推荐命令

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets，对该项目做完整增强梳理，并严格按代码证据输出。
```

### 全开时的建议输出顺序

建议输出顺序：

1. 工作区分层页
2. 排除项 / 延后项
3. codemap
4. router-map
5. 接口对照页
6. 契约细化页
7. 字段血缘页
8. 上下文透传页
9. 失败语义页
10. 异步契约页
11. 外部依赖档案页
12. 验证资产页
13. 业务域页

完整命令产物对照请看：

- [命令产物对照](./command-output-map.zh-CN.md)

### 全开的注意事项

不建议把“全开”作为默认习惯。

原因：

- 输出会明显变长
- 对证据完整性要求更高
- 对大工作区来说可能先要做强边界控制
- 很多项目其实只需要其中 2 到 3 个细化页

## 8. 部分开启怎么用

部分开启是最推荐的日常使用方式。

原则是：

- 先跑主流程
- 再针对问题补开特定开关
- 一次通常只开 1 到 3 个最相关的开关

### 联调型场景

适合开：

- `enable_contract_map`
- `enable_field_lineage`
- `enable_interface_verification_assets`

推荐命令：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_contract_map + enable_field_lineage + enable_interface_verification_assets，对这条联调链路做细化梳理。
```

### 网关/BFF 路由不清晰

适合开：

- `enable_gateway_map`
- `enable_context_propagation_map`

推荐命令：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_gateway_map + enable_context_propagation_map，对这条请求链路做细化梳理。
```

### 线上故障/失败链路排查

适合开：

- `enable_error_semantics`
- `enable_context_propagation_map`
- `enable_async_contract_map`

推荐命令：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_error_semantics + enable_context_propagation_map + enable_async_contract_map，对这条故障链路做细化梳理。
```

### Kafka / MQ / callback 系统

适合开：

- `enable_async_contract_map`
- `enable_error_semantics`

推荐命令：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_async_contract_map + enable_error_semantics，对这条异步链路做细化梳理。
```

### 中央知识库 / 依赖治理

适合开：

- `enable_external_dependency_dossier`
- `enable_interface_verification_assets`
- `enable_contract_map`

推荐命令：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_external_dependency_dossier + enable_interface_verification_assets + enable_contract_map，对该项目做知识库型梳理。
```

## 9. 8 个可选开关分别怎么用

### `enable_contract_map`

作用：细化请求/响应契约。
适合：联调、字段解释不清、接口参数复杂。
常见产物：契约细化页、请求参数表、响应字段表。

### `enable_gateway_map`

作用：梳理 gateway/BFF/转发/路径重写。
适合：网关转发复杂、请求路径对不上。
常见产物：网关转发页、route 清单、落点对照页。

### `enable_field_lineage`

作用：追踪关键字段在多层之间的流转。
适合：DTO 很大、字段重命名多、排查字段来源。
常见产物：字段血缘页、字段流转表、rename/transform 记录页。

### `enable_context_propagation_map`

作用：梳理 token/userId/tenantId/traceId 等上下文透传。
适合：登录态、租户态、trace 排障、header 争议。
常见产物：上下文透传页、header 透传表、gap 清单。

### `enable_error_semantics`

作用：梳理错误码、失败路径、重试、降级、补偿。
适合：线上问题、失败链路、异常翻译复杂。
常见产物：失败语义页、错误码映射表、补偿/重试摘要页。

### `enable_async_contract_map`

作用：梳理 producer/topic/consumer/payload/retry/DLQ/幂等。
适合：Kafka/MQ/callback 重场景。
常见产物：异步契约页、producer/topic/consumer 映射页、DLQ/幂等摘要页。

### `enable_external_dependency_dossier`

作用：沉淀第三方或跨团队依赖档案。
适合：知识库、依赖治理、跨团队协作。
常见产物：外部依赖档案页、provider/consumer 清单、风险线索页。

### `enable_interface_verification_assets`

作用：关联 swagger/openapi/postman/mock/contract test 等验证资产。
适合：onboarding、联调准备、测试资料盘点。
常见产物：验证资产页、资产位置清单、覆盖情况页。

## 9. 推荐组合

最常见推荐组合：

- 契约联调组合：`enable_contract_map + enable_field_lineage`
- 网关链路组合：`enable_gateway_map + enable_context_propagation_map`
- 故障排查组合：`enable_error_semantics + enable_context_propagation_map`
- 异步治理组合：`enable_async_contract_map + enable_error_semantics`
- 知识库治理组合：`enable_external_dependency_dossier + enable_interface_verification_assets`

## 10. 默认边界

无论怎么使用，都要遵守这些边界：

- 不显式开启，就不要输出可选页
- 不要把可选页当成默认基线输出
- 不要因为项目复杂就自动全开
- 不要超出代码证据做业务推断
- 如果只有单边证据，要明确标成 unresolved / clue-level only

## 11. 推荐的真实使用顺序

### 首次梳理

1. 先主流程
2. 再补 1 到 3 个最需要的开关
3. 最后再考虑是否做全开基线包

### 长期维护

1. 先用增量更新模式识别 change scope
2. 再决定这次是否需要补开某个开关
3. 只更新受影响页面，不要每次全量重跑

## 12. 最简命令清单

### 最简主流程

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill 做混合栈适配。
```

### 最简全开

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets，对项目做完整增强梳理。
```

### 最简部分开启

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_contract_map + enable_field_lineage，对目标链路做细化梳理。
```

## 13. 建议继续阅读

- [命令产物对照](./command-output-map.zh-CN.md)
- [用法与区别说明](./usage-and-differences.zh-CN.md)
- [可选开关式接口扩展](./optional-switch-controlled-extensions.zh-CN.md)
- [高优先级可选开关模板](./priority-switch-templates.zh-CN.md)





