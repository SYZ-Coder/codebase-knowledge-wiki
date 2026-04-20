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

## 一句话规则

技能负责产出 `mydocs/`，中央知识库负责吸收经过审阅、映射和回收后的稳定知识。
