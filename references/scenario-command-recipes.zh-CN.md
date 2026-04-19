# 场景化命令合集

本文提供一组可直接复制的高频命令模板，帮助用户在不同场景下更快使用技能库。

## 1. 第一次进入后端微服务项目

```text
请用 backend-service-spec-skill 对这个后端微服务项目做一轮轻量全量分析。
要求：
1. 先做范围识别
2. 再做 create_codemap
3. 再对 1 到 2 个高价值服务做 service_deep_dive
4. 再对 1 到 2 条关键链路做 crate_router_map
5. 严格按代码事实输出
```

## 2. 想沉淀一套后端知识库基线

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

## 3. 项目是 App/H5/Python/Backend 混合工作区

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill 做混合栈适配。
要求：
1. 先做工作区分层
2. 再做 create_codemap
3. 再做关键服务 service_deep_dive
4. 再做关键链路 crate_router_map
5. 严格按代码证据输出
```

## 4. 前后端联调

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，
同时开启 enable_contract_map + enable_field_lineage + enable_interface_verification_assets，
对这条联调链路做细化梳理，并输出接口参数、字段流转、验证资产位置。
```

## 5. Gateway/BFF 路由不清晰

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，
同时开启 enable_gateway_map + enable_context_propagation_map，
对这条请求链路做细化梳理，并输出网关转发、上下文透传、最终处理落点。
```

## 6. Kafka / MQ / callback 系统

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，
同时开启 enable_async_contract_map + enable_error_semantics，
对这条异步链路做细化梳理，并输出 producer、topic、consumer、payload、retry、DLQ、补偿信息。
```

## 7. 想按某个接口追完整链路

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，
同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_async_contract_map + enable_external_dependency_dossier，
围绕接口 <接口路径或接口方法名> 做完整链路梳理。
要求：
1. 从 caller 入口开始
2. 识别网关/BFF/Controller/Service/Feign/HTTP/MQ/Kafka
3. 输出接口参数、地址、字段流转、上下文透传、外部依赖、topic 及生产消费关系
4. 严格区分 closed / partially closed / clue-level / unresolved
```

## 8. 想按某个业务功能追完整链路

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，
同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets，
围绕功能 <功能名称> 做完整链路梳理。
要求：
1. 从功能入口页面或接口开始
2. 输出涉及的前端/网关/后端/外部服务/MQ/Kafka 链路
3. 输出接口参数、地址、topic、生产者、消费者、失败路径、验证资产
4. 严格按代码事实输出
```

## 9. 团队中央知识库持续维护

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，
基于已有知识库做增量更新。
要求：
1. 先识别 change scope
2. 只更新受影响文档
3. 如本次涉及接口链路，再按需开启相关开关
4. 输出本轮新增证据与未重新验证范围
```

## 10. 一次性全开全部能力

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，
同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets，
对项目做一次全量完整分析，并为所有能力分别输出产物文档。
```

注意：

- 全量模式会显著增加 token 消耗
- 大型工作区建议优先使用分阶段方式
