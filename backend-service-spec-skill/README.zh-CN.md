# Backend Service Spec Skill

这是一套偏服务端、微服务、旧系统、平台型仓库的开源知识梳理技能。

它的目标不是一次性分析，而是把代码中的结构事实、调用关系、业务边界、链路知识沉淀成团队可复用的中央知识库内容。

## 重要说明

目录名是 `backend-service-spec-skill`，用于区分它和跨技术栈扩展技能。

但实际技能调用名是：

- `$backend-service-spec-skill`

也就是说，用户在使用时，仍然应该写：

```text
请用 $backend-service-spec-skill 梳理这个后端微服务项目。
```

而不是写目录名。

如果你想最快上手，先读：

- [后端技能 References 导航](./references/README.zh-CN.md)
- [快速上手](./references/quick-start.zh-CN.md)
- [个人使用流程（偏微服务后端）](./references/personal-workflow.zh-CN.md)
- [命令产物对照](./references/command-output-map.zh-CN.md)
- [命令速查表](./references/command-output-scenario-quickref.zh-CN.md)
- [图产物输出规范](./references/diagram-output-guidelines.zh-CN.md)
- [Mermaid 自检清单](./references/mermaid-safety-checklist.zh-CN.md)

## 适用场景

这套技能适用于：

- 旧系统
- 微服务系统
- 平台型后端仓库
- 服务家族级知识梳理
- 团队中央知识库建设
- 服务端导向的跨服务链路梳理
- 历史需求缺失时，从当前代码事实抽取项目事实需求

如果项目明显是 App / H5 / Python / 混合工作区优先，则建议配合：

- [cross-tech-stack-spec-skill](../cross-tech-stack-spec-skill/README.zh-CN.md)

## 核心功能

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

### 5. `requirement_fact_map`

作用：

- 在历史 PRD、需求评审记录缺失时，从当前代码事实抽取“系统事实上已经支持了哪些需求”
- 按功能模块沉淀项目需求知识库
- 把接口、页面、任务、消息、配置、数据对象和链路证据上卷为事实需求

如何使用：

- 当你已经有 `create_codemap`、若干 `service_deep_dive` 或 `crate_router_map` 结果时，执行它最稳妥
- `scope` 一般写系统名、服务组、功能模块或关键链路
- `goal` 一般写“按功能模块抽取当前事实需求”“补齐历史需求依据”“生成需求证据矩阵”

具体案例：

```text
请用 $backend-service-spec-skill 对订单履约系统执行 requirement_fact_map。
要求：
1. scope=order-fulfillment
2. 基于现有 codemap、service_deep_dive 和 crate_router_map 结果
3. 按功能模块抽取当前系统事实需求
4. 输出需求到代码证据矩阵和未闭环需求清单
5. 严格区分 fact-closed、fact-entry-only、fact-data-only、clue 和 unknown
```

你通常会在这种场景下用它：

- 历史项目缺少 PRD，需要补需求依据
- 产品、测试、研发需要共同理解系统当前实际能力
- 重构、迁移、补测试前，需要确认事实需求边界

详细规则见：

- [事实需求抽取](./references/requirement-fact-extraction.md)

## 核心功能怎么组合使用

最常见的组合顺序是：

1. 先用 `create_codemap` 看全局
2. 再用 `service_deep_dive` 深挖关键服务
3. 再用 `crate_router_map` 追关键业务链路
4. 按需用 `requirement_fact_map` 抽取当前事实需求
5. 最后用 `build_domain_map` 做域级沉淀

一个完整案例：

```text
请用 $backend-service-spec-skill 对这个电商后端项目做一轮结构化梳理。
要求：
1. 先执行 create_codemap，识别核心服务与上下游关系
2. 再对 order-service 和 payment-service 执行 service_deep_dive
3. 再对“提交订单”和“支付回调”执行 crate_router_map
4. 再执行 requirement_fact_map，把当前事实能力整理为模块级需求
5. 最后输出 build_domain_map，把事实整理为交易域、履约域、支付域、售后域
6. 所有输出严格以代码证据为准
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

### 事实需求抽取

```text
requirement_fact_map: scope=<system-or-module-or-chain>, goal=<按功能模块抽取当前事实需求>
```

## 命令执行后通常会得到什么

- `create_codemap`：通常得到服务清单页、服务关系总图、技术栈与模块分层页
- `service_deep_dive`：通常得到稳定服务知识页，如单服务结构页、接口清单页、依赖关系页、服务规范页
- `crate_router_map`：通常得到关键链路页、同步/异步分段页、闭环状态页
- `build_domain_map`：通常得到稳定业务域知识页，如域 -> 服务 -> 规范 映射页、域级规则页
- `requirement_fact_map`：通常得到功能模块事实需求页、需求证据矩阵、未闭环需求与人工确认项

## 图产物支持

这套技能现在支持把图作为标准产物一起输出，但推荐格式不是单独图片，而是 `Markdown + Mermaid`。

推荐格式：

- 使用 `.md` 文件承载图
- 在 Markdown 中嵌入 Mermaid 代码块
- 图下面补一段文字，说明节点含义、边含义、证据来源与未闭环项

默认触发规则：

- 当核心命令按标准产物执行时，配套图默认应一并产出
- 用户不需要每次重复写“请生成图”，除非想进一步限定图的范围或格式
- 只有在范围极小、证据不足或用户明确要求纯文字输出时，才可以省略图

推荐目录：

```text
mydocs/diagrams/
  architecture/
  call-graph/
  upstream-downstream/
  sequence/
