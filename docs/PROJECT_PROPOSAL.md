# BCI 科研智能体工具包 — 项目任务书

> 项目名称：BCI Research Toolkit — 基于多智能体协作的脑机接口科研自动化系统
> 版本：v0.1
> 日期：2026-06-26
> 负责人：BMG-SEU
> 仓库：https://github.com/BMG-SEU/bci-research-toolkit

---

## 一、项目概述

### 1.1 项目背景

脑机接口（BCI）与脑磁/脑电信号（MEG/EEG）研究涉及复杂的数据处理流程和大量的论文写作工作。课题组成员在日常科研中面临以下痛点：

- **数据处理流程繁琐**：MEG/EEG 预处理涉及滤波、ICA、伪影去除、分段等多个步骤，参数选择依赖经验
- **文献调研耗时**：从 PubMed、IEEE Xplore 等数据库检索、筛选、分类文献占用大量时间
- **论文写作门槛高**：英文学术写作对中文母语研究者存在语言障碍，IMRaD 结构需要反复修改
- **工具分散**：数据分析用 MNE-Python，文献管理用 Zotero，写作用 Word/LaTeX，缺少统一的工作流
- **知识传承困难**：高年级同学的经验难以系统化传递给低年级同学

### 1.2 项目目标

构建一套**开箱即用的科研智能体工具包**，让课题组成员通过自然语言对话，即可驱动多个 AI 专家自动协作完成：

1. **MEG/EEG 数据处理方案规划**（预处理策略推荐、参数建议、代码生成）
2. **系统化文献综述**（检索策略设计、文献分类、方法学对比、研究趋势分析）
3. **论文章节撰写与润色**（Methods / Results / Discussion 的结构化生成和 Nature 风格润色）

### 1.3 核心指标

| 指标 | 目标值 |
|------|--------|
| 部署时间 | ≤ 5 分钟（一条命令） |
| 月费用（5 人课题组） | ≤ ¥60 |
| 支持的科研场景 | ≥ 3 类（数据处理/文献综述/论文写作） |
| 预设工作流 | ≥ 3 个 |
| 科研专用 Agent | 7 个 |
| 科研方法论 Skills | 18 个（nature-* 8个 + paperspine-* 10个） |
| 平台兼容 | macOS / Windows / Linux |

---

## 二、技术架构

### 2.1 整体架构图

```
┌─────────────────────────────────────────────────┐
│                   课题组成员                      │
│         自然语言对话  │  预设工作流模板             │
│         ao compose   │  ao run workflows/        │
└────────────┬─────────┴──────────┬───────────────┘
             │                    │
┌────────────┴────────────────────┴───────────────┐
│              Agency Orchestrator                 │
│         （多 Agent 编排引擎 · YAML · DAG）         │
│   · ao compose：自然语言 → 自动拆解 → 角色匹配     │
│   · ao run：预设工作流模板执行                    │
│   · 自动并行检测 + 变量传递 + 失败重试             │
└────────────┬────────────────────────────────────┘
             │
     ┌───────┼───────────┬──────────────┐
     │       │           │              │
     ▼       ▼           ▼              ▼
┌─────────┐ ┌────────┐ ┌──────────┐ ┌──────────┐
│DeepSeek │ │ 科研    │ │ 科研      │ │ Claude   │
│  GLM    │ │ Skills  │ │ Agents    │ │ Code     │
│  API    │ │ 3个方法 │ │ 7个专家   │ │ 代码调试  │
│         │ │ 论       │ │ 角色      │ │          │
└─────────┘ └────────┘ └──────────┘ └──────────┘
```

### 2.2 核心组件

| 组件 | 选型 | 版本 | 用途 |
|------|------|------|------|
| 编排引擎 | agency-orchestrator | latest | 多 Agent 协作编排 |
| 主力 LLM | DeepSeek | deepseek-chat | 日常科研任务（¥2/1M tokens） |
| 备用 LLM | GLM（智谱） | glm-4 | 备用/高校免费额度 |
| 代码执行 | Claude Code | latest | 复杂 Python 脚本调试 |
| 方法论 | superpowers-zh | latest | 20 个通用开发方法论 |
| 运行环境 | Node.js | ≥ 18 | 编排引擎运行时 |

### 2.3 目录结构

