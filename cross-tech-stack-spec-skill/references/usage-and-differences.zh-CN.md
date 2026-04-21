# 用法与区别说明

本文用于说明：这个跨技术栈技能怎么使用、和基础 `backend-service-spec-skill` 有什么区别、两者应该如何配合。

## 1. 定位

`cross-tech-stack-spec-skill` 不是 `backend-service-spec-skill` 的替代品。
它是一个显式启用的扩展层，专门用于那些“只用后端服务语义描述已经不够准确”的项目。

适用场景包括：

- 移动端项目
- H5 / Web 前端项目
- Python 服务 / worker / task / 脚本项目
- 前端、客户端、桥接、后端、callback、task 混合存在的仓库

## 2. 与基础技能的关系

### 基础技能：`$backend-service-spec-skill`

继续作为默认主流程，适用于：

- 后端微服务项目
- 服务景观梳理
- 业务域梳理
- 以服务到服务通信为中心的 router-map
- 团队中央仓库长期维护

### 扩展技能：`$cross-tech-stack-spec-skill`

只在需要跨技术栈适配时显式启用。

它仍然沿用原来的四类核心动作：

- `create_codemap`
- `build_domain_map`
- `crate_router_map`
- `service_deep_dive`

但会把它们改写成更适合移动端 / H5 / Python / 混合栈项目的解释方式。

## 3. 核心区别

### 不变的部分

- 证据纪律
- fact / clue 边界
- 范围识别思路
- codemap / router-map / deep-dive / domain-map 这些主结构

### 变化的部分

- 术语变成栈中性，不再强行用“服务”描述一切
- 分析重点从 service-only 扩展到 project / module / page / task / bridge 边界
- router-map 从“服务间链路”扩展成“跨层链路”
- 页面路由、App 路由、后端路由、callback 链路、task 链路会被拆得更细
- 大型混合工作区会先做分层和噪音控制，不再默认直接全量深扫
- 当前后端或跨层契约同时可见时，可以补接口对照页
- 跨技术栈业务域页会从 `domain -> service -> spec` 升级成更适合混合仓库的结构
- 中央知识库维护时，可以切换成增量更新模式，而不是每次都重扫全仓

## 4. 什么时候只用基础技能

以下情况直接用 `$backend-service-spec-skill` 即可：

- 仓库本身就是普通后端微服务或服务家族
- 用“服务”这个概念已经足够描述项目
- 不需要跨移动端 / 前端 / Python / bridge 层做梳理

## 5. 什么时候启用扩展技能

以下情况建议启用 `$cross-tech-stack-spec-skill`：

- 用户明确要求开启跨技术栈扩展
- 仓库以移动端为主
- 仓库以 H5 / 前端为主
- 仓库以 Python 项目为主
- 需要梳理 page/app/client/backend/task/callback/bridge 的跨层链路
- 如果继续只用后端服务语义，会导致分析失真

## 6. 推荐使用方式

### 方式 A：只用基础技能

```text
请用 $backend-service-spec-skill 梳理这个后端微服务项目。
```

### 方式 B：显式只开扩展技能

```text
请启用 $cross-tech-stack-spec-skill，分析这个 Flutter 项目。
```

### 方式 C：基础主流程 + 扩展层

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill 做混合栈适配。
```

对于混合场景，这种说法最准确。

## 7. 推荐工作顺序

对于大型混合工作区，推荐顺序是：

1. 先做工作区分层
2. 再显式记录当前排除项 / 延后项
3. 再做单仓或单子系统 codemap
4. 再做跨层 router-map
5. 如果 caller / handler 双侧都可见，再补接口对照页
6. 如果要沉淀业务上下文，再补混合栈业务域页

如果是已有知识库的持续维护，则推荐顺序是：

1. 先明确 change scope
2. 再确认受影响文档
3. 只更新当前变更范围涉及的 codemap / router-map / domain-map
4. 明确说明哪些区域这次没有重新验证

## 8. 示例命令

### 移动端项目

```text
请启用 $cross-tech-stack-spec-skill，对这个移动端项目进行梳理。
```

### H5 项目

```text
请启用 $cross-tech-stack-spec-skill，对这个 H5 仓库生成 project codemap。
```

### Python 项目

```text
请启用 $cross-tech-stack-spec-skill，对这个 Python worker 项目做 deep dive。
```

### 混合栈链路

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，追踪 page -> api -> callback -> task 这条跨层链路。
```

### 大型混合工作区

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，先输出工作区分层页，再记录当前排除项，然后继续做 codemap 和 router-map。
```

### 接口对照页

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，输出前端请求声明到后端处理路由的接口对照页，并附代码位置与证据等级。
```

### 混合栈业务域页

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，在已有 codemap 和 router-map 基础上，输出某业务域的 domain -> entry surfaces -> systems/modules -> rules/specs 页。
```

### 增量更新

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，按 update_codemap 模式，只更新本次变更范围涉及的 codemap / router-map / domain-map，并列出受影响文档。
```

## 9. 默认启用规则

这个技能默认不会隐式触发。
用户需要在需要时显式启用。

这样设计是有意为之：

- 避免污染已经稳定的后端导向技能
- 保持跨技术栈扩展是 opt-in 能力
- 让默认主流程与混合栈适配之间的边界更清楚

## 10. 通信梳理增强

当你希望梳理前端、客户端、后端、MQ、Kafka、WebSocket、IM、callback 等通信时，建议显式要求输出：

- 通信类型清单
- 通信矩阵
- 数量统计依据
- 证据等级
- closure state
- 代码位置

推荐表达：

```text
请启用 $cross-tech-stack-spec-skill，梳理这个混合栈项目中的 HTTP、WebSocket、MQ、Kafka、callback 通信，并给出代码位置、证据等级与统计依据。
```

注意：这里的数量默认应理解为“代码中可稳定枚举的数量”，不是线上流量数量。

## 11. 噪音控制提醒

如果仓库中包含大量：

- model_zoo
- training 目录
- notebooks
- experiment 子树
- vendor / third_party
- 生成物目录

建议不要直接跳进去全扫。

更稳的方式是：

- 先判断这些目录是否与当前运行链路有直接关系
- 若没有直接证据，则标记为 `delayed for second pass` 或 `excluded in current pass`
- 只有在启动链路、运行时导入链路或通信链路证明相关时，再重新纳入分析范围

## 12. 接口对照提醒

如果仓库里同时存在：

- 前端或客户端请求声明
- 后端或下游处理路由

建议补一页接口对照页，至少写清：

- caller side
- request path
- method
- handler side
- mapping status
- evidence level
- code locations

如果只看得到一侧，也可以写，但必须明确标注为 `provider not found`、`handler unresolved` 或类似状态，不能强行闭环。

## 13. 混合栈业务域页提醒

如果你希望输出的不是“链路图”，而是团队能复用的业务上下文页，建议在已有低层证据基础上再补域页。

混合栈域页至少应包含：

- domain
- entry surfaces
- systems / modules / services
- rules / specs

其中 `entry surfaces` 可以是：

- app 页面
- H5 页面
- backend API
- Python task
- bridge entrypoint
- callback handler

这类域页不应用来猜业务意图，而应用来提升已经零散存在的项目知识。

## 14. 增量更新提醒

如果仓库已有基线文档，后续维护不建议每次都从头重扫。

更稳的方式是：

- 先明确 change scope
- 再列出受影响文档
- 只补充 newly confirmed evidence
- 明确说明本次未重新验证的区域

这样更适合中央知识库长期维护，也更符合事实边界。
