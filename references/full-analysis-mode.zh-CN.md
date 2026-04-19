# 全量完整模式

## 目的

当用户希望一次性对一个项目做尽可能完整的分析，并且希望基础技能与扩展技能的全部能力都生成对应产物时，可以使用“全量完整模式”。

这个模式适合：

- 前后端一体项目
- App + H5 + Backend + MQ + SSE/WebSocket 混合项目
- 大型微服务工作区
- 需要把基础产物与所有接口扩展产物一次性生成出来的场景

## 重要提醒

全量完整模式会显著增加：

- token 消耗
- 扫描时长
- 产物文档数量
- 需要人工复核的内容规模

对于大型工作区，全量模式通常不是轻量操作。用户在启用前，应接受以下事实：

1. “全量模式”表示把全部技能能力和扩展开关都跑一遍。
2. “全量模式”不等于保证所有链路 100% 闭环。
3. 对无法闭环的部分，仍然必须标注为：
   - `partially closed`
   - `clue-level`
   - `unresolved`

## 执行原则

全量完整模式建议理解为：

- 能力层面全开
- 执行层面分阶段

也就是说：

- 可以把基础技能与全部扩展开关都纳入一次任务目标
- 但不建议把所有能力在第一步混在一起直接全仓深扫到底

对于大型项目，更稳的做法通常不是“一锅扫完”，而是“按阶段逐步加深”。

## 为什么建议分多阶段

### 1. 分层后再深扫，边界更准

如果项目同时包含：

- App
- H5
- Gateway
- Backend 微服务
- MQ / Kafka
- SSE / WebSocket
- Python worker / task / service

那么直接全量混扫，很容易把：

- 目录存在
- 文件命中
- 配置线索

误写成已经闭环的真实调用链路。

### 2. 先广扫再闭环，更符合事实

全量模式下，第一轮更适合先拿到：

- 工作区清单
- 技术栈分层
- 通信证据矩阵
- 高信号项目清单

然后再进入：

- caller -> callee
- route -> handler
- producer -> topic -> consumer

这类闭环追踪。

### 3. 扩展开关并不是同一时机最有效

例如：

- `enable_contract_map` 更适合在接口对照已经初步建立后开启
- `enable_gateway_map` 更适合在确认 gateway 存在且入口明确后开启
- `enable_field_lineage` 更适合在关键链路已经收敛后开启
- `enable_external_dependency_dossier` 更适合在服务依赖热点已经识别出来后开启

因此，全量模式不代表“所有扩展开关第一秒一起深挖”，而是“所有扩展开关都进入总任务范围，并按合适阶段输出”。

### 4. 分阶段通常更省 token

看起来“多阶段”像是更慢，但在大型工作区里通常反而更省：

- 先筛高信号区域
- 再把深度分析用在最值得的链路上

这样比直接对全仓每个角落都做同深度扫描，更可控，也更少返工。

## 推荐命令

```text
请以 [$backend-service-spec-skill](../backend-service-spec-skill/SKILL.md) 为主流程，
同时启用 [$cross-tech-stack-spec-skill](../cross-tech-stack-spec-skill/SKILL.md)，
对目标项目做一次全量完整分析。

要求：
1. 严格按照团队标准使用顺序执行：
   工作区分层 -> 单服务纵切 -> 跨服务 create_codemap -> crate_router_map -> 业务域页。
2. 同时全开以下扩展开关：
   enable_contract_map
   enable_gateway_map
   enable_field_lineage
   enable_context_propagation_map
   enable_error_semantics
   enable_async_contract_map
   enable_external_dependency_dossier
   enable_interface_verification_assets
3. 对前端、App、H5、后端微服务、网关、MQ/Kafka、SSE/WebSocket、第三方 HTTP 依赖都做识别。
4. 所有能力都要分别生成对应产物文档。
5. 必须严格按代码事实输出，不允许额外推理。
6. 每条链路都要标注：
   closed / partially closed / clue-level / unresolved
7. 输出总索引文档，方便统一查看全部产物。
8. 如果项目过大，先全仓盘点，再继续全仓扩扫，再进入逐链路闭环。
```

## 推荐目录结构

```text
mydocs/
  README.md
  workspace/
  services/
  codemap/
  routermap/
  domain/
  extensions/
  validation/
```

## 推荐执行顺序

对于大型项目，更稳的方式通常是 6 个阶段：

### 第一阶段：工作区分层与项目清单

目标：

- 明确工作区边界
- 识别技术栈类型
- 建立 `in scope / delayed / excluded` 边界

典型产物：

- 工作区分层页
- 全仓项目清单
- 技术栈盘点页

### 第二阶段：全仓证据矩阵

目标：

- 识别高信号项目群
- 识别通信方式分布
- 为后续主链路闭环提供热点区域

典型产物：

- 全仓通信证据矩阵
- 终端入口总表
- 高信号服务清单

### 第三阶段：高价值服务纵切

目标：

- 深入关键服务内部结构
- 识别其 controller / feign / mq / external http / stream 结构

典型产物：

- 单服务纵切页
- 服务依赖摘要页

### 第四阶段：主链路闭环

目标：

- 从终端、网关、服务、异步链路中找出已闭环主链路
- 输出全局主干 codemap 与 router-map

典型产物：

- 跨服务 `create_codemap`
- `crate_router_map`
- 全局调用链路总表

### 第五阶段：扩展开关深描

目标：

- 按已识别主链路继续做细粒度分析
- 让扩展开关围绕高价值链路而不是全仓平均发力

典型产物：

- `contract-map`
- `gateway-map`
- `field-lineage-map`
- `context-propagation-map`
- `error-semantics-map`
- `async-contract-map`
- `external-dependency-dossier`
- `interface-verification-assets`

### 第六阶段：业务域与验证

目标：

- 在已有事实基础上做保守域提升
- 总结哪些链路已经闭环，哪些仍待继续验证

典型产物：

- 业务域页
- 验证页
- 未闭环清单

## 阶段推进规则

建议在全量模式中遵循以下规则：

1. 未完成第一阶段前，不要直接声称项目全局结构已经明确。
2. 未完成第二阶段前，不要直接对全仓所有服务画“全局调用总图”。
3. 未完成第三阶段前，不要过早开启字段血缘与外部依赖档案深描。
4. 未完成第四阶段前，业务域页应保持保守或线索级。
5. 扩展开关的深描结果，应优先围绕已识别的高信号链路，不宜平均摊给全仓所有项目。

## 轻量全量 与 重型全量

为了让团队更容易使用，也可以把全量模式再区分为两种：

### 轻量全量

含义：

- 全部能力进入目标范围
- 先完成前四阶段
- 扩展开关只做高信号链路

适合：

- 首次进入超大工作区
- 想先拿一版可信全景
- 希望控制 token 成本

### 重型全量

含义：

- 六个阶段全部执行
- 八个扩展开关都分别输出产物
- 尽可能向逐链路闭环推进

适合：

- 团队准备做中央知识库沉淀
- 希望一次性生成最完整的一版项目知识地图
- 接受更高 token 成本与更长执行时间

## 推荐使用建议

如果用户只是第一次进入大型项目，建议先用“轻量全量”。

如果已经确认项目价值很高，并且目标是沉淀团队级知识库，再使用“重型全量”会更合理。

## 什么时候不建议直接全开

以下情况不建议一上来就全量模式：

- 用户只是想快速理解一个单后端服务
- 目标项目很小，单服务纵切已经足够
- 用户希望低 token 成本快速得到第一版结果

这些场景更适合先走基础模式或部分开关模式。
