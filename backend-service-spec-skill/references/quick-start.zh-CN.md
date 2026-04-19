# 服务端基础技能快速上手

本文是一页式快速说明，帮助用户在 1 到 3 分钟内判断：什么时候使用 `backend-service-spec-skill`，以及第一次应该怎么下命令。

## 1. 它适合什么项目

优先用于：

- 旧系统
- 微服务系统
- 平台型后端仓库
- 服务家族级知识梳理
- 团队中央知识库沉淀

如果项目明显是移动端、H5、Python worker，或者需要跨页面 / 网关 / 后端 / MQ 一起梳理，请配合：

- [cross-tech-stack-spec-skill](../../cross-tech-stack-spec-skill/README.zh-CN.md)

## 2. 记住一个调用名

虽然目录名现在是：

- `backend-service-spec-skill`

但实际调用名仍然是：

- `backend-service-spec-skill`

用户下命令时，仍然写 `backend-service-spec-skill`。

## 3. 四个核心功能

- `create_codemap`：做跨服务总图和索引层
- `build_domain_map`：做“域 -> 服务 -> 规范”三层知识
- `crate_router_map`：做真实请求 / 消息链路梳理
- `service_deep_dive`：做单服务纵切梳理

## 4. 第一次怎么用

### 如果你要先看系统总图

```text
create_codemap: mode=service_landscape, scope=<system-or-service-group>, goal=<梳理总图>
```

### 如果你要看一个高价值服务

```text
service_deep_dive: scope=<service-name>, goal=<纵切梳理>
```

### 如果你要追一条请求或消息链路

```text
crate_router_map: scope=<business-chain-or-entry>, goal=<梳理通信链路>
```

### 如果你要做中央知识库的业务域页

```text
build_domain_map: scope=<system-or-service-group>, goal=<按业务域梳理>
```

## 5. 推荐顺序

最稳的顺序通常是：

1. 先 `create_codemap`
2. 再 `service_deep_dive`
3. 再 `crate_router_map`
4. 最后 `build_domain_map`

其中最重要的一条规则是：

- 先做单服务纵切
- 再做业务域页

## 6. 最小命令清单

### 系统级总图

```text
create_codemap: mode=service_landscape, scope=<system>, goal=<输出系统服务总图>
```

### 服务级纵切

```text
service_deep_dive: scope=<service>, goal=<输出服务结构、接口、依赖、规范>
```

### 链路级分析

```text
crate_router_map: scope=<entry-or-chain>, goal=<输出同步、异步、补偿链路>
```

### 域级知识页

```text
build_domain_map: scope=<system>, goal=<输出域 -> 服务 -> 规范>
```

## 7. 每个命令的典型产物

- `create_codemap`：服务清单页、服务关系总图、技术栈与模块分层页
- `service_deep_dive`：单服务结构页、接口清单页、依赖关系页、规范页
- `crate_router_map`：关键链路页、同步/异步链路页、闭环状态页
- `build_domain_map`：业务域页、域 -> 服务 -> 规范 映射页

详细对照请看：

- [命令产物对照](./command-output-map.zh-CN.md)

## 8. 建议继续阅读

- [使用指南](./usage-guide.md)
- [命令产物对照](./command-output-map.zh-CN.md)
- [质量清单](./quality-checklist.md)
- [输出模板](./output-templates.md)
- [工作区范围识别](./workspace-classification.md)

