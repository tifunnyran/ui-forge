# ui-forge

可运行的 Vue UI 原型位于 [ui-prototype](ui-prototype/)。运行方式见 [UI-PROJECT.md](ui-prototype/UI-PROJECT.md)，提取记录见 [extraction-report.md](ui-prototype/extraction-report.md)。

`ui-forge` 以已有项目的 UI 层为原料，提取出可独立预览的纯前端，再持续编辑、扩展和新增模块。保留前端交互与原项目设计语言，移除后端依赖。

## 三种模式

| 模式 | 用途 | 结果 |
| --- | --- | --- |
| `extract` | 从完整项目中分离 UI | 可运行、仅使用必要 mock 字段的 UI |
| `extend` | 调整布局、样式、交互或组件结构 | 沿用同一视觉系统的 UI |
| `add` | 新增用户指定的页面或 UI 模块 | 沿用项目现有视觉系统的新模块 |

Skill 入口是 [SKILL.md](SKILL.md)，模式细节见 [references/modes.md](references/modes.md)。

## 核心边界

- 只处理视图、样式、静态资源、本地 UI 状态和前端交互；不实现后端 API、鉴权、持久化或业务规则。
- 用户要求修改项目时，只改明确指定的功能或区域及其必要的直接依赖；目标、行为、文案或视觉要求不清楚时先提问并等待回答，不自行猜测或扩展范围。
- 不添加无实际用途的说明、占位文案或额外模块；新增内容必须沿用项目现有视觉语言和配色，缺少可靠参照时先询问用户。
- 产物必须可运行。只用当前 UI 呈现所需的最少 mock 字段替代被移除的数据依赖，不补造无关交互或状态。
- 首次将项目提取为纯 UI 时，原有前端样式必须保持不变；不得借机调整 CSS、类名、主题、断点或视觉资源，也不得在这一轮做 token 化和组件样式重构。
- 后续 `extend` / `add` 只复用本次改动所需的现有 token 与公共组件；仅在指定 UI 必须新增时添加，不全局整理样式或组件。
- 在重要的后端移除或替换位置写符合宿主语言语法的 `[UI-FORGE] removed:` 注释；首次提取时将映射记录到 `extraction-report.md`。
- 不将凭据、token 或密钥带入产物。

## 产出与验收

首次 `extract` 交付可运行的前端代码及 `extraction-report.md`，记录后端移除与 mock 映射、原样式保留证据和未验证的状态。`extend` / `add` 默认不创建或更新报告，也不为满足规范而建立 token 文件、样式约定或公共组件。[assets/tokens.css](assets/tokens.css) 与 [assets/extraction-report.md](assets/extraction-report.md) 仅在对应工作确有需要时使用。

首次 `extract` 运行一次 `scripts/validate.sh <输出目录>` 检查后端或密钥残留；`extend` / `add` 仅在本次改动存在这类具体风险时运行。小范围修改默认只做一次针对性检查，通过即停止；不例行重复构建、运行全套测试、遍历页面或批量截图。
