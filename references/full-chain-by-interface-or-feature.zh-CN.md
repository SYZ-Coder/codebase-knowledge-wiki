# 按接口或功能查看完整链路的使用说明

本文说明：如果用户想围绕“某个接口”或“某个业务功能”，查看一整套完整链路，包括：

- 调用入口
- 请求地址
- 接口参数
- 涉及的前后端功能链路
- 网关 / BFF / 后端处理链
- 外部服务对接
- MQ / Kafka / callback / topic 生产消费关系
- 失败路径与验证资产

应该如何使用技能库。

## 1. 这种场景本质上是什么

这种场景本质上不是单纯的“看一个接口定义”，而是：

- 以某个接口或功能为锚点
- 追整条跨层链路
- 同时补齐契约、字段、上下文、异步、外部依赖等侧面

所以最稳的做法不是只跑一个命令，而是：

- 以 `backend-service-spec-skill` 为主流程
- 启用 `$cross-tech-stack-spec-skill`
- 再按需开启若干可选开关

## 2. 推荐开启哪些能力

### 最小可用组合

适合先拿一版主链路结果：

- `backend-service-spec-skill`
- `$cross-tech-stack-spec-skill`
- `enable_contract_map`
- `enable_gateway_map`

### 标准完整组合

适合真正追一条完整链路：

- `enable_contract_map`
- `enable_gateway_map`
- `enable_field_lineage`
- `enable_context_propagation_map`
- `enable_async_contract_map`
- `enable_external_dependency_dossier`

### 重型完整组合

适合问题复杂、还要补失败路径和验证材料：

- `enable_contract_map`
- `enable_gateway_map`
- `enable_field_lineage`
- `enable_context_propagation_map`
- `enable_error_semantics`
- `enable_async_contract_map`
- `enable_external_dependency_dossier`
- `enable_interface_verification_assets`

## 3. 如果锚点是“接口”

适用于：

- 已知接口路径
- 已知接口方法名
- 已知 controller 方法
- 已知前端调用地址

推荐命令：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，
同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_async_contract_map + enable_external_dependency_dossier，
围绕接口 <接口路径 / 方法名 / controller 方法> 做完整链路梳理。
要求：
1. 从 caller 入口开始识别
2. 输出请求地址、接口参数、响应字段
3. 输出 gateway / BFF / controller / service / feign / http / mq / kafka / callback 链路
4. 如果存在 Kafka 或 MQ，输出 topic、producer、consumer、payload 线索
5. 如果存在外部团队服务，输出外部依赖档案
6. 严格区分 closed / partially closed / clue-level / unresolved
```

## 4. 如果锚点是“功能”

适用于：

- 已知页面功能
- 已知按钮动作
- 已知某个业务动作
- 已知某个用户流程

推荐命令：

```text
请以 backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，
同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets，
围绕功能 <功能名称> 做完整链路梳理。
要求：
1. 从功能入口页面、按钮、App/H5 调用点或首个接口开始
2. 输出涉及的前端、网关、后端、外部服务、MQ/Kafka 链路
3. 输出接口参数、地址、字段流转、上下文透传、失败路径、验证资产
4. 如果存在 topic，输出 topic 对应的生产者、消费者、处理服务
5. 严格按代码事实输出
```

## 5. 这类链路通常会产出什么

推荐产物：

- 接口或功能总览页
- 主链路页
- 接口参数表
- 字段流转页
- 上下文透传页
- 外部依赖档案页
- 异步契约页
- 失败语义页
- 验证资产页
- 未闭环清单

推荐目录：

```text
mydocs/routermap/
mydocs/extensions/
mydocs/validation/
```

## 6. 如何提高识别准确度

建议用户在命令里明确给出以下锚点之一：

- 接口路径
- 方法名
- 页面路径
- 功能名称
- topic 名称
- controller 名称

锚点越明确，越容易做到：

- caller 更准
- handler 更准
- 参数更完整
- topic 关联更稳
- 外部依赖识别更可靠

## 7. 关于 Kafka / MQ / topic 的说明

如果目标里明确提到 Kafka / MQ / topic，建议在命令中明确要求输出：

- topic 名称
- producer 服务
- consumer 服务
- 发送位置
- 消费位置
- payload/schema 线索
- retry / DLQ / 补偿线索

推荐附加表达：

```text
如果存在 Kafka / MQ，请按 topic 维度输出生产者、消费者、发送位置、消费位置、payload 线索、retry / DLQ / 补偿信息。
```

## 8. 关于“完整”二字的正确理解

这里的“完整链路”更准确地说应理解为：

- 所有可识别能力都围绕该接口或功能做输出
- 能闭环的尽量闭环
- 不能闭环的明确标注原因

而不是默认承诺：

- 所有系统一定 100% 闭环
- 所有外部依赖都能双边确认
- 所有 topic 都能自动推到最终业务语义

所以这类命令最好始终附带：

- `严格按代码事实输出`
- `标注 closed / partially closed / clue-level / unresolved`

## 9. 推荐再配合阅读

- [团队标准使用顺序](./team-standard-workflow.zh-CN.md)
- [全量完整模式](./full-analysis-mode.zh-CN.md)
- [场景化命令合集](./scenario-command-recipes.zh-CN.md)
- [扩展技能详细使用说明](../cross-tech-stack-spec-skill/references/extension-usage-guide.zh-CN.md)
