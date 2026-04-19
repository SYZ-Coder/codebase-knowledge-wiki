# 技能执行状态模型

本规则把技能执行过程拆成稳定的几个状态，便于团队长期复用，也便于未来进一步工具化。

## 1. 状态列表

### 1.1 discovery

含义：

- 识别当前目标、scope、工作区类型
- 判断本轮属于首轮起盘、增量更新还是闭环补证

关键动作：

- 做 workspace 范围判断
- 判断目标产物应该落在 `mydocs/` 还是 `project/`

### 1.2 reuse-existing-artifacts

含义：

- 优先读取已有知识产物
- 不急于全量回源码

关键动作：

- 读取 current 稳定页
- 读取相关 draft 过程页
- 判断是否已有足够上下文支持增量更新

### 1.3 incremental-update

含义：

- 基于已有知识页补缺、补证、补链路

关键动作：

- 补 `api.md`
- 补 `call-chain.md`
- 补 `route-map.md`
- 补 `crate_router_map`
- 补 sources 和证据等级

### 1.4 draft-resume

含义：

- 发现上一轮未完成产物，但仍可继续

关键动作：

- 评估 draft 是否仍有效
- 继续补证、补页、补边界

### 1.5 full-rebuild

含义：

- 现有知识无法继续复用
- scope / 分层 / 事实边界已整体失真

关键动作：

- 重新起盘
- 必须重新做范围识别
- 重新生成索引层，再沉淀稳定页

### 1.6 publish-stable-pages

含义：

- 将经过检查的稳定知识沉淀到 `project/`

关键动作：

- 通过质量检查
- 把稳定事实从 draft 提升到 current
- 保留必要历史上下文，但不混淆 current

## 2. 推荐状态流转

### 2.1 首轮起盘

```text
discovery -> reuse-existing-artifacts -> full-rebuild 或 incremental-update -> publish-stable-pages
```

### 2.2 已有稳定页的日常维护

```text
discovery -> reuse-existing-artifacts -> incremental-update -> publish-stable-pages
```

### 2.3 发现未完成 draft

```text
discovery -> reuse-existing-artifacts -> draft-resume -> incremental-update -> publish-stable-pages
```

### 2.4 旧知识整体失真

```text
discovery -> reuse-existing-artifacts -> full-rebuild -> publish-stable-pages
```

## 3. 状态切换判断

### 从 discovery 进入 reuse-existing-artifacts

条件：

- 进入正式梳理前默认先检查已有知识产物

### 从 reuse-existing-artifacts 进入 incremental-update

条件：

- 已有 current 或 draft 足以支撑补齐

### 从 reuse-existing-artifacts 进入 draft-resume

条件：

- 发现上一轮过程产物未完成，但仍有效

### 从 reuse-existing-artifacts 进入 full-rebuild

条件：

- 旧知识范围错误、分层错误、整体失真

### 从 incremental-update / full-rebuild 进入 publish-stable-pages

条件：

- 已达到基本质量要求
- 可以作为团队 current 正文使用

## 4. 使用价值

这套状态模型的意义：

- 避免每次都从零开始
- 避免 draft 与 stable 混在一起
- 让首轮起盘、增量补齐、重建三种动作有清晰边界
- 为未来自动化、工具化、批量维护打基础
