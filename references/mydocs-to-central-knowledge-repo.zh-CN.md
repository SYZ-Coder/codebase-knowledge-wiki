# 从 `mydocs` 到项目中央知识库

## 目的

这篇文档用于说明：技能分析完成后，生成的 `mydocs/` 产物应该如何使用。

核心原则是：

- 先让技能把过程产物输出到 `mydocs/`
- 再把这些产物迁移并回收到长期使用的项目中央知识库

不要把 `mydocs/` 直接当成团队知识的最终落点。

## 推荐映射规则

默认建议按下面方式映射：

- `mydocs/codemap/`
  -> `project/sources/codemap-import/<batch>/`

- `mydocs/routermap/`
  -> 先进入 `project/sources/codemap-import/<batch>/`
  -> 再按知识归属回收到：
  - `project/services/<service>/`
  - `project/domains/<domain>/`
  - `project/architecture/`

- `mydocs/services/`
  -> `project/services/<service>/`

- `mydocs/domain/`
  -> `project/domains/<domain>/`

- `mydocs/specs/`
  -> 先进入 `project/standards/`
  -> 成熟后再进入 `openspec/specs/`

## 推荐的两步流程

### 第一步：先导入来源层

```text
请执行 import_mydocs_to_sources：
source_repo=<项目仓路径>
source_docs=<mydocs 路径>
target_repo=<中央知识库路径>
batch=<YYYY-MM-DD-workspace-or-topic>
mode=safe
```

### 第二步：再回收到稳定知识层

```text
请执行 recover_sources_to_project：
target_repo=<中央知识库路径>
batch=<YYYY-MM-DD-workspace-or-topic>
recover=services,domains,standards
mode=guided
```

## 可直接复制的实操示例

如果项目仓是 `D:\repo\sample-project`，技能产物位于 `D:\repo\sample-project\mydocs`，中央知识库位于 `D:\repo\central-knowledge-repo`，那么可以按顺序把下面两段直接发给 AI 执行。

### 示例 1：导入到来源层

```text
请执行 import_mydocs_to_sources：
source_repo=D:\repo\sample-project
source_docs=D:\repo\sample-project\mydocs
target_repo=D:\repo\central-knowledge-repo
batch=2026-04-20-sample-project
mode=safe
要求：
1. 按 mydocs-to-central-knowledge-repo.zh-CN.md 规则执行
2. 只导入到 project/sources/codemap-import/<batch>/
3. 自动生成 IMPORT-README.md
4. 不直接修改 project/services、project/domains、project/standards、openspec/specs
```

### 示例 2：回收到稳定知识层

```text
请执行 recover_sources_to_project：
target_repo=D:\repo\central-knowledge-repo
batch=2026-04-20-sample-project
recover=services,domains,standards
mode=guided
要求：
1. 按 mydocs-to-central-knowledge-repo.zh-CN.md 规则执行
2. 优先读取 project/sources/codemap-import/2026-04-20-sample-project/IMPORT-README.md
3. 对线索级内容必须显式标注
4. 不直接写入 openspec/specs
```

## 一句话规则

技能负责产出 `mydocs/`，中央知识库负责吸收经过审阅、映射和回收后的稳定知识。
