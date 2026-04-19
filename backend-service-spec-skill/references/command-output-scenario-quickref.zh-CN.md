# 服务端技能命令速查表

本文用于帮助用户快速判断：

- 该用哪个命令
- 会产出什么
- 建议放到哪个目录
- 适合什么场景

## 1. `create_codemap`

命令：

```text
create_codemap: mode=service_landscape, scope=<system-or-service-group>, goal=<梳理目标>
```

典型产物：

- 服务清单页
- 服务关系总图
- 技术栈与模块分层页
- 上下游依赖摘要页

推荐目录：

```text
mydocs/codemap/
```

适合场景：

- 第一次进入系统
- 想先看全局结构
- 想先识别高价值服务

## 2. `service_deep_dive`

命令：

```text
service_deep_dive: scope=<service-name>, goal=<纵切目标>
```

典型产物：

- 单服务结构页
- 接口清单页
- 模块分区页
- 依赖关系页
- 服务规范页

推荐目录：

```text
mydocs/services/
```

适合场景：

- 高价值核心服务梳理
- 想先吃透一个服务
- 后面要做域页或链路页

## 3. `crate_router_map`

也兼容：

- `create_router_map`

命令：

```text
crate_router_map: scope=<business-chain-or-entry>, goal=<梳理通信链路>
```

典型产物：

- 关键链路页
- 同步调用页
- 异步消息页
- 补偿/重试页
- 链路闭环状态页

推荐目录：

```text
mydocs/routermap/
```

适合场景：

- 想追一条真实请求
- 想梳理消息链路
- 想区分 sync / async / compensation

## 4. `build_domain_map`

命令：

```text
build_domain_map: scope=<system-or-service-group>, goal=<按业务域梳理>
```

典型产物：

- 业务域页
- 域 -> 服务 -> 规范 映射页
- 域内关键链路摘要页
- 域级规则页

推荐目录：

```text
mydocs/domain/
```

适合场景：

- 做团队中央知识库
- 需要跨服务业务域抽象
- 想把服务事实提升成长期可复用知识页

## 5. 轻量全量

典型产物组合：

- 范围识别页
- codemap 总图页
- 1 到 2 份单服务纵切页
- 1 到 2 份关键链路页
- 总索引页

推荐目录：

```text
mydocs/
  codemap/
  services/
  routermap/
```

适合场景：

- 第一次进入项目
- 想控制 token 成本
- 想先拿一版可靠基线

## 6. 重型全量

典型产物组合：

- 范围识别页
- codemap 总图页
- 多份单服务纵切页
- 多份关键链路页
- 业务域页
- 验证页
- 未闭环清单
- 总索引页

推荐目录：

```text
mydocs/
  codemap/
  services/
  routermap/
  domain/
  validation/
```

适合场景：

- 核心系统知识沉淀
- 团队中央知识库建设
- 想做更完整的长期基线
