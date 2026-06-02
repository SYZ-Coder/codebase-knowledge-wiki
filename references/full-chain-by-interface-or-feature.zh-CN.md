# 按接口或功能查看完整链路的使用说明

本文说明：如果用户想围绕“某个接口”或“某个业务功能”查看一整套完整链路，包括：

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

这种场景本质上不是单纯地“看一个接口定义”，而是：

- 以某个接口或功能为锚点
- 追踪整条跨层链路
- 同时补齐契约、字段、上下文、异步、外部依赖等侧面

所以最稳的做法不是只跑一个命令，而是：

- 以后端服务规格分析流程为主
- 启用跨技术栈扩展分析
- 再按需打开若干可选开关

针对不同工具：

- `Codex`：适合保留 `$backend-service-spec-skill` / `$cross-tech-stack-spec-skill` 的显式写法
- `Claude Code`：更适合使用项目内技能 / 命令或自然语言工作流提示词
- `Cursor`：更适合使用基于规则的工作流提示词，而不是 `$backend-service-spec-skill` 技能注册表写法

## 2. 推荐开启哪些能力

### 最小可用组合

适合先拿一版主链路结果：

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

适合问题复杂，还要补失败路径和验证材料：

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
- 已知方法名
- 已知 controller 方法
- 已知前端调用地址

推荐提示词：

