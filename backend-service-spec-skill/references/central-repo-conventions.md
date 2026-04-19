# 中央仓库落盘约定

## 1. 目标

本约定用于统一 `mydocs/` 过程产物与 `project/` 知识正文层的协同关系。

## 2. 两层产物定位

### 2.1 `mydocs/`

用于承载过程型、索引型、中间型产物。

推荐放入：

- `mydocs/codemap/`
  代码地图、服务总图、功能级地图、链路地图
- `mydocs/routermap/`
  跨服务通信链路、时序链路、消息链路
- `mydocs/context/`
  上下文包、需求资料抽取、外部资料整理
- `mydocs/specs/`
  Research / Plan / Review 等过程文档

特点：

- 偏“输入准备”和“分析过程”
- 允许按任务、时间、轮次持续追加
- 适合作为长期索引资产和过程留痕

### 2.2 `project/`

用于承载稳定的知识正文层。

推荐放入：

- `project/services/`
  单服务纵切知识页
- `project/domains/`
  业务域上卷页
- `project/standards/`
  规范沉淀页
- `project/index/`
  总索引、导航页

特点：

- 偏“团队复用的稳定知识”
- 面向跨轮次复用
- 不记录一次性分析废话和过程噪音

## 3. 协同原则

### 3.1 先 `mydocs`，后 `project`

推荐顺序：

1. 先在 `mydocs/codemap/` 或 `mydocs/routermap/` 形成索引
2. 再基于已确认事实沉淀 `project/services/`
3. 再把多个服务上卷到 `project/domains/`
4. 最后把跨服务重复模式沉淀到 `project/standards/`

### 3.2 `mydocs` 不直接等于正文

- `codemap` 是地图，不是最终知识正文
- `routermap` 是链路图，不是完整领域规范
- `specs` 是过程文档，不直接等于长期知识正文

### 3.3 `project` 不重复复制 `mydocs`

- `project/services/` 应提炼服务事实，不整页复制 Codemap
- `project/domains/` 应做上卷整理，不重复服务页全文
- `project/standards/` 应总结稳定模式，不抄单个服务细节

## 4. 推荐映射关系

| 过程产物 | 沉淀目标 | 说明 |
| --- | --- | --- |
| `mydocs/codemap/*服务总图.md` | `project/services/<service>/overview.md` 或服务索引页 | 从地图提炼稳定总览 |
| `mydocs/codemap/*链路地图.md` | `project/services/<service>/call-chain.md` 或域级链路说明 | 从链路索引提炼稳定链路页 |
| `mydocs/routermap/*接口链路.md` | `project/services/<service>/dependencies.md`、`project/domains/<domain>/services.md` | 提炼上下游和协作关系 |
| `mydocs/routermap/*消息链路.md` | `project/services/<service>/mq.md`、`project/standards/*mq*.md` | 提炼消息事实与规范线索 |
| `mydocs/specs/*.md` | `project/domains/*`、`project/standards/*` | 只提炼经代码确认的结论 |

## 5. 写入规则

- 每个 `project/` 正文页都应能追溯到来源
- 来源可以回指 `mydocs/` 过程产物，也可以直接回指源码
- 不能只引用结论，不保留来源路径

## 6. 更新策略

### 6.1 什么时候更新 `mydocs`

- 新增功能级梳理
- 新增跨服务链路
- 新需求带来新的调查范围
- 旧地图过期，需要增量刷新

### 6.2 什么时候更新 `project`

- 某项服务事实已稳定
- 某个业务域的主服务边界已经看清
- 某类模式在多个服务中重复出现
- 团队需要长期查阅该知识

## 7. 团队使用建议

推荐把中央仓库使用方式固定为：

1. 查背景先看 `project/index/`
2. 看服务先进 `project/services/`
3. 看域关系进 `project/domains/`
4. 查完整链路时回到 `mydocs/routermap/`
5. 查源头证据时回到 `mydocs/codemap/` 或源码

## 8. 关键边界

- `mydocs/` 允许有时间戳和任务痕迹
- `project/` 尽量保持稳定命名和主题化组织
- 如果某条知识尚未稳定，不要强行提前写进 `project/` 正文层
