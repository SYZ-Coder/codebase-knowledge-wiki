# 中央知识库与 OpenSpec 协同规则

## 目的

这篇文档用于说明：项目中央知识库应该如何与 `openspec/specs` 和 `openspec/changes` 协同使用。

默认采用三层协同：

- `project/`：上下文与事实知识层
- `openspec/specs/`：当前有效规则层
- `openspec/changes/`：未来变更控制层

## 推荐协同流程

1. 代码事实、历史知识、分析产物先沉淀在 `project/`
2. 其中稳定且可执行的部分，再提炼成 `openspec/specs/`
3. 如果后续要改动，先从 `openspec/changes/` 发起
4. 实现完成后，更新 `openspec/specs/`
5. 最后再同步更新对应的 `project/` 知识页

## 一句话规则

让 `project/` 保留上下文，让 `openspec/specs/` 定义当前规则，让 `openspec/changes/` 管控后续演进。
