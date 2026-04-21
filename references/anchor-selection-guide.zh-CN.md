# 锚点选择表

本文用于帮助用户在做“完整链路梳理”前，先选对锚点。

这里的“锚点”是指：你准备从什么起点来追整条链路。

最常见的 4 类锚点是：

- 接口
- 功能
- topic
- 页面入口

选对锚点，通常会明显提升：

- caller 识别准确度
- handler 落点准确度
- 参数提取完整度
- 外部依赖识别稳定性
- MQ / Kafka 链路闭环率

## 1. 接口锚点

适合什么时候用：

- 已知接口路径
- 已知 controller 方法
- 已知前端请求地址
- 已知某个接口方法名

最适合回答的问题：

- 这个接口从哪里发起
- 最终由哪个 handler 处理
- 参数和返回值是什么
- 有没有经过 gateway / BFF / Feign / 外部 HTTP / MQ / Kafka

推荐命令：

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，
同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_async_contract_map + enable_external_dependency_dossier，
围绕接口 <接口路径 / 方法名 / controller 方法> 做完整链路梳理，并严格按代码事实输出。
```

推荐产物：

- 主链路页
- 接口参数表
- 字段流转页
- topic 关系页
- 外部依赖档案页

## 2. 功能锚点

适合什么时候用：

- 已知某个业务功能
- 已知按钮动作
- 已知用户流程
- 已知某个业务结果，但不知道涉及哪些接口

最适合回答的问题：

- 这个功能涉及哪些页面、接口、服务
- 前后端协同链路是什么
- 是否涉及外部服务、异步消息、失败补偿

推荐命令：

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，
同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets，
围绕功能 <功能名称> 做完整链路梳理，并严格按代码事实输出。
```

推荐产物：

- 功能总览页
- 主链路页
- 失败路径页
- 外部依赖页
- 验证资产页

## 3. topic 锚点

适合什么时候用：

- 已知 Kafka topic
- 已知 MQ topic / queue
- 已知 callback 事件名
- 已知某条异步消息，但不知道谁发谁收

最适合回答的问题：

- 这个 topic 是谁生产的
- 谁在消费
- topic 对应什么业务链路
- payload/schema 线索是什么
- 有没有 retry / DLQ / 补偿

推荐命令：

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，
同时开启 enable_async_contract_map + enable_error_semantics + enable_external_dependency_dossier，
围绕 topic <topic 名称> 做完整链路梳理。
要求：
1. 输出 producer、consumer、发送位置、消费位置
2. 输出 payload/schema 线索
3. 输出 retry / DLQ / 补偿线索
4. 严格区分 closed / partially closed / clue-level / unresolved
```

推荐产物：

- 异步契约页
- producer / consumer 映射页
- topic 线索页
- 失败与补偿页

## 4. 页面入口锚点

适合什么时候用：

- 已知 H5 页面路径
- 已知 App 页面或路由
- 已知某个前端入口组件
- 已知某个页面行为，但还不知道对应接口

最适合回答的问题：

- 页面从哪里触发接口
- 页面调用了哪些后端能力
- 页面是否经过 bridge / gateway / backend / async
- 页面所属功能链路是什么

推荐命令：

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，
同时开启 enable_contract_map + enable_gateway_map + enable_context_propagation_map + enable_interface_verification_assets，
围绕页面入口 <页面路径 / App 路由 / 组件名> 做完整链路梳理，并严格按代码事实输出。
```

推荐产物：

- 页面入口总览页
- 页面到接口映射页
- 主链路页
- 验证资产页

## 5. 如何选择哪种锚点

如果你最清楚的是：

- 接口地址：优先用“接口锚点”
- 功能名称：优先用“功能锚点”
- topic 名称：优先用“topic 锚点”
- 页面路径或页面动作：优先用“页面入口锚点”

简单判断规则：

- 想看“接口细节 + 参数 + handler”优先接口锚点
- 想看“业务动作全景”优先功能锚点
- 想看“消息生产消费关系”优先 topic 锚点
- 想看“前端入口到后端落点”优先页面入口锚点

## 6. 锚点越明确，结果通常越稳

建议用户尽量在命令里直接给出这些信息之一：

- 接口路径
- 方法名
- controller 名
- 功能名
- 页面路径
- topic 名

如果锚点过于模糊，比如只说：

- “帮我看看这个功能”
- “帮我梳理这块”

那么链路仍然能梳理，但：

- 范围会更大
- token 消耗会更高
- partially closed / clue-level 的比例通常会更多

## 7. 推荐配合阅读

- [场景化命令合集](./scenario-command-recipes.zh-CN.md)
- [按接口或功能查看完整链路](./full-chain-by-interface-or-feature.zh-CN.md)
- [全量完整模式](./full-analysis-mode.zh-CN.md)
