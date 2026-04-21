# Backend Service Spec Skill

这是一套偏服务端、微服务、旧系统、平台型仓库的开源知识梳理技能。

它的目标不是一次性分析，而是把代码中的结构事实、调用关系、业务边界、链路知识沉淀成团队可复用的中央知识库内容。

## 重要说明

目录名是 `backend-service-spec-skill`，用于区分它和跨技术栈扩展技能。

但实际技能调用名仍然是：

- `backend-service-spec-skill`

也就是说，用户在使用时，仍然应该写：

```text
请用 $backend-service-spec-skill 梳理这个后端微服务项目。
```

而不是写目录名。

如果你想最快上手，先读：

- [快速上手](./references/quick-start.zh-CN.md)
- [个人使用流程（偏微服务后端）](./references/personal-workflow.zh-CN.md)
- [命令产物对照](./references/command-output-map.zh-CN.md)
- [命令速查表](./references/command-output-scenario-quickref.zh-CN.md)

## 适用场景

这套技能适用于：

- 旧系统
- 微服务系统
- 平台型后端仓库
- 服务家族级知识梳理
- 团队中央知识库建设
- 服务端导向的跨服务链路梳理

如果项目明显是 App / H5 / Python / 混合工作区优先，则建议配合：

- [cross-tech-stack-spec-skill](../cross-tech-stack-spec-skill/README.zh-CN.md)

## 四个核心功能

### 1. `create_codemap`

作用：

- 生成跨服务总图
- 梳理服务清单、职责边界、依赖关系、上下游角色
- 为后续 deeper docs 提供索引层

如何使用：

- 当你刚接手一个系统，还不知道有哪些核心服务、网关、任务、公共组件时，先从它开始
- `scope` 一般写系统名、服务组名，或者你当前确认的工作区范围
- `goal` 一般写“梳理服务版图”“识别高价值服务”“为后续 deep dive 建索引”等目标

具体案例：

```text
请用 $backend-service-spec-skill 对这个支付中台项目执行 create_codemap。
要求：
1. scope=payment-platform
2. mode=service_landscape
3. 先识别服务清单、网关入口、定时任务、消息消费者
4. 输出服务职责边界、上下游依赖和高价值服务候选
5. 严格按代码事实输出，无法闭环验证的内容标注为线索级
```

你通常会在这种场景下用它：

- 第一次接手项目
- 要做系统全景梳理
- 想决定下一步先 deep dive 哪几个服务

### 2. `build_domain_map`

作用：

- 把服务级事实提升为“域 -> 服务 -> 规范”三层知识
- 适合团队中央仓库长期沉淀

如何使用：

- 当你已经有了 `create_codemap` 和若干 `service_deep_dive` 结果，再做这个最稳妥
- `scope` 一般写系统、服务组或某条业务线
- `goal` 一般写“按业务域归档”“沉淀中央知识库结构”“输出域级规范页”

具体案例：

```text
请用 $backend-service-spec-skill 对订单履约系统执行 build_domain_map。
要求：
1. scope=order-fulfillment
2. 基于现有 codemap 和关键服务 deep dive 结果
3. 输出 domain -> service -> rules/specs 三层映射
4. 区分交易域、履约域、售后域、通知域
5. 不重复抄写服务页，只做上卷整理和归档
```

你通常会在这种场景下用它：

- 项目梳理已经做了一轮，准备沉淀知识库
- 团队想统一业务域边界
- 想做“域 -> 服务 -> 规范”的长期维护页

### 3. `crate_router_map`

作用：

- 追踪一条真实请求或消息如何跨服务流转
- 强制拆开同步调用、异步消息、定时补偿、实时通道

也兼容：

- `create_router_map`

如何使用：

- 当你已经知道某个入口接口、业务动作或消息主题，想追完整链路时使用
- `scope` 一般写入口 API、业务动作、topic、callback 名称，或者一条关键业务链
- `goal` 一般写“追订单提交流程”“梳理退款异步链路”“分析登录鉴权链路”

具体案例：

```text
请用 $backend-service-spec-skill 对“用户提交订单”这条链路执行 crate_router_map。
要求：
1. scope=create-order
2. 从网关入口开始追踪到订单服务、库存服务、优惠服务、MQ 投递和支付预创建
3. 明确区分同步调用、异步消息、补偿任务
4. 输出每一跳的代码位置、调用方式、证据来源和闭环状态
5. 对缺失证据的环节标注未闭环
```

你通常会在这种场景下用它：

- 出问题后追一条真实链路
- 做接口联调或故障排查
- 想把同步和异步路径拆开看清楚

### 4. `service_deep_dive`

作用：

- 对单个高价值服务做纵切梳理
- 为后续业务域梳理提供稳定事实基础

如何使用：

