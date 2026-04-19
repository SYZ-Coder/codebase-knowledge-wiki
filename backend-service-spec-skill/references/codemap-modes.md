# 跨服务 create_codemap 模式

## 1. 目标

把 sdd-riper 原有 `create_codemap` 从“功能级 / 项目级地图”扩展到“跨服务地图”，并补上真实多仓工作区需要的范围识别能力。

## 2. 前置判断

在选择模式前，先判断：

- 当前是 `single-system`、`service-family` 还是 `multi-system-workspace`
- 本轮要产出索引页还是稳定页
- 当前 scope 是否需要先拆 family

如果是 `multi-system-workspace`：

- 第一轮优先 `mode=service_landscape`
- 先做家族切分
- 暂不直接推业务域

## 3. 支持模式

### 3.1 `mode=service_landscape`

用于跨服务总图。

应输出：

- workspace 范围判断
- 服务清单
- 服务边界
- 项目/模块归属
- 服务间依赖方向
- 同步通信方式
- 异步通信方式
- 外部系统
- 技术栈分布
- 风险热点

推荐文档结构：

1. 梳理范围
2. workspace 范围判断
3. 服务清单
4. 服务职责与边界
5. 通信关系总图
6. 技术架构与中间件
7. 关键业务链路索引
8. 风险与盲区
9. 证据来源

### 3.2 `mode=service_chain`

用于围绕一条跨服务业务链路做服务地图。

应输出：

- 触发入口
- 上游调用方
- 下游提供方
- 中间状态
- 异步分支
- 返回路径
- 错误与补偿线索

### 3.3 `mode=project`

沿用 sdd-riper 项目级总图。

### 3.4 `mode=feature`

沿用 sdd-riper 功能级地图。

## 4. 命名建议

- `mydocs/codemap/YYYY-MM-DD_hh-mm_<name>服务总图.md`
- `mydocs/codemap/YYYY-MM-DD_hh-mm_<name>链路地图.md`
- `mydocs/codemap/YYYY-MM-DD_hh-mm_<project>项目总图.md`
- `mydocs/codemap/YYYY-MM-DD_hh-mm_<feature>功能.md`

## 5. 事实边界

- 仅从单边依赖能看到的服务关系，必须标注为单边已见，不自动升级为闭环
- 仅从配置名、topic 名、client 名看到的内容，不自动升级为契约事实
- 若链路需要多服务交叉才能成立，但当前未读全，标记“待闭环”
- 如果 scope 本身是多系统工作区，不得默认写成统一运行时系统
