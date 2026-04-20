# Backend Service Spec Skill

这是一套偏服务端、微服务、旧系统、平台型仓库的开源知识梳理技能。

它的目标不是一次性分析，而是把代码中的结构事实、调用关系、业务边界、链路知识沉淀成团队可复用的中央知识库内容。

## 重要说明

目录名是 `backend-service-spec-skill`，用于区分它和跨技术栈扩展技能。

但实际技能调用名仍然是：

- `backend-service-spec-skill`

也就是说，用户在使用时，仍然应该写：

```text
请用 backend-service-spec-skill 梳理这个后端微服务项目。
```

而不是写目录名。

如果你想最快上手，先读：

- [快速上手](./references/quick-start.zh-CN.md)
- [个人使用流程（偏微服务后端）](./references/personal-workflow.zh-CN.md)
- [命令产物对照](./references/command-output-map.zh-CN.md)
- [命令速查表](./references/command-output-scenario-quickref.zh-CN.md)

## 适用场景

这套技能适用于：

- 旧系统
- 微服务系统
- 平台型后端仓库
- 服务家族级知识梳理
- 团队中央知识库建设
- 服务端导向的跨服务链路梳理

如果项目明显是 App / H5 / Python / 混合工作区优先，则建议配合：

- [cross-tech-stack-spec-skill](../cross-tech-stack-spec-skill/README.zh-CN.md)

## 四个核心功能

### 1. `create_codemap`

作用：

- 生成跨服务总图
- 梳理服务清单、职责边界、依赖关系、上下游角色
- 为后续 deeper docs 提供索引层

### 2. `build_domain_map`

作用：

- 把服务级事实提升为“域 -> 服务 -> 规范”三层知识
- 适合团队中央仓库长期沉淀

### 3. `crate_router_map`

作用：

- 追踪一条真实请求或消息如何跨服务流转
- 强制拆开同步调用、异步消息、定时补偿、实时通道

也兼容：

- `create_router_map`

### 4. `service_deep_dive`

作用：

- 对单个高价值服务做纵切梳理
- 为后续业务域梳理提供稳定事实基础

## 最常用命令

### 跨服务总图

```text
create_codemap: mode=service_landscape, scope=<system-or-service-group>, goal=<梳理目标>
```

### 跨服务业务域

```text
build_domain_map: scope=<system-or-service-group>, goal=<按业务域梳理>
```

### 请求或消息链路

```text
crate_router_map: scope=<business-chain-or-entry>, goal=<梳理通信链路>
```

### 单服务纵切

```text
service_deep_dive: scope=<service-name>, goal=<纵切目标>
```

## 命令执行后通常会得到什么

- `create_codemap`：通常得到服务清单页、服务关系总图、技术栈与模块分层页
- `service_deep_dive`：通常得到单服务结构页、接口清单页、依赖关系页、服务规范页
- `crate_router_map`：通常得到关键链路页、同步/异步分段页、闭环状态页
- `build_domain_map`：通常得到业务域页、域 -> 服务 -> 规范 映射页、域级规则页

完整对照请看：

- [命令产物对照](./references/command-output-map.zh-CN.md)

## 推荐工作顺序

推荐顺序：

1. 先识别工作区范围
2. 先做 `create_codemap`
3. 再做关键服务的 `service_deep_dive`
4. 再做关键链路的 `crate_router_map`
5. 最后再做 `build_domain_map`

其中最重要的一条规则是：

- 先做单服务纵切
- 再做跨服务业务域页

这样结果会更准确，也更适合长期复用。

## 个人推荐使用流程

如果你是个人第一次接手一个偏微服务后端项目，最推荐先读：

- [个人使用流程（偏微服务后端）](./references/personal-workflow.zh-CN.md)

这份文档专门说明：

- 为什么这样用会更准
- 为什么这样用会更细
- 为什么这样用会更全面
- 个人低 token 成本时该怎么选轻量模式
- 想沉淀知识库时该怎么选深度模式

## 目录建议

过程产物一般放在：

```text
mydocs/
  codemap/
  routermap/
  context/
  specs/
```

稳定知识正文一般放在：

```text
project/
  services/
  domains/
  standards/
  index/
```

如果团队要把产物沉淀到中央知识库，建议继续阅读：

- [从 `mydocs` 到项目中央知识库](../references/mydocs-to-central-knowledge-repo.zh-CN.md)
- [中央知识库与 OpenSpec 协同规则](../references/knowledge-repo-and-openspec-collaboration.zh-CN.md)

## 建议继续阅读

- [快速上手](./references/quick-start.zh-CN.md)
- [个人使用流程（偏微服务后端）](./references/personal-workflow.zh-CN.md)
- [命令产物对照](./references/command-output-map.zh-CN.md)
- [命令速查表](./references/command-output-scenario-quickref.zh-CN.md)
- [技能元数据](./SKILL.md)
- [使用指南](./references/usage-guide.md)
- [质量清单](./references/quality-checklist.md)
- [输出模板](./references/output-templates.md)
- [工作区范围识别](./references/workspace-classification.md)

## 与扩展技能的关系

如果项目是明显的混合工作区，建议使用：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill 做混合栈适配。
```

扩展技能入口：

- [扩展技能 README](../cross-tech-stack-spec-skill/README.zh-CN.md)
- [扩展技能详细使用说明](../cross-tech-stack-spec-skill/references/extension-usage-guide.zh-CN.md)