### Codex

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，
同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_async_contract_map + enable_external_dependency_dossier，
围绕接口 <接口路径 / 方法名 / controller 方法> 做完整链路梳理。
要求：
1. 从 caller 入口开始识别
2. 输出请求地址、接口参数、响应字段
3. 输出 gateway / BFF / controller / service / feign / http / mq / kafka / callback 链路
4. 如果存在 Kafka 或 MQ，输出 topic、producer、consumer、payload 线索
5. 如果存在外部团队服务，输出外部依赖档案
6. 严格标注 closed / partially closed / clue-level / unresolved
```

### Claude Code

```text
请按后端服务规格分析流程为主，并启用跨技术栈扩展分析，
同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_async_contract_map + enable_external_dependency_dossier，
围绕接口 <接口路径 / 方法名 / controller 方法> 做完整链路梳理。
要求：
1. 从 caller 入口开始识别
2. 输出请求地址、接口参数、响应字段
3. 输出 gateway / BFF / controller / service / feign / http / mq / kafka / callback 链路
4. 如果存在 Kafka 或 MQ，输出 topic、producer、consumer、payload 线索
5. 如果存在外部团队服务，输出外部依赖档案
6. 严格标注 closed / partially closed / clue-level / unresolved
```

### Cursor

```text
请使用后端服务规格分析流程为主，并启用跨技术栈扩展分析，
同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_async_contract_map + enable_external_dependency_dossier，
围绕接口 <接口路径 / 方法名 / controller 方法> 做完整链路梳理，并严格按代码事实输出。
要求：
1. 从 caller 入口开始识别
2. 输出请求地址、接口参数、响应字段
3. 输出 gateway / BFF / controller / service / feign / http / mq / kafka / callback 链路
4. 如果存在 Kafka 或 MQ，输出 topic、producer、consumer、payload 线索
5. 如果存在外部团队服务，输出外部依赖档案
6. 严格标注 closed / partially closed / clue-level / unresolved
```

## 4. 如果锚点是“功能”

适用于：

- 已知页面功能
- 已知按钮动作
- 已知某个业务动作
- 已知某个用户流程

### 4.1 如果只有功能点，没有明确接口 / 页面锚点

当用户只给出“创建虚拟角色”“生成剧本”“发布内容”这类功能点，但没有给出接口路径、controller 方法、页面路径、按钮名或 topic 名时，不能直接从后端接口开始猜测链路。

此时应启用跨技术栈分析里的“无锚点功能追踪增强规则”：先做入口候选发现，再补 App/H5 侧状态机与交互逻辑，最后再反推首个接口和后端链路。

推荐执行顺序：

1. 先按功能关键词搜索 App/H5/前端入口，例如页面名、路由常量、按钮文案、埋点名、ViewModel 方法、Service API wrapper。
2. 如果用户给了模块线索，例如 `PublishModule`、某个 H5 目录、某个页面组件，先在该范围内找入口；找不到再扩大到整个 App/H5 仓库。
3. 找到候选入口后，先输出“入口候选表”，不要立刻把某个接口写成事实锚点。
4. 对命中的页面或组件补一节“App/H5 侧功能状态机与交互逻辑”，包括页面参数、入口分支、按钮状态、表单字段、前置接口、异步轮询、上传/选择、跳转返回、失败提示。
5. 再从 App/H5 的 API wrapper、ViewModel、request client、bridge handler 反推首个后端接口。
6. 首个接口闭合后，再进入 controller / service / feign / http / mq / kafka / callback 链路。
7. 如果 App/H5 侧只找到页面但没有找到接口调用，必须标为 `partially closed` 或 `clue-level`，不能虚构接口。

必须补充的 App/H5 侧输出：

- 功能入口候选表：页面、路由、按钮、组件、调用点、证据位置、闭环状态
- 页面参数表：route params、intent extras、query params、props、store/context 字段
- 交互状态机：普通新建 / 编辑 / 复制 / 模板 / 外部入口等分支
- 前置接口清单：初始化查询、AI 补全、图片生成、上传、轮询、选择、校验等
- 最终提交接口反推：从按钮点击到 ViewModel/API wrapper/request client 的调用链
- 字段写入表：用户输入、AI 回填、上传/选择结果如何写入 request bean 或 form state
- 保存按钮启用规则：必填项、loading 态、AI 生成中、图片生成中、权限弹窗等
- 成功后行为：setResult、RouteJump、页面关闭、H5 跳转、callback、event bus
- 失败路径：Toast、弹窗、接口失败回调、本地校验失败、轮询失败

建议新增到产物中的章节名：

```text
App/H5 侧功能状态机与交互逻辑补充
```

如果是移动端或 H5 混合项目，建议在 Mermaid 中补一张状态机图：

```text
入口页面 -> 参数读取 -> 初始化分支 -> 用户编辑/生成/上传/选择 -> 按钮校验 -> 提交接口 -> 成功跳转/返回
```

### 4.2 无锚点功能追踪的风控规则

该增强规则必须作为可控扩展使用，不应替代已有接口锚点、方法锚点、页面锚点或 topic 锚点。

启用条件：

- 仅当用户只有功能点，且没有明确接口路径、controller 方法、页面路径、按钮名或 topic 名时启用
- 如果用户已经给出明确接口或方法，优先走接口锚点流程，不启用无锚点追踪
- 如果用户给了模块线索，必须先限定在该模块内查找，不应直接全仓库扫描

风控执行规则：

1. 先限制搜索范围，优先级为：用户给定模块 > App/H5 页面模块 > 前端 API wrapper > 后端 Controller > 全仓库搜索。
2. 第一阶段只输出入口候选表，不允许直接把某个接口写成事实锚点。
3. 只有 `closed` 或 `partially closed` 的候选可以继续深追。
4. `clue-level` 只能作为线索，不能写成事实结论。
5. 如果候选入口超过 5 个，应停止深追，并提示需要用户补充模块名、页面名、按钮名、接口名或关键词。
6. 如果 App/H5 侧找不到调用点，不得直接构造后端接口链路。
7. 如果 topic 只在配置或常量中出现，但没有 producer / consumer 代码证据，不得写成完整 MQ/Kafka 链路。
8. 每个阶段只读取当前阶段必要代码，避免一次性加载 App/H5、后端、MQ、网关和外部依赖的全部上下文。

推荐阶段边界：

1. 阶段 1：入口候选发现
2. 阶段 2：App/H5 状态机与交互逻辑
3. 阶段 3：首个接口反推
4. 阶段 4：后端同步链路
5. 阶段 5：MQ/Kafka/异步链路
6. 阶段 6：外部依赖与验证资产

停止条件：

- 候选超过 5 个且无法可靠排序
- 功能关键词过于通用，导致命中大量无关页面或方法
- 入口页面存在，但提交接口无法从代码闭合
- 后端接口无法闭合到 controller / handler
- 异步 topic 缺少 producer 侧或 consumer 侧证据

无锚点推荐提示词：

### Codex

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，
同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets，
围绕功能 <功能名称> 做完整链路梳理。

当前只有功能点，没有明确接口锚点。请先执行“无锚点功能追踪增强规则”：
1. 先从 App/H5/前端入口候选开始找，包括页面、路由、按钮、组件、ViewModel、API wrapper、埋点名。
2. 如果用户提供了模块线索，请先在该模块内查找；找不到再扩大范围。
3. 先输出入口候选表，并标注 closed / partially closed / clue-level / unresolved。
4. 必须补充 App/H5 侧功能状态机与交互逻辑，包括页面参数、入口分支、按钮状态、表单字段、前置接口、图片/上传/轮询、AI/异步生成、跳转返回、失败提示。
5. 再从 App/H5 调用点反推首个后端接口，并继续梳理 gateway / BFF / controller / service / feign / http / mq / kafka / callback 链路。
6. 输出接口参数、地址、字段流转、上下文透传、失败路径、验证资产。
7. 如果存在 topic，输出 topic 对应的生产者、消费者、处理服务和 payload 线索。
8. 严格按代码事实输出，不能把猜测写成事实。
9. 默认不做全仓库深追；只有当前限定范围找不到入口时，才扩大搜索范围。
10. 如果候选入口超过 5 个，请先停止并输出候选表，不要继续生成完整链路。
11. 只有 closed / partially closed 的候选可以继续深追；clue-level 只能作为线索。
12. 如果某段链路无法闭合，请标注 unresolved，不要补写推测链路。
```

