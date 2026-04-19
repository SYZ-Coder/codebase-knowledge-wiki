# workspace 范围识别指南

在使用本技能前，先判断当前梳理对象属于哪一种范围。

## 1. 三种范围

### 1.1 `single-system`

特征：

- 多数仓库或模块围绕同一套运行时系统协作
- 服务命名、配置中心、注册中心、上游下游关系高度一致
- 可以合理地把它视为一套统一微服务系统

推荐：

- 可以直接从 `create_codemap: mode=service_landscape` 开始
- 如目标明确，可进一步做 `service_chain` 或 `crate_router_map`

### 1.2 `service-family`

特征：

- 一组服务明显属于同一家族
- 但当前范围不是整个公司或整个工作区
- 适合作为一个独立分析单元

推荐：

- scope 直接写成 family
- 优先做 family 级 `service_landscape`
- 再选关键服务做 `service_deep_dive`

### 1.3 `multi-system-workspace`

特征：

- 一个目录下共存多套系统或多种技术家族
- 不能默认它们共享同一运行时闭环
- 目录共存不等于服务闭环

推荐：

- 第一轮只做 `service_landscape`
- 先切分 family，再决定后续动作
- 暂不直接做统一 `build_domain_map`

## 2. 最小判断问题

开始前至少回答：

1. 当前 scope 是单系统、服务家族，还是多系统工作区
2. 本轮目标是全景索引、关键链路，还是稳定知识页
3. 本轮产物应该进入 `mydocs/` 还是 `project/`

## 3. 判断后的推荐动作

### 如果是 `single-system`

```text
create_codemap(service_landscape) -> service_deep_dive / crate_router_map -> build_domain_map
```

### 如果是 `service-family`

```text
create_codemap(service_landscape) -> 关键服务 service_deep_dive -> 关键链路 crate_router_map
```

### 如果是 `multi-system-workspace`

```text
先切 family -> 对每个 family 单独 create_codemap(service_landscape) -> 再决定是否继续
```

## 4. 禁止事项

- 不要因为仓库都在一个目录，就默认它们已经形成统一系统
- 不要因为存在 sibling repo，就默认已经有跨仓调用闭环
- 不要在 `multi-system-workspace` 首轮直接产出统一业务域页
