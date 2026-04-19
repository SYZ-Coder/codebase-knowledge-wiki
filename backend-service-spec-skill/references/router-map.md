# crate_router_map 指南

## 1. 目标

`crate_router_map` 用于梳理请求在跨服务、跨仓库、跨技术栈之间的完整通信路径。

## 2. 覆盖范围

同步通信：

- Feign
- REST / HTTP
- RPC
- Gateway 转发
- callback / webhook

异步通信：

- RocketMQ
- Kafka
- RabbitMQ
- Pulsar
- 定时任务触发
- stream / queue / delayed event

实时通道：

- WebSocket
- SSE
- streaming callback

## 3. 最小输出结构

1. 链路范围
2. 入口请求
3. 涉及服务与仓库
4. 同步调用链
5. 异步消息链
6. 定时 / 补偿链
7. 实时通道链（如有）
8. 中间状态与存储
9. 失败重试 / 幂等 / 补偿线索
10. 证据等级说明
11. 代码证据

## 4. 证据等级

推荐使用：

- `fact-closed`: 发送侧、接收侧、处理点都已闭环
- `fact-send-side`: 已确认发送 / 调用侧，但未闭环到对端
- `fact-receive-side`: 已确认接收 / 处理侧，但未闭环到上游
- `contract-visible`: 只看到接口契约、topic/tag、handler 契约或 provider 名
- `clue`: 只看到命名、配置、兄弟仓、扫描范围等线索

## 5. 通信链路表建议

```md
| step | from | to | type | interface/topic | evidence_level | evidence |
| --- | --- | --- | --- | --- | --- | --- |
```

其中 `type` 可以是：

- `feign`
- `rpc`
- `http`
- `mq`
- `kafka`
- `task`
- `callback`
- `websocket`
- `sse`
- `config-driven`

## 6. 关键约束

- 同步、异步、定时/补偿、实时链路必须分开写
- provider / consumer 必须区分
- producer / listener 必须区分
- 只看到 listener 不等于上游 producer 已闭环确认
- 只看到 producer 不等于下游 consumer 已闭环确认
- 只看到 sibling service 存在，不等于服务间已有已确认通信链
- `WebSocket` 与 `SSE` 不能混成一个笼统“实时通道”结论
- 若只确认 controller callback 存在，不得补写外部平台完整调用流程
- 发送侧已确认不等于完整闭环
- 接收侧已确认不等于完整闭环

## 7. 推荐产物

- 总图页
- 接口链路页
- 消息链路页
- 实时通道页

必要时补：

- 时序图
- topic-detail 表
- sibling-service-context 页
- 补偿链路页
