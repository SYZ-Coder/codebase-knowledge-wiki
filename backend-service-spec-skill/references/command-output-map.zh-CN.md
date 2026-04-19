# 服务端基础技能命令产物对照

本文用于说明 `backend-service-spec-skill` 中各个常用命令执行后，通常会产出什么文档。

注意：

- 这里说的是“推荐标准产物”，不是强制唯一文件名
- 真实文件名、日期前缀、目录结构可以按团队约定调整
- 如果本轮范围较小，部分产物可以合并
- 如果证据不足，应输出 `partially closed`、`clue-level` 或 `unresolved`

## 1. `create_codemap`

推荐命令：

```text
create_codemap: mode=service_landscape, scope=<system-or-service-group>, goal=<梳理目标>
```

默认产物：

- 服务清单页
- 服务关系总图
- 技术栈与模块分层页
- 上下游依赖摘要页
- 本轮范围说明页

常见落点目录：

```text
mydocs/codemap/
```

## 2. `service_deep_dive`

推荐命令：

```text
service_deep_dive: scope=<service-name>, goal=<纵切目标>
```

默认产物：

- 单服务结构页
- 接口清单页
- 模块分区页
- 依赖关系页
- 服务规范页
- 风险点与未闭环页

常见落点目录：

```text
mydocs/services/
```

## 3. `crate_router_map`

也兼容：

- `create_router_map`

推荐命令：

```text
crate_router_map: scope=<business-chain-or-entry>, goal=<梳理通信链路>
```

默认产物：

- 关键链路页
- 调用路径分段页
- 同步调用页
- 异步消息页
- 补偿/重试/实时通道页
- 链路闭环状态页

常见落点目录：

```text
mydocs/routermap/
```

## 4. `build_domain_map`

推荐命令：

```text
build_domain_map: scope=<system-or-service-group>, goal=<按业务域梳理>
```

默认产物：

- 业务域页
- 域 -> 服务 -> 规范 映射页
- 域内关键链路摘要页
- 域级约束与规则页
- 域页事实边界说明

常见落点目录：

```text
mydocs/domain/
```

## 5. 轻量全量分析

典型流程：

1. 范围识别
2. `create_codemap`
3. 1 到 2 个 `service_deep_dive`
4. 1 到 2 条 `crate_router_map`

默认产物组合：

- 1 份范围识别页
- 1 份 codemap 总图页
- 1 到 2 份单服务纵切页
- 1 到 2 份关键链路页
- 1 份总索引页

## 6. 重型全量分析

典型流程：

1. 范围识别
2. `create_codemap`
3. 多个 `service_deep_dive`
4. 多条 `crate_router_map`
5. `build_domain_map`
6. 验证页与未闭环清单

默认产物组合：

- 1 份范围识别页
- 1 份 codemap 总图页
- 多份单服务纵切页
- 多份关键链路页
- 1 份业务域页
- 1 份验证页
- 1 份未闭环清单
- 1 份总索引页

## 7. 推荐目录结构

```text
mydocs/
  README.md
  codemap/
  services/
  routermap/
  domain/
  validation/
```