- 当你已经通过 `create_codemap` 确认了某个关键服务值得深入时，就用它
- `scope` 一般直接写服务名、模块名或仓库中的单个子服务
- `goal` 一般写“梳理接口与模块分层”“分析依赖边界”“沉淀服务规范”

具体案例：

```text
请用 $backend-service-spec-skill 对 order-service 执行 service_deep_dive。
要求：
1. scope=order-service
2. 梳理 controller / application / domain / infrastructure 分层
3. 输出核心接口、主要依赖、数据库访问入口、消息生产与消费点
4. 标出它对库存、支付、营销的调用关系
5. 严格区分代码事实、推断结论和待验证线索
```

你通常会在这种场景下用它：

- 某个服务是全链路关键节点
- 你要做重构、交接或风险评估
- 你后面还要做业务域页，需要先有稳定的服务页基础

## 四个功能怎么组合使用

最常见的组合顺序是：

1. 先用 `create_codemap` 看全局
2. 再用 `service_deep_dive` 深挖关键服务
3. 再用 `crate_router_map` 追关键业务链路
4. 最后用 `build_domain_map` 做域级沉淀

一个完整案例：

```text
请用 $backend-service-spec-skill 对这个电商后端项目做一轮结构化梳理。
要求：
1. 先执行 create_codemap，识别核心服务与上下游关系
2. 再对 order-service 和 payment-service 执行 service_deep_dive
3. 再对“提交订单”和“支付回调”执行 crate_router_map
4. 最后输出 build_domain_map，把事实整理为交易域、履约域、支付域、售后域
5. 所有输出严格以代码证据为准
```

## 最常用命令

### 跨服务总图

```text
create_codemap: mode=service_landscape, scope=<system-or-service-group>, goal=<梳理目标>
```

### 跨服务业务域

```text
build_domain_map: scope=<system-or-service-group>, goal=<按业务域梳理>
```

### 请求或消息链路

```text
crate_router_map: scope=<business-chain-or-entry>, goal=<梳理通信链路>
```

### 单服务纵切

```text
service_deep_dive: scope=<service-name>, goal=<纵切目标>
```

## 命令执行后通常会得到什么

- `create_codemap`：通常得到服务清单页、服务关系总图、技术栈与模块分层页
- `service_deep_dive`：通常得到稳定服务知识页，如单服务结构页、接口清单页、依赖关系页、服务规范页
- `crate_router_map`：通常得到关键链路页、同步/异步分段页、闭环状态页
- `build_domain_map`：通常得到稳定业务域知识页，如域 -> 服务 -> 规范 映射页、域级规则页

完整对照请看：

- [命令产物对照](./references/command-output-map.zh-CN.md)

## 推荐工作顺序

推荐顺序：

1. 先识别工作区范围
2. 先做 `create_codemap`
3. 再做关键服务的 `service_deep_dive`
4. 再做关键链路的 `crate_router_map`
5. 最后再做 `build_domain_map`

其中最重要的一条规则是：

- 先做单服务纵切
- 再做跨服务业务域页

这样结果会更准确，也更适合长期复用。

## 个人推荐使用流程

如果你是个人第一次接手一个偏微服务后端项目，最推荐先读：

- [个人使用流程（偏微服务后端）](./references/personal-workflow.zh-CN.md)

这份文档专门说明：

- 为什么这样用会更准
- 为什么这样用会更细
- 为什么这样用会更全面
- 个人低 token 成本时该怎么选轻量模式
- 想沉淀知识库时该怎么选深度模式

## 目录建议

统一产物目录建议：

```text
mydocs/
  codemap/
  services/
  domains/
  routermap/
  context/
  specs/
  validation/
  index/
```

如果团队要把产物沉淀到中央知识库，建议继续阅读：

- [从 `mydocs` 到项目中央知识库](../references/mydocs-to-central-knowledge-repo.zh-CN.md)
- [中央知识库与 OpenSpec 协同规则](../references/knowledge-repo-and-openspec-collaboration.zh-CN.md)

## 建议继续阅读

- [快速上手](./references/quick-start.zh-CN.md)
- [个人使用流程（偏微服务后端）](./references/personal-workflow.zh-CN.md)
- [命令产物对照](./references/command-output-map.zh-CN.md)
- [命令速查表](./references/command-output-scenario-quickref.zh-CN.md)
- [技能元数据](./SKILL.md)
- [使用指南](./references/usage-guide.md)
- [质量清单](./references/quality-checklist.md)
- [输出模板](./references/output-templates.md)
- [工作区范围识别](./references/workspace-classification.md)

## 与扩展技能的关系

如果项目是明显的混合工作区，建议使用：

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill 做混合栈适配。
```

扩展技能入口：

- [扩展技能 README](../cross-tech-stack-spec-skill/README.zh-CN.md)
- [扩展技能详细使用说明](../cross-tech-stack-spec-skill/references/extension-usage-guide.zh-CN.md)