### Claude Code

```text
请按后端服务规格分析流程为主，并启用跨技术栈扩展分析，
同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets，
围绕功能 <功能名称> 做完整链路梳理。

当前只有功能点，没有明确接口锚点。请先执行“无锚点功能追踪增强规则”：
1. 先从 App/H5/前端入口候选开始找，包括页面、路由、按钮、组件、ViewModel、API wrapper、埋点名。
2. 如果用户提供了模块线索，请先在该模块内查找；找不到再扩大范围。
3. 先输出入口候选表，并标注 closed / partially closed / clue-level / unresolved。
4. 必须补充 App/H5 侧功能状态机与交互逻辑，包括页面参数、入口分支、按钮状态、表单字段、前置接口、图片/上传/轮询、AI/异步生成、跳转返回、失败提示。
5. 再从 App/H5 调用点反推首个后端接口，并继续梳理 gateway / BFF / controller / service / feign / http / mq / kafka / callback 链路。
6. 输出接口参数、地址、字段流转、上下文透传、失败路径、验证资产。
7. 如果存在 topic，输出 topic 对应的生产者、消费者、处理服务和 payload 线索。
8. 严格按代码事实输出，不能把猜测写成事实。
9. 默认不做全仓库深追；只有当前限定范围找不到入口时，才扩大搜索范围。
10. 如果候选入口超过 5 个，请先停止并输出候选表，不要继续生成完整链路。
11. 只有 closed / partially closed 的候选可以继续深追；clue-level 只能作为线索。
12. 如果某段链路无法闭合，请标注 unresolved，不要补写推测链路。
```

### Cursor

```text
请使用后端服务规格分析流程为主，并启用跨技术栈扩展分析，
同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets，
围绕功能 <功能名称> 做完整链路梳理。

当前只有功能点，没有明确接口锚点。请先执行“无锚点功能追踪增强规则”：
1. 先从 App/H5/前端入口候选开始找，包括页面、路由、按钮、组件、ViewModel、API wrapper、埋点名。
2. 如果用户提供了模块线索，请先在该模块内查找；找不到再扩大范围。
3. 先输出入口候选表，并标注 closed / partially closed / clue-level / unresolved。
4. 必须补充 App/H5 侧功能状态机与交互逻辑，包括页面参数、入口分支、按钮状态、表单字段、前置接口、图片/上传/轮询、AI/异步生成、跳转返回、失败提示。
5. 再从 App/H5 调用点反推首个后端接口，并继续梳理 gateway / BFF / controller / service / feign / http / mq / kafka / callback 链路。
6. 输出接口参数、地址、字段流转、上下文透传、失败路径、验证资产。
7. 如果存在 topic，输出 topic 对应的生产者、消费者、处理服务和 payload 线索。
8. 严格按代码事实输出，不能把猜测写成事实。
9. 默认不做全仓库深追；只有当前限定范围找不到入口时，才扩大搜索范围。
10. 如果候选入口超过 5 个，请先停止并输出候选表，不要继续生成完整链路。
11. 只有 closed / partially closed 的候选可以继续深追；clue-level 只能作为线索。
12. 如果某段链路无法闭合，请标注 unresolved，不要补写推测链路。
```

功能锚点推荐提示词：

### Codex

```text
请以 $backend-service-spec-skill 为主流程，并启用 $cross-tech-stack-spec-skill，
同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets，
围绕功能 <功能名称> 做完整链路梳理。
要求：
1. 从功能入口页面、按钮、App/H5 调用点或首个接口开始
2. 输出涉及的前端、网关、后端、外部服务、MQ、Kafka 链路
3. 输出参数、地址、字段流转、上下文透传、失败路径、验证资产
4. 如果存在 topic，输出 topic 级别的 producer、consumer 和处理服务
5. 严格按代码事实输出
```

### Claude Code

```text
请按后端服务规格分析流程为主，并启用跨技术栈扩展分析，
同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets，
围绕功能 <功能名称> 做完整链路梳理。
要求：
1. 从功能入口页面、按钮、App/H5 调用点或首个接口开始
2. 输出涉及的前端、网关、后端、外部服务、MQ、Kafka 链路
3. 输出参数、地址、字段流转、上下文透传、失败路径、验证资产
4. 如果存在 topic，输出 topic 级别的 producer、consumer 和处理服务
5. 严格按代码事实输出
```

