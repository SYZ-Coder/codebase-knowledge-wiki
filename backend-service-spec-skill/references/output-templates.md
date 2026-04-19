# 输出模板样例

本文提供四类产物的最小模板，并补充“workspace 范围识别”“大服务第二轮增强”“证据闭环等级”“参数清晰度分层”。

## 0. workspace 范围识别模板

```md
# <scope> 范围识别

## 1. 当前 scope
## 2. workspace_type
## 3. 判断依据
## 4. 推荐下一步
## 5. 当前边界
```

## 1. 跨服务 create_codemap 模板

```md
# <system-or-group> 服务总图

## 1. 梳理范围
## 2. workspace 范围判断
## 3. 服务清单
## 4. 服务职责与边界
## 5. 通信关系总图
## 6. 技术架构与中间件
## 7. 关键业务链路索引
## 8. 风险与盲区
## 9. 证据来源
```

## 2. crate_router_map 模板

```md
# <route-name> 路由总图

## 1. 链路范围
## 2. 入口请求
## 3. 涉及服务与仓库
## 4. 同步调用链
## 5. 异步消息链
## 6. 定时 / 补偿链
## 7. 实时通道链（如有）
## 8. 中间状态与存储
## 9. 失败重试 / 幂等 / 补偿线索
## 10. 证据等级说明
## 11. 代码证据
```

通信链路表建议：

```md
| step | from | to | type | interface/topic | evidence_level | evidence |
| --- | --- | --- | --- | --- | --- | --- |
```

推荐 `evidence_level`：

- `fact-closed`
- `fact-send-side`
- `fact-receive-side`
- `contract-visible`
- `clue`

## 3. 业务域页模板

```md
# <domain> 业务域知识页

## 1. 域定义
## 2. 域内主服务
## 3. 域内能力归纳
## 4. 与其他域的关系
## 5. 当前边界
## 6. 使用建议
## 7. 来源追溯
```

域目录建议：

```text
<domain>/
  overview.md
  services.md
  rules.md
  sources.md
```

## 4. 单服务第一轮模板

```md
# <service> 服务知识页

## 1. 服务定位
## 2. 代码骨架
## 3. 启动与框架事实
## 4. 当前已确认的高价值入口
## 5. 当前页面边界
```

第一轮最小页面集合：

```text
<service>/
  overview.md
  entrypoints.md
  dependencies.md
  mq.md
  sources.md
```

## 5. 单服务第二轮增强模板

适用于接口面宽、通信面多、外部依赖重的大服务。

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

## 6. api.md 参数清晰度模板

```md
# <service> API Surface

## 1. Scope
## 2. Parameter clarity levels
## 3. HTTP / Feign / callback contracts
## 4. DTO field tables confirmed in this round
## 5. Selected response surface
## 6. Current boundary
```

建议显式区分：

- `path-level clear`
- `signature-level clear`
- `dto-level partly clear`
- `payload/schema unresolved`

## 7. sibling-service-context 模板

```md
# <service-family> 服务家族上下文

## 1. 范围
## 2. 家族内服务清单
## 3. 直接可确认的职责分布
## 4. 直接可确认的通信线索
## 5. 尚未闭环确认的关系
## 6. 后续建议
## 7. 证据来源
```