```
bci-research-toolkit/
├── README.md                          # 中文使用说明
├── setup.sh / setup.bat               # 一键部署脚本
├── .env.example                       # API key 配置模板
├── .gitignore
│
├── agents/                            # 科研 Agent 定义
│   ├── meg-analyst.md                 # MEG 分析专家
│   ├── eeg-preprocessor.md            # EEG 预处理专家
│   ├── bci-literature-reviewer.md     # BCI 文献综述专家
│   ├── neuroscience-paper-writer.md   # 神经科学论文写手
│   ├── stats-methodologist.md         # 统计方法顾问
│   ├── figure-designer.md             # 科研图表设计师
│   └── code-reviewer-python.md        # Python 科学代码审查员
│
├── workflows/                         # 预设工作流
│   ├── meg-preprocessing.yaml         # MEG 预处理流水线
│   ├── literature-review.yaml         # 文献综述
│   └── paper-discussion.yaml          # 论文讨论部分撰写
│
├── skills/                            # 科研方法论（18 个）
│   ├── 写作/润色/翻译：paper-writing, paper-polish, paper-humanize, paper-translate, paper-rewrite
│   ├── 文献/引用：literature-search, nature-citation, paper-citation
│   ├── 数据/图表：nature-data, nature-figure, nature-reader
│   ├── 审稿/发表：nature-response, paper-research, paper-latex, paper-audit, paper-build
│   └── 工具：paper-intake, paper-update
│
├── prompts/                           # 提示词库（待扩展）
│   ├── literature-search.md
│   ├── paper-polish.md
│   ├── rebuttal-letter.md
│   └── grant-proposal.md
│
├── templates/                         # 论文模板（待扩展）
│   ├── imrad-template.md
│   └── figure-checklist.md
│
└── docs/                              # 文档
    ├── tutorial.md                    # 新手教程
    ├── workflow-guide.md              # 工作流使用指南
    └── faq.md                         # 常见问题
```

---

## 三、功能模块详述

### 3.1 科研 Agent 系统（7 个）

| Agent | 角色定位 | 核心能力 |
|-------|---------|---------|
| **MEG 分析专家** | MEG 数据处理顾问 | 预处理策略、时频分析、源定位、功能连接、MNE-Python 代码生成 |
| **EEG 预处理专家** | EEG 信号处理专家 | 滤波/ICA/伪影去除/ERP 分析，支持多种设备格式 |
| **BCI 文献综述员** | 系统化文献调研专家 | 检索策略设计、文献分类、质量评估、趋势分析 |
| **论文写作专家** | 神经科学学术写作者 | IMRaD 结构写作、期刊风格适配、科学叙事 |
| **统计方法顾问** | 生物统计学家 | 实验设计、假设检验、多重比较校正、效应量报告 |
| **图表设计师** | 科学可视化专家 | ERP/时频/地形/源定位图，matplotlib+MNE 代码 |
| **代码审查员** | Python 科学代码审查 | 正确性/性能/可复现性审查，MNE-Python 最佳实践 |

### 3.2 科研方法论 Skills（18 个）

#### Nature 系列（8 个）

| Skill | 来源 | 核心内容 |
|-------|------|---------|
| **论文写作** | nature-writing | IMRaD 结构、各章节模板、神经科学写作惯例 |
| **论文润色** | nature-polishing | 三层次润色（语法→表达→惯例）、期刊风格适配 |
| **文献搜索** | nature-academic-search | PICO 框架、多数据库策略、BCI 专题关键词 |
| **引用管理** | nature-citation | BCI 核心文献速查、引用完整性验证 |
| **数据方法** | nature-data | 数据特征诊断、方法选型决策树、参数速查 |
| **图表生成** | nature-figure | 期刊标准图表、MNE 可视化模板 |
| **论文精读** | nature-reader | 中英双语对照、图表感知、批判性阅读 |
| **审稿回复** | nature-response | 逐条回复审稿意见、Cover Letter |

#### PaperSpine 系列（10 个）

| Skill | 来源 | 核心内容 |
|-------|------|---------|
| **人性化改写** | paper-spine-humanize | 四层级降低 AIGC 检测率 |
| **中英互译** | paper-spine-translate | 逐行对照翻译、术语一致性 |
| **引用银行** | paper-spine-citation | 主张-引证匹配、分级证据质量 |
| **论文重写** | paper-spine-rewrite | 从材料重建结构、不依赖原稿 |
| **期刊调研** | paper-spine-research | 目标期刊分析、格式要求提取 |
| **论文组装** | paper-spine-build | 从零散材料组装 IMRaD 手稿 |
| **LaTeX排版** | paper-spine-latex | 项目骨架、图表管理、编译修复 |
| **输出审计** | paper-spine-audit | 完整性/一致性/BCI特定检查 |
| **工作流配置** | paper-spine-intake | 交互式收集配置、生成工作流方案 |
| **工具包更新** | paper-spine-update | 版本检查、依赖更新 |

### 3.3 预设工作流（3 个）

#### 工作流 1：MEG 数据预处理规划

