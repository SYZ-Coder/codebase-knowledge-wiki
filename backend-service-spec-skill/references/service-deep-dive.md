# 单服务纵切模板

## 1. 目标

对单个高价值服务做可复用的事实型知识沉淀，并为后续 `build_domain_map` 和 `crate_router_map` 提供稳定基础。

## 2. 第一轮最小输出集合

第一轮只要求把服务骨架建立完整，避免一上来铺太多页面。

- `overview.md`
- `entrypoints.md`
- `dependencies.md`
- `mq.md`
- `sources.md`

适用场景：

- 刚接手一个复杂服务
- 需要先快速建立团队知识入口
- 还没有选定具体高价值链路

## 3. 第二轮增强输出集合

当服务存在下列特征之一时，建议进入第二轮增强：

- 控制器很多，接口面明显过宽
- 同时存在 HTTP / Feign / MQ / Kafka / WS / SSE 多种通信方式
- 外部依赖明显多于普通业务服务
- 单页开始变得拥挤，主题边界不再清晰

推荐追加页面：

- `api.md`
- `call-chain.md`
- `external-dependencies.md`
- `handlers.md`
- `db.md`
- `business-rules.md`
- `state-machine.md`
- `route-map.md`
- `topic-detail.md`
- `ws.md`
- `runtime-config.md`
- `error-catalog.md`
- `risk-and-hotspots.md`
- `scenario-<name>.md`

## 4. 页面选择规则

### 4.1 `api.md`

当 controller / Feign API 很多时，把入口面拆出独立页，避免 `entrypoints.md` 同时承载 HTTP、Feign、WS、SSE。

### 4.2 `external-dependencies.md`

当服务存在大量外部组件、外部服务、第三方能力或 sibling service 协作时，单独收敛依赖边界，不把所有内容挤进 `dependencies.md`。

### 4.3 `route-map.md`

当服务内部已经能看到高价值主链路，或者需要连接 `crate_router_map` 结果时，补一页服务内主链路图。

### 4.4 `topic-detail.md`

当 producer / consumer 很多，或 topic/tag/config key 不适合继续塞进 `mq.md` 时，单独落表。

### 4.5 `ws.md`

当服务具备 WebSocket、SSE、streaming callback、长连接会话管理等能力时，单独整理实时通信页。

## 5. 推荐落盘结构

```text
<service>/
  overview.md
  entrypoints.md
  dependencies.md
  mq.md
  sources.md

  api.md
  call-chain.md
  external-dependencies.md
  handlers.md
  db.md
  business-rules.md
  state-machine.md
  route-map.md
  topic-detail.md
  ws.md
  runtime-config.md
  error-catalog.md
  risk-and-hotspots.md
  scenario-<name>.md
```

## 6. 原则

- 先建最小骨架，再做第二轮增强
- 单页过宽时优先拆页，不要持续堆内容
- 高频链路单独成页
- 实时通信单独成页
- topic/tag/config 过多时优先表格化
- 所有页面都要能追溯回源码证据
- 不把命名猜测写成业务事实
