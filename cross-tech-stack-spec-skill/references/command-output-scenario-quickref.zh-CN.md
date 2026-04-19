# 扩展技能命令速查表

本文用于帮助用户快速判断：

- 扩展技能或开关该怎么选
- 会产出什么
- 推荐放在哪个目录
- 适合什么场景

## 1. 启用扩展技能，不开可选开关

命令：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill 做混合栈适配。
```

典型产物：

- 工作区分层页
- 混合栈噪音控制页
- 通信证据矩阵页
- 接口对照页
- 混合栈关键链路页

推荐目录：

```text
mydocs/workspace/
mydocs/codemap/
mydocs/routermap/
```

适合场景：

- App / H5 / Python / Backend 混合工作区
- 先收边界再深挖
- 想先拿主干链路结果

## 2. `enable_contract_map`

典型产物：

- 契约细化页
- 请求参数表
- 响应字段表
- caller / handler 对照页

推荐目录：

```text
mydocs/extensions/
```

适合场景：

- 联调
- 参数语义不清
- 接口字段复杂

## 3. `enable_gateway_map`

典型产物：

- 网关/转发链路页
- gateway route 清单
- rewrite / auth 摘要页
- 落点对照页

推荐目录：

```text
mydocs/extensions/
mydocs/routermap/
```

适合场景：

- Gateway / BFF 路由不清晰
- 请求路径对不上
- 想看转发链路

## 4. `enable_field_lineage`

典型产物：

- 字段血缘页
- 字段流转表
- rename / transform 记录页

推荐目录：

```text
mydocs/extensions/
```

适合场景：

- DTO 很大
- 字段改名多
- 想查字段来源和落点

## 5. `enable_context_propagation_map`

典型产物：

- 上下文透传页
- header / token / userId / tenantId / traceId 透传表
- 改写点 / gap 清单

推荐目录：

```text
mydocs/extensions/
```

适合场景：

- 登录态问题
- trace 排障
- header 争议

## 6. `enable_error_semantics`

典型产物：

- 失败语义页
- 错误码映射表
- retry / fallback / compensation 摘要页

推荐目录：

```text
mydocs/extensions/
```

适合场景：

- 线上故障排查
- 失败链路梳理
- 异常翻译复杂

## 7. `enable_async_contract_map`

典型产物：

- 异步契约页
- producer -> topic/queue -> consumer 映射页
- payload/schema 线索页

推荐目录：

```text
mydocs/extensions/
mydocs/routermap/
```

适合场景：

- Kafka / MQ / callback
- 想看消息契约和消费关系
- 想梳理 retry / DLQ / 幂等

## 8. `enable_external_dependency_dossier`

典型产物：

- 外部依赖档案页
- provider / consumer 清单
- owner / version / 风险线索页

推荐目录：

```text
mydocs/extensions/
mydocs/specs/
```

适合场景：

- 跨团队协作
- 中央知识库
- 依赖治理

## 9. `enable_interface_verification_assets`

典型产物：

- 验证资产页
- swagger/openapi/postman/mock/contract test 清单
- 覆盖情况页

推荐目录：

```text
mydocs/extensions/
mydocs/validation/
```

适合场景：

- onboarding
- 联调准备
- 测试资料盘点

## 10. 全开模式

典型产物组合：

- 工作区分层页
- 噪音控制页
- codemap 总图页
- 多份服务纵切页
- 多份 router-map 页
- 接口对照页
- 8 类开关细化页
- 混合栈业务域页
- 验证页
- 未闭环清单
- 总索引页

推荐目录：

```text
mydocs/
  workspace/
  codemap/
  services/
  routermap/
  domain/
  extensions/
  validation/
```

适合场景：

- 核心混合项目
- 团队中央知识库基线包
- 接受更高 token 成本做更完整沉淀
