# 个人使用流程：偏微服务后端项目

## 适用对象

这套流程适合个人在以下场景中使用：

- 第一次接手一个微服务项目
- 需要快速理解旧系统结构
- 想把分散的服务知识沉淀成可复用文档
- 希望在有限 token 成本下，让结果更准、更细、更全面

## 为什么推荐按流程使用

同样一套技能，如果只是随机挑一个命令开始，往往只能得到局部结果。

按顺序使用的价值在于：

1. 先建全景，再钻细节，边界更准。
2. 先做服务事实，再做链路与业务域，推断更少。
3. 先收敛高价值服务，再扩展到全局，文档更细也更稳。
4. 更容易控制 token 消耗，避免在低价值区域过度扫描。

## 推荐个人流程

### 第一步：先识别项目范围

目的：

- 先确认这是单服务、服务家族，还是大型微服务工作区
- 先建立本轮范围边界

推荐动作：

- 阅读根目录结构
- 确认有哪些服务组
- 明确本轮 `in scope / delayed / excluded`

### 第二步：先做 `create_codemap`

推荐命令：

```text
create_codemap: mode=service_landscape, scope=<system-or-service-group>, goal=<梳理跨服务总图>
```

### 第三步：挑高价值服务做 `service_deep_dive`

推荐命令：

```text
service_deep_dive: scope=<service-name>, goal=<做单服务纵切>
```

优先选择：

- Controller 多
- Feign 多
- Kafka 多
- 外部 HTTP 多
- 位于业务主链路上的服务

### 第四步：再做关键链路 `crate_router_map`

推荐命令：

```text
crate_router_map: scope=<business-chain-or-entry>, goal=<梳理关键调用链路>
```

### 第五步：最后再做 `build_domain_map`

推荐命令：

```text
build_domain_map: scope=<system-or-service-group>, goal=<做跨服务业务域梳理>
```

## 推荐节奏

### 轻量个人模式

适合：

- 第一次进入项目
- 想低 token 成本拿到第一版结果

推荐顺序：

1. 范围识别
2. `create_codemap`
3. 1 到 2 个高价值服务 `service_deep_dive`
4. 1 到 2 条关键链路 `crate_router_map`

### 深度个人模式

适合：

- 已确认项目重要
- 准备沉淀到中央知识库

推荐顺序：

1. 范围识别
2. `create_codemap`
3. 多个高价值服务 `service_deep_dive`
4. 多条关键链路 `crate_router_map`
5. `build_domain_map`
6. 补验证页与未闭环清单

## 让结果更准、更细、更全面的关键规则

### 更准

- 先服务事实，后业务域提升
- 先 caller / handler 证据，后链路结论
- 没闭环就写成 `partially closed` 或 `clue-level`

### 更细

- 不要只停在服务名层面
- 要展开 controller、feign、mq、外部依赖、模块分区
- 关键服务一定要做单服务纵切

### 更全面

- 不要只看 HTTP
- 要同时看 Feign、Kafka、外部 HTTP、回调、实时通道
- 要同时沉淀全景页、纵切页、链路页、域页

## 什么时候要启用扩展技能

如果项目已经不只是纯后端微服务，而是混合包含：

- App
- H5
- Python
- Gateway
- MQ / callback / task

那么建议在这个基础流程上，再配合：

- [cross-tech-stack-spec-skill](../../cross-tech-stack-spec-skill/README.zh-CN.md)

## 结论

对于偏微服务后端项目，最能发挥技能库价值的方式，不是“一句命令扫完”，而是：

- 先建全景
- 再做高价值服务纵切
- 再做关键链路
- 最后再提升到业务域

这样通常能同时得到：

- 更准
- 更细
- 更全面

并且更适合后续复用。

## 推荐补充阅读

- [命令产物对照](./command-output-map.zh-CN.md)