```
输入：MEG .fif 文件路径
流程：
  check_data（数据质量评估）
    → recommend_preprocessing（预处理方案推荐）
    → code_framework（MNE-Python 代码生成）
    → summary（汇总报告）
输出：数据质量报告 + 预处理方案 + 可执行 Python 代码
```

#### 工作流 2：文献综述

```
输入：研究主题（如 "motor imagery BCI deep learning"）
流程：
  search_strategy（检索策略设计）
    → classify（文献分类框架）
    → methodology_review（方法学回顾）──┐
    → future_directions（未来方向）  ←──┘（并行）
    → write_review（撰写综述初稿）
输出：结构化文献综述（含检索策略+分类+对比+未来方向+参考文献）
```

#### 工作流 3：论文 Discussion 写作

```
输入：结果摘要 + 研究假设 + 局限性
流程：
  interpret（结果解释）
    → compare_literature（文献对比）──┐
    → discuss_limitations（局限性讨论）←┘（并行）
    → write_discussion（撰写 Discussion）
输出：完整 Discussion 章节（开头段+主体段+局限性+结论）
```

---

## 四、实施计划

### 4.1 已完成（v0.1）

- [x] 仓库骨架搭建（目录结构 + setup.sh/bat + .env.example + README）
- [x] 7 个科研 Agent 定义文件
- [x] 3 个核心工作流 YAML
- [x] 18 个科研 Skills（nature-* 8个 + paperspine-* 10个）
- [x] GitHub 仓库创建并推送
- [x] 完整项目任务书（docs/PROJECT_PROPOSAL.md）
- [x] 完整用户使用指南（docs/tutorial.md）
- [x] Web 图形界面（ao web）
- [x] setup.sh/bat 智能检测（已有跳过，无则自动装）
- [x] Claude Code 接入 DeepSeek 后端（零额外费用）

### 4.2 近期计划（v0.2）

- [ ] 工作流 4：eeg-analysis.yaml（EEG 分析流水线）
- [ ] 工作流 5：paper-methods.yaml（论文方法学撰写）
- [ ] 工作流 6：paper-results.yaml（论文结果部分撰写）
- [ ] Skill 4：eeg-artifact-removal（EEG 去伪影方法论）
- [ ] Skill 5：time-frequency-analysis（时频分析方法论）
- [ ] Skill 6：statistical-analysis（统计检验方法论）
- [ ] 提示词库：4 个高品质提示词
- [ ] 使用教程：docs/tutorial.md
- [ ] FAQ：docs/faq.md

### 4.3 中期计划（v0.3）

- [ ] 工作流 7：source-localization.yaml（源定位分析）
- [ ] 工作流 8：connectivity-analysis.yaml（功能连接分析）
- [ ] 工作流 9：paper-abstract.yaml（摘要生成）
- [ ] Skill 7：source-localization（源定位方法论）
- [ ] Skill 8：machine-learning-bci（BCI 机器学习方法论）
- [ ] Skill 9：academic-figure（科研图表生成）
- [ ] 工作流测试自动化（模拟数据验证）
- [ ] CI/CD：GitHub Actions 自动校验 YAML

### 4.4 远期计划（v1.0）

- [ ] 支持 MEG/EEG 数据文件实际读取（通过 MNE-Python bridge）
- [ ] Web 界面（`ao web` 图形化操作）
- [ ] 工作流市场（课题组间分享自定义工作流）
- [ ] Docker 镜像（一键启动完整环境）
- [ ] 支持更多国内 LLM（通义千问、文心一言、百川）
- [ ] 论文投稿全流程（Cover Letter → Submission → Response to Reviewers）

---

## 五、使用指南

### 5.1 环境要求

| 要求 | 说明 |
|------|------|
| 操作系统 | macOS 10.15+ / Windows 10+ / Ubuntu 18.04+ |
| Node.js | ≥ 18（https://nodejs.org） |
| DeepSeek API key | https://platform.deepseek.com/api_keys |
| （可选）Claude Code | 需 Anthropic 账号 |
| （可选）GLM API key | 智谱高校免费额度 |

### 5.2 快速开始

```bash
# 1. 克隆仓库
git clone git@github.com:BMG-SEU/bci-research-toolkit.git
cd bci-research-toolkit

# 2. 一键部署
bash setup.sh        # macOS / Linux
# setup.bat          # Windows（双击）

# 3. 编辑 .env 填入 API key
# DEEPSEEK_API_KEY=sk-xxx

# 4. 开始使用
# 方式一：自由对话
ao compose "帮我规划 MEG 数据的预处理方案" --run

# 方式二：预设工作流
ao run workflows/meg-preprocessing.yaml -i file_path=@data.fif
ao run workflows/literature-review.yaml -i topic="motor imagery BCI deep learning"
ao run workflows/paper-discussion.yaml -i results_summary=@results.md -i hypothesis="..." -i limitations="..."

# 方式三：图形界面
ao web
```

