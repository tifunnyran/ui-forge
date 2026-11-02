# ui-forge

`ui-forge` 以已有项目的 UI 层为原料，提取出可独立预览的纯前端，再持续编辑、扩展和新增模块。保留前端交互与原项目设计语言，移除后端依赖。

## 三种模式

| 模式 | 用途 | 结果 |
| --- | --- | --- |
| `extract` | 从完整项目中分离 UI | 可运行、使用代表性 mock 数据的 UI |
| `extend` | 调整布局、样式、交互或组件结构 | 沿用同一视觉系统的 UI |
| `add` | 新增页面、弹窗、表单、列表或导航 | 复用公共组件与 token 的新模块 |

Skill 入口是 [SKILL.md](SKILL.md)，模式细节见 [references/modes.md](references/modes.md)。

## 核心边界

- 只处理视图、样式、静态资源、本地 UI 状态和前端交互；不实现后端 API、鉴权、持久化或业务规则。
- 产物必须可运行。用字段形状匹配的 mock 数据和本地交互替代被移除的依赖。
- 从原 UI 提炼统一的 token。行为与视觉规则相同的控件只保留一份公共实现；尺寸、色调和状态差异用变体表达。
- 在重要移除或替换位置写符合宿主语言语法的 `[UI-FORGE] removed:` 注释，并记录到 `extraction-report.md`。
- 不将凭据、token 或密钥带入产物。

## 产出与验收

每次完成任务应交付可运行的前端代码、集中定义的 token 或 theme 文件、简短的样式约定，以及 `extraction-report.md`。报告记录移除的依赖、mock 替换、token 清单、公共组件清单和被替换的重复实现。[assets/tokens.css](assets/tokens.css) 与 [assets/extraction-report.md](assets/extraction-report.md) 是示例和模板，使用时须按原项目框架与设计调整。

运行 `scripts/validate.sh <输出目录>` 扫描常见后端调用、持久化 API、环境文件和私钥痕迹。脚本只能做启发式检查；还需人工核对依赖、数据流、组件复用与视觉一致性。
