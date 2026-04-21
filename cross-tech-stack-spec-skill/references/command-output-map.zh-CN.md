# 跨技术栈扩展技能命令产物对照

本文用于说明 `cross-tech-stack-spec-skill` 启用后，稳定主流程与可选开关分别会带来哪些常见产物。

注意：

- 扩展技能不是替代基础主流程，而是增强层
- 不显式开启的可选开关，不应默认输出对应细化页
- 如果只有单边证据，要明确写成 `partially closed`、`clue-level` 或 `unresolved`

## 1. 启用扩展技能但不开任何开关

推荐命令：

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill 做混合栈适配。
```

默认增强产物：

- 工作区分层页
- 混合栈噪音控制页
- 通信证据矩阵页
- 接口对照页
- 混合栈关键链路页
- 混合栈业务域页

## 2. `enable_contract_map`

默认产物：

- 契约细化页
- 请求参数表
- 响应字段表
- caller / handler 契约对照页
- unresolved 字段清单

## 3. `enable_gateway_map`

默认产物：

- 网关/转发链路页
- gateway route 清单
- path rewrite / 鉴权点摘要页
- gateway -> handler 落点对照页

## 4. `enable_field_lineage`

默认产物：

- 字段血缘页
- caller -> DTO -> service -> downstream 字段流转表
- rename / transform 记录页
- unresolved lineage gaps 清单

## 5. `enable_context_propagation_map`

默认产物：

- 上下文透传页
- header / token / userId / tenantId / traceId 透传表
- 注入点与改写点清单
- propagation gap 清单

## 6. `enable_error_semantics`

默认产物：

- 失败语义页
- 错误码/异常映射表
- retry / fallback / compensation 摘要页
- 未闭环失败路径清单

## 7. `enable_async_contract_map`

默认产物：

- 异步契约页
- producer -> topic/queue -> consumer 映射页
- payload/schema 线索页
- retry / DLQ / idempotency 摘要页

## 8. `enable_external_dependency_dossier`

默认产物：

- 外部依赖档案页
- provider / consumer / interface-channel 清单
- owner / version / 风险线索页
- 单边证据依赖清单

## 9. `enable_interface_verification_assets`

默认产物：

- 验证资产页
- swagger/openapi/postman/mock/contract test 位置清单
- 资产覆盖情况页
- 只有声明无验证资产清单

## 10. 全量完整模式时的产物总览

如果使用“基础技能主流程 + 扩展技能 + 8 个开关全开”，常见产物会包括：

- 工作区分层页
- 噪音控制页
- codemap 总图页
- 多份服务纵切页
- 多份 router-map 页
- 接口对照页
- 契约细化页
- 网关转发页
- 字段血缘页
- 上下文透传页
- 失败语义页
- 异步契约页
- 外部依赖档案页
- 验证资产页
- 混合栈业务域页
- 验证页
- 未闭环清单
- 总索引页