### 5.3 典型科研场景

| 场景 | 命令 |
|------|------|
| 拿到新 MEG 数据，不知道怎么处理 | `ao compose "我有一个 resting-state MEG 数据，采样率1000Hz，帮我规划预处理" --run` |
| 要写一篇 BCI 综述 | `ao run workflows/literature-review.yaml -i topic="deep learning for motor imagery BCI"` |
| Results 写好了，Discussion 写不出 | `ao run workflows/paper-discussion.yaml -i results_summary=@results.md -i hypothesis="..." -i limitations="..."` |
| 论文英文需要润色 | `ao compose "帮我润色这段 Discussion，目标是 NeuroImage 期刊" --run` （自动加载 paper-polish skill） |
| 写 MEG 分析脚本 | 切到 Claude Code：`claude "帮我写 MNE 预处理脚本"` |

---

## 六、费用估算

### 6.1 单次任务费用（DeepSeek）

| 任务类型 | 输入 tokens | 输出 tokens | 费用 |
|---------|------------|------------|------|
| MEG 预处理规划 | ~8,000 | ~2,000 | **¥0.02** |
| 文献综述（含 4 步协作） | ~40,000 | ~10,000 | **¥0.10** |
| 论文 Discussion 写作 | ~60,000 | ~20,000 | **¥0.16** |
| 论文润色 | ~15,000 | ~5,000 | **¥0.04** |

### 6.2 月度费用估算

| 场景 | 频次 | 月费用/人 | 5 人课题组 |
|------|------|----------|-----------|
| 轻量使用 | 每天 2 次 | ~¥12 | ~¥60 |
| 中度使用 | 每天 5 次 | ~¥30 | ~¥150 |
| 重度使用 | 每天 10 次 | ~¥60 | ~¥300 |

> DeepSeek 价格：¥2/1M tokens（输入）+ ¥8/1M tokens（输出）。以上按混合估算 ¥4/1M tokens。

### 6.3 成本优化建议

- 优先用 DeepSeek（性价比最高）
- 申请智谱高校免费额度作为备用
- 文献综述等长任务可以在非高峰期跑
- 已有 Claude 会员的同学用 Claude Code 写代码，用 DeepSeek 做分析写作

---

## 七、项目依赖与许可

### 7.1 核心依赖

| 包 | 协议 | 用途 |
|---|------|------|
| agency-orchestrator | Apache-2.0 | 多 Agent 编排引擎 |
| @anthropic-ai/claude-code | Proprietary | 代码编写与调试 |
| superpowers-zh | MIT | 20 个 AI 编程方法论 |

### 7.2 本项目许可

Apache-2.0 — 可自由使用、修改、分发，商业或个人均可。

---

## 八、贡献指南

### 8.1 添加新的 Agent

1. 在 `agents/` 目录创建 Markdown 文件
2. 按现有格式定义：角色、专长、工作方式、输出格式
3. 在工作流中引用新 Agent 的路径

### 8.2 添加新的工作流

1. 在 `workflows/` 目录创建 YAML 文件
2. 定义 steps、depends_on、变量传递
3. 用 `ao validate workflows/xxx.yaml` 校验

### 8.3 添加新的 Skill

1. 在 `skills/<name>/` 目录创建 SKILL.md
2. 按照 superpowers-zh 格式编写方法论
3. 在 Agent 或工作流步骤中引用

---

## 九、FAQ

**Q：必须装 Claude Code 吗？**
A：setup.sh 会帮你装，但日常分析规划写作只用 AO + DeepSeek 就够了。Claude Code 只在需要写复杂 Python 脚本调试时用。

**Q：我的 API key 安全吗？**
A：API key 只存在本地 `.env` 文件（已在 `.gitignore` 中），不会被推送到 GitHub。

**Q：能不用 DeepSeek 改用 OpenAI 吗？**
A：可以。编辑 `.env` 加上 `OPENAI_API_KEY`，然后 `ao compose ... --provider openai --run`。

**Q：工作流可以自定义吗？**
A：完全可以。所有工作流都是 YAML 文件，复制一份改参数就行。Agent 定义也是 Markdown，直接改。

**Q：会不会取代我们自己写代码？**
A：不会。它做的是「规划」和「建议」——推荐预处理策略、设计文献检索方案、生成论文初稿。具体的数据分析和实验还是你来做。

---

## 十、联系方式

- **GitHub**：https://github.com/BMG-SEU/bci-research-toolkit
- **Issues**：https://github.com/BMG-SEU/bci-research-toolkit/issues
- **仓库克隆**：`git clone git@github.com:BMG-SEU/bci-research-toolkit.git`
