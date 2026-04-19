# 增量更新策略

本规则用于决定：当前轮次应该增量补齐，还是重新起盘。

## 1. 总原则

优先增量，慎用重建。

只有在已有知识无法继续复用、或原有分层已明显错误时，才进入全量重建。

## 2. 决策顺序

### 2.1 先检查是否已有稳定页

如果存在：

- `project/services/<service>/`
- `project/domains/<domain>/`
- `project/standards/`

则优先判断：

- 当前问题是缺页，还是整页失真
- 当前问题是缺证据，还是范围错误
- 当前问题是局部不足，还是结构整体失效

### 2.2 再检查是否已有过程页

如果存在：

- `mydocs/codemap/`
- `mydocs/routermap/`
- `mydocs/context/`

则优先判断：

- 是否可以基于最近一轮继续补齐
- 是否需要把过程页中的稳定事实沉淀到 `project/`

## 3. 常见场景与推荐动作

### 3.1 服务首轮已完成，但接口不够明朗

推荐：

- 不重跑整个服务纵切
- 只补 `api.md`
- 如果链路复杂，再补 `call-chain.md` 或 `route-map.md`

### 3.2 服务页已有，但跨服务链路没闭环

推荐：

- 不重写 `overview.md`
- 直接补 `crate_router_map`
- 或在服务页补 `route-map.md`

### 3.3 已有 codemap，但范围过大

推荐：

- 不直接继续堆内容
- 先拆 family scope
- 再分别增量生成新的 service_landscape

### 3.4 业务域页已有，但服务事实不足

推荐：

- 暂停扩写域页
- 回补关键服务 `service_deep_dive`
- 用服务事实反推域层更新

### 3.5 draft 存在但未完成

推荐：

- 优先判断是否 resume
- 若信息仍有效，则续写
- 若方向已经错误，再 clear 并新开一轮

## 4. 触发重建的信号

以下情况可以进入重建：

- 旧文档 scope 明显错误
- 文档把多系统工作区写成单系统
- 证据等级长期缺失，无法区分 fact 与 clue
- current 页与源码差异太大，增量补齐成本高于重建

## 5. 推荐动作矩阵

| 当前状态 | 常见问题 | 推荐动作 |
| --- | --- | --- |
| 已有稳定服务页 | 接口不清楚 | 补 `api.md` |
| 已有稳定服务页 | 主链路不清楚 | 补 `call-chain.md` / `route-map.md` |
| 已有稳定服务页 | 上下游未闭环 | 补 `crate_router_map` |
| 已有 codemap | scope 太大 | 拆 family 后重做 `service_landscape` |
| 已有域页 | 服务事实不足 | 回补 `service_deep_dive` |
| 只有 draft | 可继续 | resume / 增量补齐 |
| 只有 draft | 方向错误 | clear / 新开一轮 |

## 6. 禁止事项

- 不要因为“想更完整”就默认全量重跑
- 不要在 stable 页只缺一个切面时重写全部
- 不要跳过已有知识直接回源码零扫
