# 可选开关式接口扩展能力

本文用于整理“前后端、客户端、其他团队之间接口通信”的更细粒度扩展能力。

这些能力都应该保持：

- 默认关闭
- 显式开启
- 按需使用
- 不进入当前稳定主流程

## 1. 设计原则

这批能力不是默认能力，而是可选扩展包。

它们的目标是：

- 在需要时把接口通信梳理得更细
- 不污染当前已经稳定的混合栈技能主流程
- 让团队可以按项目复杂度逐步开启

## 2. 推荐开关

### `enable_contract_map`

作用：

- 更细地梳理请求/响应契约
- 记录必填字段、可选字段、枚举值、未闭环字段

适合输出：

- request field table
- response field table
- enum source note
- unresolved field note

适合场景：

- 前后端联调
- 参数语义不清
- 契约型接口较多

### `enable_gateway_map`

作用：

- 梳理 gateway、BFF、转发、path rewrite、鉴权关口和最终落点

适合输出：

- gateway route table
- rewrite chain
- auth / traffic-control checkpoints
- final destination note

适合场景：

- 多团队协作
- 请求路径对不上
- 网关/BFF 层较重

### `enable_field_lineage`

作用：

- 追踪重要字段从 caller DTO、handler DTO、service model、message payload 到下游契约的流转

适合输出：

- field lineage table
- transformation points
- name mismatch notes

适合场景：

- DTO 很大
- 字段命名不统一
- 经常需要追查字段来源

### `enable_context_propagation_map`

作用：

- 梳理 token、userId、tenantId、traceId、device info 等上下文透传
- 记录哪些层在注入、改写、透传或丢失这些上下文

适合输出：

- header/context propagation table
- auth/context injection points
- trace context path
- unresolved propagation gaps

适合场景：

- 登录态问题
- trace 链路排障
- 租户上下文问题
- 跨团队 header 规范统一

### `enable_error_semantics`

作用：

- 梳理错误码、异常、HTTP 状态、回调失败等失败语义
- 记录重试、降级、超时、补偿、吞错、翻译错误码等处理点

适合输出：

- error code table
- failure path notes
- retry / fallback / compensation notes
- unresolved failure gaps

适合场景：

- 线上问题排查
- 失败行为不清晰
- 跨团队排障
- 多层错误翻译或兜底逻辑复杂

### `enable_async_contract_map`

作用：

- 在 topic 级之上继续下钻到 producer、consumer、payload、重试、DLQ、幂等等异步契约细节
- 也可用于 callback / webhook / event bus 这类异步链路

适合输出：

- producer -> topic/queue -> consumer table
- payload schema notes
- retry / DLQ / idempotency notes
- unresolved async gaps

适合场景：

- Kafka / MQ 系统重
- callback 很多
- 异步链路难排查
- 团队需要沉淀异步契约知识

### `enable_external_dependency_dossier`

作用：

- 为外部团队、平台能力或第三方系统建立依赖档案
- 记录 provider、consumer、契约位置、owner 线索、版本与风险说明

适合输出：

- provider/consumer dossier table
- contract and owner clues
- version/risk/change notes
- unresolved dependency gaps

适合场景：

- 中央知识库
- 依赖盘点
- 跨团队 onboarding
- 第三方依赖治理

### `enable_interface_verification_assets`

作用：

- 把 swagger/openapi/postman/apifox/mock/contract test 等验证资产与接口知识关联起来
- 识别哪些接口有验证入口、哪些只有文档或代码而缺验证材料

适合输出：

- verification asset inventory
- coverage and gap notes
- sample request or mock clues
- unresolved verification gaps

适合场景：

- onboarding
- 联调准备
- 中央知识库长期维护
- 测试资料盘点

## 3. 开启规则

这些开关都不应该自动开启。

推荐只在用户显式要求时使用，例如：

- `enable_contract_map`
- `enable_gateway_map`
- `enable_field_lineage`
- `enable_context_propagation_map`
- `enable_error_semantics`
- `enable_async_contract_map`
- `enable_external_dependency_dossier`
- `enable_interface_verification_assets`

## 4. 推荐命令写法

示例：

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_contract_map + enable_field_lineage，对这条集成链路做细粒度梳理。
```

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_context_propagation_map，对这条链路中的鉴权与上下文透传做细化梳理。
```

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_error_semantics，对这条链路中的失败语义与错误处理做细化梳理。
```

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_async_contract_map，对这条异步链路的契约与处理规则做细化梳理。
```

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_external_dependency_dossier，对跨团队与第三方依赖做档案化梳理。
```

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_interface_verification_assets，对这条链路相关的验证资产做梳理。
```

## 5. 安全边界

这些开关不能改变默认输出。

如果用户没有显式开启：

- 不要默认补这些深度页
- 不要扩展当前稳定主流程
- 不要改变现有已稳定的基线输出

## 6. 当前已落地的优先模板

目前已经先落地八类高优先开关模板，供显式开启时使用：

- [契约细化模板](./contract-map-template.md)
- [网关转发模板](./gateway-map-template.md)
- [字段血缘模板](./field-lineage-template.md)
- [上下文透传模板](./context-propagation-map-template.md)
- [失败语义模板](./error-semantics-map-template.md)
- [异步契约模板](./async-contract-map-template.md)
- [外部依赖档案模板](./external-dependency-dossier-template.md)
- [验证资产模板](./interface-verification-assets-template.md)
- [优先模板索引](./priority-switch-templates.zh-CN.md)

注意：这些模板仍然属于可选扩展，不属于默认输出。

## 7. 推荐实现优先级

如果后续逐步实现，建议顺序是：

1. `enable_contract_map`
2. `enable_gateway_map`
3. `enable_field_lineage`
4. `enable_context_propagation_map`
5. `enable_error_semantics`
6. `enable_async_contract_map`
7. `enable_external_dependency_dossier`
8. `enable_interface_verification_assets`
