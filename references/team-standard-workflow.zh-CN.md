# 团队标准使用顺序

本文是技能库的通用团队使用标准，用于指导团队在真实项目中如何稳定、可信地使用基础技能与扩展技能。

目标不是默认把所有功能一次开满，而是：

- 先建立可靠边界
- 再逐层加深分析
- 始终保持严格按事实、按证据分级输出

## 1. 推荐总原则

### 1.1 默认顺序

推荐顺序：

1. 先做工作区分层
2. 再做单服务纵切
3. 再做跨服务 `create_codemap`
4. 再做 `crate_router_map`
5. 最后再做业务域页
6. 只有在明确问题场景下，再开启可选开关

### 1.2 不推荐顺序

不推荐一上来就：

- 全开所有开关
- 直接先写业务域页
- 没有边界就做字段血缘
- 没有明确 gateway 证据就做 gateway map

这样很容易导致：

- 输出膨胀
- 混入线索级内容
- 把结构梳理变成猜测性归纳

## 2. 标准使用流程

### 第 1 步：工作区分层

适用场景：

- 仓库是混合工作区
- 同时存在 `app / h5 / backend / python`
- 仓库很大，噪音很多

输出目标：

- 工作区分层页
- 代表性样本清单
- `in scope / delayed / excluded / clue-only`

作用：

- 给后续扫描建立边界
- 降低噪音
- 防止一锅扫

### 第 2 步：单服务纵切

适用场景：

- 先把高价值服务吃透
- 后续还要做跨服务或业务域页

输出目标：

- 服务总图
- 控制器/接口清单
- 包结构与职责
- 依赖关系
- 关键规范与技术特征

作用：

- 为后续跨服务梳理提供事实基础
- 为业务域页提供更可靠的服务级素材

### 第 3 步：跨服务 `create_codemap`

适用场景：

- 想从服务视角看一组相关系统
- 想看服务族的调用面和结构关系

输出目标：

- 服务族总图
- 服务职责对照
- 主要同步/异步能力分布
- Feign / controller / MQ / SSE / WS 能力分布

作用：

- 建立跨服务骨架
- 为后续 router-map 提供链路入口

### 第 4 步：`crate_router_map`

适用场景：

- 想确认“谁调用谁”
- 想看一条请求如何跨层、跨服务流转

输出目标：

- 同步调用链
- 异步通信链
- 证据等级
- 未闭环点

作用：

- 给联调和排障提供最直接的上下文

### 第 5 步：业务域页

适用场景：

- 团队已经有若干服务级、链路级文档
- 希望把零散知识提升到可复用上下文层

推荐前提：

- 最好已经做过单服务纵切
- 最好已经做过至少一轮跨服务 codemap

输出目标：

- `domain -> entry surfaces -> systems/services/modules -> rules/specs`

作用：

- 适合团队中央知识库沉淀
- 适合新人快速理解一组系统共同解决什么问题

## 3. 可选开关怎么用

### 3.1 默认不要全开

除非场景非常明确，否则不建议默认全开 8 个开关。

推荐做法：

- 先完成基础 4 步
- 再根据问题选择 1 到 3 个最相关开关

### 3.2 推荐优先级

第一优先：

- `enable_contract_map`
- `enable_context_propagation_map`
- `enable_error_semantics`

第二优先：

- `enable_async_contract_map`
- `enable_interface_verification_assets`

第三优先：

- `enable_field_lineage`
- `enable_external_dependency_dossier`
- `enable_gateway_map`

### 3.3 适合开启的典型场景

联调型场景：

- `enable_contract_map`
- `enable_field_lineage`
- `enable_interface_verification_assets`

网关/BFF 路由不清晰：

- `enable_gateway_map`
- `enable_context_propagation_map`

线上故障/失败链路排查：

- `enable_error_semantics`
- `enable_context_propagation_map`
- `enable_async_contract_map`

Kafka / MQ / callback 系统：

- `enable_async_contract_map`
- `enable_error_semantics`

中央知识库 / 依赖治理：

- `enable_external_dependency_dossier`
- `enable_interface_verification_assets`
- `enable_contract_map`

## 4. 团队最推荐的 3 种用法

### 用法 A：服务知识沉淀

顺序：

1. 工作区分层
2. 单服务纵切
3. 跨服务 codemap
4. 业务域页

### 用法 B：联调 / 排障

顺序：

1. 单服务纵切
2. `crate_router_map`
3. 视情况开启 `enable_contract_map`
4. 视情况开启 `enable_context_propagation_map`
5. 视情况开启 `enable_error_semantics`

### 用法 C：异步与实时通信专项

顺序：

1. 单服务纵切
2. `crate_router_map`
3. 开启 `enable_async_contract_map`
4. 开启 `enable_error_semantics`
5. 必要时开启 `enable_context_propagation_map`

## 5. 最终建议

最稳的团队使用方式是：

1. 先分层
2. 先吃透高价值服务
3. 再画跨服务骨架
4. 再对真实链路做 router-map
5. 最后才提升到业务域
6. 开关能力永远按问题开启，不默认全开

