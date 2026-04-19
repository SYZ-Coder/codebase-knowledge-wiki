# 高优先级可选开关模板

本文收拢当前最值得优先实现的八个可选开关扩展。

它们都保持：

- 显式开启
- 默认关闭
- 不进入稳定主流程

## 1. `enable_contract_map`

适用场景：

- 请求/响应契约复杂
- 前后端联调高度依赖字段级清晰度
- 必填/可选/枚举/未闭环字段需要明确区分

模板入口：

- `references/contract-map-template.md`

推荐命令：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_contract_map，对这条接口链路做契约细化梳理。
```

输出重点：

- request field table
- response field table
- enum source note
- unresolved field note

## 2. `enable_gateway_map`

适用场景：

- gateway / BFF 层让请求路径难以追踪
- path rewrite / forward 逻辑很重
- 鉴权关口或转发层阻碍接口理解

模板入口：

- `references/gateway-map-template.md`

推荐命令：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_gateway_map，对这条请求链路做网关转发梳理。
```

输出重点：

- gateway route table
- rewrite / forward chain
- auth and policy checkpoints
- unresolved routing gaps

## 3. `enable_field_lineage`

适用场景：

- 关键字段跨前端、DTO、服务层、消息体多次变形
- 字段重命名或转换点影响理解
- 团队经常需要追查某个字段究竟来自哪里、流向哪里

模板入口：

- `references/field-lineage-template.md`

推荐命令：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_field_lineage，对这条链路中的关键字段流转做细化梳理。
```

输出重点：

- critical field list
- field lineage table
- transformation and rename notes
- unresolved lineage gaps

## 4. `enable_context_propagation_map`

适用场景：

- token、userId、tenantId、traceId 等上下文在多层之间透传复杂
- 网关、拦截器、中间件会注入或改写 header/context
- 跨团队接口经常出现“谁传了、谁没传、在哪丢了”这类问题

模板入口：

- `references/context-propagation-map-template.md`

推荐命令：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_context_propagation_map，对这条链路中的鉴权与上下文透传做细化梳理。
```

输出重点：

- critical context items
- header/context propagation table
- injection and rewrite points
- unresolved propagation gaps

## 5. `enable_error_semantics`

适用场景：

- 错误码、异常、HTTP 状态、回调失败等失败信号跨多层传播
- 重试、降级、补偿逻辑影响业务理解或排障
- 团队需要确认失败到底在哪一层被抛出、翻译、吞掉或兜底

模板入口：

- `references/error-semantics-map-template.md`

推荐命令：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_error_semantics，对这条链路中的失败语义与错误处理做细化梳理。
```

输出重点：

- error code table
- failure path notes
- retry / fallback / compensation notes
- unresolved failure gaps

## 6. `enable_async_contract_map`

适用场景：

- Kafka、MQ、callback 等异步链路是系统关键路径
- 团队需要明确 producer、topic/queue、consumer、payload、重试、DLQ、幂等逻辑
- 异步链路问题影响联调、排障或知识沉淀

模板入口：

- `references/async-contract-map-template.md`

推荐命令：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_async_contract_map，对这条异步链路的契约与处理规则做细化梳理。
```

输出重点：

- producer -> topic/queue -> consumer table
- payload schema notes
- retry / DLQ / idempotency notes
- unresolved async gaps

## 7. `enable_external_dependency_dossier`

适用场景：

- 需要梳理第三方系统、平台团队、底层公共能力之间的依赖边界
- 团队希望沉淀“谁提供、谁消费、契约在哪、owner 线索是什么、风险是什么”
- 中央知识库需要依赖档案而不只是调用链路

模板入口：

- `references/external-dependency-dossier-template.md`

推荐命令：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_external_dependency_dossier，对跨团队与第三方依赖做档案化梳理。
```

输出重点：

- provider/consumer dossier table
- contract and owner clues
- version/risk/change notes
- unresolved dependency gaps

## 8. `enable_interface_verification_assets`

适用场景：

- 团队需要把 swagger/openapi/postman/apifox/mock/contract test 等验证资产与接口知识关联起来
- onboarding、联调、知识库维护需要快速找到验证入口
- 需要识别哪些接口有验证资产、哪些只有文档或代码而缺验证材料

模板入口：

- `references/interface-verification-assets-template.md`

推荐命令：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，同时开启 enable_interface_verification_assets，对这条链路相关的验证资产做梳理。
```

输出重点：

- verification asset inventory
- coverage and gap notes
- sample request or mock clues
- unresolved verification gaps

## 9. 安全提醒

这几个开关都不能隐式开启。

如果用户没有明确要求：

- 不要默认补这几页
- 不要改变当前稳定基线输出
- 不要把它们并进主流程

