---
name: bci-research-toolkit
description: "BCI/MEG/EEG 科研工具包 — 当用户提到 EEG、MEG、脑机接口、脑磁、脑电、MNE-Python、源定位、时频分析、功能连接、BCI论文、文献综述、审稿回复、论文润色、科研图表等学术/科研场景时使用。提供 23 个方法论 + 7 个专家角色 + 11 个工作流模板"
version: "1.0.0"
license: Apache-2.0
metadata:
  tools: [ao, claude-code]
  agents_dir: "agents/"
  workflows_dir: "workflows/"
  skills_dir: "skills/"
---

# BCI Research Toolkit

当用户提出 BCI/MEG/EEG 相关的科研需求时，按以下方式处理。

## 核心能力

本工具包提供三层能力：

1. **AO 工作流**：多角色自动协作，适合分析/规划/写作
2. **Claude Code 直接执行**：读写文件、跑 Python、调试，适合代码实现
3. **Skills 方法论**：让 AI 按专业方法工作

---

## 快速决策：什么时候用什么

| 用户想... | 用什么 | 具体操作 |
|---------|--------|---------|
| 规划分析（不含执行代码） | AO + DeepSeek | `ao compose "..." --run` 或 `ao run workflows/xxx.yaml` |
| 写代码 + 跑 Python | Claude Code 直接做 | `claude "..."` 或本 skill 直接执行 |
| 需要多角色讨论 | AO | `ao run workflows/xxx.yaml` |

---

## 11 个预设工作流

当用户的需求匹配以下场景时，推荐对应的 `ao run` 命令：

| 场景 | 命令模板 |
|------|---------|
| MEG/EEG 预处理规划 | `ao run workflows/meg-preprocessing.yaml -i file_path=@data.fif` |
| EEG 分析 | `ao run workflows/eeg-analysis.yaml -i file_path=@data.set -i analysis_type="..."` |
| 文献综述 | `ao run workflows/literature-review.yaml -i topic="..."` |
| 论文 Methods | `ao run workflows/paper-methods.yaml -i design="..." -i participants="..." ...` |
| 论文 Results | `ao run workflows/paper-results.yaml -i neural="..." ...` |
| 论文 Discussion | `ao run workflows/paper-discussion.yaml -i results_summary=@xxx.md -i hypothesis="..." -i limitations="..."` |
| 论文摘要 | `ao run workflows/paper-abstract.yaml -i background="..." ...` |
| 科研图表 | `ao run workflows/figure-generation.yaml -i data_desc="..." -i figure_type="..."` |
| 源定位 | `ao run workflows/source-localization.yaml -i file_path=@data.fif -i method="dSPM"` |
| 功能连接 | `ao run workflows/connectivity-analysis.yaml -i file_path=@data.fif -i bands="alpha"` |
| 读真实数据 | `ao run workflows/data-analysis-bridge.yaml -i file_path=@data.fif` |

---

## 7 个科研 Agent（AO 工作流中自动匹配）

当 AO 编排工作流时，会自动从以下 Agent 中匹配角色：

- `meg-analyst`：MEG 信号处理全流程
- `eeg-preprocessor`：EEG 滤波、ICA、伪影
- `bci-literature-reviewer`：系统化文献检索与分类
- `neuroscience-paper-writer`：IMRaD 神经科学论文写作
- `stats-methodologist`：统计检验、多重比较
- `figure-designer`：科学可视化、MNE/matplotlib
- `code-reviewer-python`：MNE-Python 代码正确性/性能/可复现性

---

## 23 个 Skills 方法论

当用户需求涉及以下关键词时，主动加载对应的方法论指导：

### 论文写作类
- `paper-writing`：IMRaD 结构、各章节模板
- `paper-polish`：三层次润色（语法→表达→学术惯例）
- `paper-humanize`：降低 AIGC 检测率
- `paper-translate`：中英学术互译
- `paper-rewrite`：从材料重建论文结构
- `paper-build`：从零散材料组装完整手稿
- `paper-latex`：LaTeX 项目与图表管理

### 文献与引用类
- `literature-search`：PICO 框架、数据库策略
- `nature-citation`：BCI 核心文献速查
- `paper-citation`：主张-引证匹配、证据分级

### 期刊与发表类
- `nature-response`：审稿意见逐条回复
- `paper-research`：目标期刊调研、投稿材料
- `paper-audit`：论文完整性审计
- `paper-intake`：工作流配置向导
- `paper-update`：工具包版本检查

### BCI/MEG/EEG 专属类
- `eeg-artifact-removal`：眼电/肌电/心电伪影去除
- `time-frequency-analysis`：Morlet/Multi-taper/Hilbert
- `statistical-analysis`：聚类置换检验、FDR、效应量
- `source-localization`：dSPM/sLORETA/beamformer
- `machine-learning-bci`：CSP/EEGNet/迁移学习

### 数据与图表类
- `nature-data`：方法选型决策树、参数速查
- `nature-figure`：期刊标准图表、MNE 可视化
- `nature-reader`：中英双语论文精读

---

## 提示词库

本项目的 `prompts/` 目录下有 89+ 个学术写作提示词（来自 academic-ai-prompt-main v2.1），涵盖：
- 论文选题（生成 100 个候选 + 5 维度评估）
- 论文查找（8 个快速查找方案）
- 文献综述（分类框架 + 结构化写作）
- 论文写作（顶刊风格全文写作）

当用户需要写作参考时，可以引导查看 `prompts/AI科研写作Prompt合集.md`。

---

## 费用提示

- DeepSeek API：¥2/1M tokens，一次论文分析 ¥0.01-0.16
- Claude Code 底层如配了 DeepSeek，费用相同
- 充值指南：https://platform.deepseek.com
- `.env` 配置见项目 README

---

## 可执行工具 (Executable Tools)

以下脚本可直接被 Claude Code 调用执行：

| 工具 | 路径 | 功能 |
|------|------|------|
| 工作流执行器 | `scripts/run_workflow.sh` | 列出/执行/编排 AO 工作流 |
| YAML 校验器 | `scripts/validate_all.sh` | 校验全部 11 个工作流 YAML 合法性 |

使用方式（在项目目录下）：
```bash
# 列出所有工作流
bash .claude/skills/bci-research-toolkit/scripts/run_workflow.sh list

# 执行预设工作流
bash .claude/skills/bci-research-toolkit/scripts/run_workflow.sh run literature-review -i topic="motor imagery BCI"

# 自然语言编排
bash .claude/skills/bci-research-toolkit/scripts/run_workflow.sh compose "帮我分析MEG时频特征"

# 校验所有 YAML
bash .claude/skills/bci-research-toolkit/scripts/validate_all.sh
```

---

## 完整文档

- 项目介绍：`docs/PROJECT_OVERVIEW.md`
- 项目任务书：`docs/PROJECT_PROPOSAL.md`
- 小白使用指南：`docs/tutorial.md`
- FAQ：`docs/faq.md`
- 测试报告：`docs/TEST_REPORT.md`