### Cursor

```text
请使用后端服务规格分析流程为主，并启用跨技术栈扩展分析，
同时开启 enable_contract_map + enable_gateway_map + enable_field_lineage + enable_context_propagation_map + enable_error_semantics + enable_async_contract_map + enable_external_dependency_dossier + enable_interface_verification_assets，
围绕功能 <功能名称> 做完整链路梳理。
要求：
1. 从功能入口页面、按钮、App/H5 调用点或首个接口开始
2. 输出涉及的前端、网关、后端、外部服务、MQ、Kafka 链路
3. 输出参数、地址、字段流转、上下文透传、失败路径、验证资产
4. 如果存在 topic，输出 topic 级别的 producer、consumer 和处理服务
5. 严格按代码事实输出
```

## 5. 在 Claude Code 中如何使用

`Claude Code` 不一定存在像 `Codex` 那样的 `$skill-name` 原生技能注册机制。

更稳妥的用法是：

- 如果项目已经通过 `.claude/skills/` 安装了项目内技能目录，可以使用项目内技能型提示词
- 如果项目已经通过 `.claude/commands/` 安装了命令模板，可以使用 slash command
- 如果项目只是通过 `CLAUDE.md` 或说明文件接入，更推荐直接使用自然语言工作流提示词

如果项目里已安装 `.claude/commands/`，命令型入口可以写成：

```text
/crate-router-map scope=<接口或功能> goal=围绕当前锚点梳理完整链路，并补充 gateway、service、mq、callback、失败路径和验证资产
```

如果项目里已安装 `.claude/skills/`，项目内技能型入口可以写成：

```text
/backend-service-spec-skill 围绕接口 <接口路径> 执行完整链路分析，并启用跨技术栈扩展分析
```

对于只有功能点、没有明确接口锚点的场景，建议把“无锚点功能追踪增强规则”整段提示词直接发给 Claude Code，而不是只给一句“帮我查这个功能”。

## 6. 在 Cursor 中如何使用

`Cursor` 主要通过 `.cursor/rules/*.mdc` 和自然语言任务工作，而不是通过 `$backend-service-spec-skill` 这种技能注册表调用。

所以在 `Cursor` 中：

- 不建议直接写 `$backend-service-spec-skill`
- 更推荐写“按后端服务规格分析流程为主，并启用跨技术栈扩展分析”
- 开关名如 `enable_contract_map` 可以保留原样
- 不应把这种方式表述成原生技能执行，而应表述成“基于规则的工作流执行”

Cursor 安装完成后通常不需要再手动配置规则，只要这些文件已经在目标项目里即可：

- `.cursor/rules/backend-service-spec-skill.mdc`
- `.cursor/rules/cross-tech-stack-spec-skill.mdc`
- `skills/backend-service-spec-skill/SKILL.md`
- `skills/cross-tech-stack-spec-skill/SKILL.md`

## 7. 这类链路通常会产出什么

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

## 8. 如何提高识别准确度

建议用户在提示词里尽量给出以下锚点之一：

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

## 9. 关于 Kafka / MQ / topic 的说明

如果目标里明确提到 Kafka / MQ / topic，建议在提示词里明确要求输出：

- topic 名称
- producer 服务
- consumer 服务
- 发送位置
- 消费位置
- payload/schema 线索
- retry / DLQ / 补偿线索

推荐附加表达：

```text
如果存在 Kafka / MQ，请按 topic 维度输出生产者、消费者、发送位置、消费位置、payload 线索，以及 retry / DLQ / 补偿信息。
```

## 10. 关于“完整”二字的正确理解

这里的“完整链路”，更准确地说应理解为：

- 所有可识别能力都围绕该接口或功能做输出
- 能闭环的尽量闭环
- 不能闭环的明确标注原因

而不是默认承诺：

- 所有系统一定 100% 闭环
- 所有外部依赖都能双边确认
- 所有 topic 都能自动推到最终业务语义

所以这类提示词最好始终附带：

- `严格按代码事实输出`
- `标注 closed / partially closed / clue-level / unresolved`

## 11. 推荐搭配阅读

- [团队标准工作流](./team-standard-workflow.zh-CN.md)
- [全量分析模式](./full-analysis-mode.zh-CN.md)
- [场景命令配方](./scenario-command-recipes.zh-CN.md)
- [扩展技能详细使用指南](../cross-tech-stack-spec-skill/references/extension-usage-guide.zh-CN.md)