```

命令与图的对应关系：

- `create_codemap`：架构图 + 服务调用关系图
- `service_deep_dive`：上下游依赖图 + 服务内模块架构图
- `crate_router_map`：时序图 + 链路调用图
- `build_domain_map`：领域上下文图

为什么推荐这种方式：

- AI 对 Markdown 和 Mermaid 源文本的识别更稳定
- 图可以持续增量更新
- 后续仍然可以再导出 PNG / SVG 给人看，但图片不作为主知识载体

完整对照请看：

- [命令产物对照](./references/command-output-map.zh-CN.md)

## 推荐工作顺序

推荐顺序：

1. 先识别工作区范围
2. 先做 `create_codemap`
3. 再做关键服务的 `service_deep_dive`
4. 再做关键链路的 `crate_router_map`
5. 如果历史需求缺失或需要补需求知识库，再做 `requirement_fact_map`
6. 最后再做 `build_domain_map`

其中最重要的一条规则是：

- 先做单服务纵切
- 再做跨服务业务域页

这样结果会更准确，也更适合长期复用。

如果本轮目标是补历史需求依据，`requirement_fact_map` 应消费前面几层事实产物，不能把命名线索或单边代码直接写成已确认需求。

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
  requirements/
  routermap/
  context/
  specs/
  validation/
  index/
```

### 这些目录分别做什么

这些目录不只是“按命令分文件夹”，更适合被理解成不同层次的知识页：

- `mydocs/codemap/`
  - 回答“整体结构是什么”
  - 适合第一次接手系统时先读
- `mydocs/services/`
  - 回答“单个关键服务内部怎么分层、有哪些接口和依赖”
  - 适合准备修改某个服务时先读
- `mydocs/routermap/`
  - 回答“某条真实请求链路或消息链路怎么跑”
  - 适合联调、故障排查、接口追踪
- `mydocs/domains/`
  - 回答“如何从服务事实沉淀成业务域知识”
  - 适合做中央知识库归档
- `mydocs/requirements/`
  - 回答“当前系统按功能模块事实上支持了哪些需求”
  - 典型内容包括：事实需求索引、模块需求页、需求证据矩阵、未闭环需求清单
  - 适合历史 PRD 缺失、补需求依据、重构前确认需求边界
- `mydocs/context/`
  - 回答“跨服务共用的横切事实是什么”
  - 典型内容包括：接口映射、字段血缘、上下文透传、错误语义、异步契约、外部依赖
  - 它不是只属于某一个服务，而是服务于当前分析 scope 内多个系统之间的协作理解
- `mydocs/validation/`
  - 回答“哪些已经闭环、哪些还没闭环、风险在哪里”
  - 适合在交付前做可信度校验
- `mydocs/index/`
  - 回答“这次分析的总入口、阅读顺序、范围边界是什么”
  - 适合给后来接手的人做导航

其中 `mydocs/context/` 最关键的一点是：

- 它是“本次分析范围内的全局横切上下文目录”
- 它主要针对跨端、跨服务、跨链路场景
- 它不等于整个组织或所有仓库的绝对全局，只对当前纳入分析的 scope 生效

如果团队要把产物沉淀到中央知识库，建议继续阅读：

- [从 `mydocs` 到项目中央知识库](../references/mydocs-to-central-knowledge-repo.zh-CN.md)
- [中央知识库与 OpenSpec 协同规则](../references/knowledge-repo-and-openspec-collaboration.zh-CN.md)

## 建议继续阅读

- [后端技能 References 导航](./references/README.zh-CN.md)
- [快速上手](./references/quick-start.zh-CN.md)
- [个人使用流程（偏微服务后端）](./references/personal-workflow.zh-CN.md)
- [命令产物对照](./references/command-output-map.zh-CN.md)
- [命令速查表](./references/command-output-scenario-quickref.zh-CN.md)
- [技能元数据](./SKILL.md)
- [使用指南](./references/usage-guide.md)
- [质量清单](./references/quality-checklist.md)
- [输出模板](./references/output-templates.md)
- [事实需求抽取](./references/requirement-fact-extraction.md)
- [图产物输出规范](./references/diagram-output-guidelines.zh-CN.md)
- [Mermaid 自检清单](./references/mermaid-safety-checklist.zh-CN.md)
- [工作区范围识别](./references/workspace-classification.md)

## 与扩展技能的关系

如果项目是明显的混合工作区，建议使用：

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill 做混合栈适配。
```

扩展技能入口：

- [扩展技能 README](../cross-tech-stack-spec-skill/README.zh-CN.md)
- [扩展技能详细使用说明](../cross-tech-stack-spec-skill/references/extension-usage-guide.zh-CN.md)
