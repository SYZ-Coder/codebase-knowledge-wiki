# 技能库使用指南

本指南回答三个问题：

1. 四个功能分别是什么
2. 各自应该用什么命令触发
3. 什么场景下应该优先用哪一个功能

## 0. 使用前先做范围判断

开始前先判断 scope 属于：

- `single-system`
- `service-family`
- `multi-system-workspace`

如果是 `multi-system-workspace`：

- 第一轮优先 `create_codemap: mode=service_landscape`
- 先按 family 拆 scope
- 不要直接做 `build_domain_map`

详见：`workspace-classification.md`

## 0.1 规则是否需要单独启用

不需要。

对用户来说，仍然只使用原来的四个功能：

- `create_codemap`
- `build_domain_map`
- `crate_router_map`
- `service_deep_dive`

新增的规则层默认自动生效，包括：

- 范围识别
- current / draft / archive 生命周期判断
- 增量更新优先
- 必要时才 full-rebuild

如果你想让系统更明确地走“增量维护”而不是“重建”，可以在 goal 里补一句，例如：

```text
基于已有 project/services 内容增量补齐，不要全量重建
```

或：

```text
先读取 current 和 draft，再决定是否重建
```
## 1. 四个功能总览

### 1.1 跨服务 `create_codemap`

作用：

- 梳理多服务、微服务、平台仓库的整体总图
- 看清服务清单、服务边界、调用关系、依赖关系、技术架构
- 适合作为跨服务知识建设的起点

推荐命令：

```text
create_codemap: mode=service_landscape, scope=<系统名或服务群>, goal=<梳理目标>
create_codemap: mode=service_chain, scope=<关键业务链>, goal=<梳理服务级链路>
create_codemap: mode=project, scope=<项目名>, goal=<梳理项目总图>
create_codemap: mode=feature, scope=<功能名>, goal=<梳理局部功能流程>
```

### 1.2 跨服务业务域梳理

作用：

- 把零散服务知识上卷成“域 -> 服务 -> 规范”三层知识
- 帮助团队建立更稳定、可复用的上下文层

推荐命令：

```text
build_domain_map: scope=<系统或服务群>, goal=<按业务域梳理>
```

重要建议：

- 最好先完成关键服务的单服务纵切梳理，再做业务域梳理
- 原因是域层页面不是凭空推理出来的，而是建立在服务事实之上

推荐顺序：

```text
先 service_deep_dive -> 再 build_domain_map
```

### 1.3 `crate_router_map`

作用：

- 梳理请求在跨服务之间的完整通信路径
- 覆盖 Feign、RPC、HTTP、MQ、Kafka、WebSocket、SSE 等同步 / 异步 / 实时通信
- 适合分析接口完整链路、消息链路、跨仓协作链路

推荐命令：

```text
crate_router_map: scope=<业务链路或入口>, goal=<梳理跨服务通信链路>
```

也兼容：

```text
create_router_map: scope=<业务链路或入口>, goal=<梳理跨服务通信链路>
```

默认要求：

- 必须拆开同步调用链、异步消息链、定时/补偿链
- 如存在实时通道，再补实时链路
- 必须标注证据闭环等级

### 1.4 单服务纵切梳理

作用：

- 对单个高价值服务做完整纵切
- 形成可长期复用的服务知识页集合
- 是后续跨服务域层梳理的重要事实基础

推荐命令：

```text
service_deep_dive: scope=<服务名>, goal=<按升级后的模板进行梳理>
```

## 2. 四个功能怎么选

### 2.1 如果你还不知道系统长什么样

优先用：

```text
create_codemap: mode=service_landscape, scope=<系统或 family>, goal=<看清系统总图>
```

### 2.2 如果你已经知道系统大概结构，但要查一条真实业务链

优先用：

```text
crate_router_map: scope=<链路名>, goal=<梳理跨服务通信路径>
```

### 2.3 如果你想做团队知识库正文

优先顺序：

```text
先 service_deep_dive
再 build_domain_map
最后按需沉淀 standards
```

### 2.4 如果你只关心某一个复杂服务

优先用：

```text
service_deep_dive: scope=<服务名>, goal=<做单服务纵切>
```

## 3. 推荐组合打法

### 3.1 多系统工作区首轮

```text
1. 先做范围识别
2. create_codemap: mode=service_landscape
3. 按 family 拆 scope
4. 选 1-3 个关键服务做 service_deep_dive
5. 对关键请求做 crate_router_map
6. 最后再评估 build_domain_map
```

### 3.2 中央仓库持续建设

```text
1. 有新服务先补 service_deep_dive
2. 有新跨服务链路先补 crate_router_map
3. 服务层事实足够后，再更新 build_domain_map
4. 多服务重复模式稳定后，再沉淀 standards
```

### 3.3 排障型场景

```text
先 crate_router_map
必要时回补 service_deep_dive
不要直接先写域层
```

### 3.4 大服务第二轮验证

当单服务首轮已经完成，但页面开始拥挤，推荐继续：

```text
1. 补 service_deep_dive 第二轮页面
2. 补 crate_router_map
3. 再把稳定事实挂入 build_domain_map
```

常见要补的页面：

- `api.md`
- `call-chain.md`
- `external-dependencies.md`
- `route-map.md`
- `ws.md`
- `topic-detail.md`

## 4. 最关键的一条使用建议

对于业务域梳理，一定优先记住：

- 业务域页最好建立在关键服务已经做过单服务纵切梳理的前提上
- 先有服务事实，再有域层上卷
- 这样域层更准确，后续团队复用也更稳定

## 5. 增量维护建议

如果中央仓库已经有内容，不要默认重跑全量梳理。

建议额外参考：

- `knowledge-lifecycle.md`
- `incremental-update-policy.md`
- `workflow-state-model.md`

最常见的正确姿势是：

```text
先读 current 稳定页 -> 再读相关 draft -> 能增量补齐就不重建
```

