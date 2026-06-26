# BCI Research Toolkit

> 脑机接口与脑磁/脑电信号 — 科研智能体工具包

**一句话：** 让多个 AI 专家自动协作，帮你做 MEG/EEG 数据处理规划和论文写作。

---

## 🚀 5 分钟上手

```bash
# 1. 克隆
git clone <本仓库地址>
cd bci-research-toolkit

# 2. 一键部署
bash setup.sh        # macOS / Linux
# 或双击 setup.bat   # Windows

# 3. 编辑 .env 填入 DeepSeek API key
# （充 10 块钱能用很久，¥2/1M tokens）

# 4. 开始使用
ao compose "帮我分析 MEG 数据的时频特征" --run
```

> 需要 DeepSeek API key：https://platform.deepseek.com/api_keys

---

## 📦 装了什么

| 工具 | 作用 | 一句话 |
|------|------|--------|
| agency-orchestrator | 🎬 多Agent编排 | 一句话调度 266 个 AI 专家协作 |
| Claude Code | 💻 写代码调试 | 写 Python 脚本、跑测试、改 Bug |
| superpowers-zh | 🧠 工作方法论 | 20 个 skills 教 AI 怎么干活（TDD/调试/审查） |

---

## 🧠 科研专属能力

### 预设工作流（待添加）
- MEG 预处理规划
- EEG 时频分析
- 源定位分析
- 文献综述
- 论文方法学/结果/讨论写作

### 科研 Agent（待添加）
- EEG 预处理专家
- MEG 分析专家
- BCI 文献综述员
- 神经科学论文写手
- 统计方法顾问
- 科研图表设计师
- Python 科学代码审查员

---

## 💰 费用估算

| 场景 | 费用（DeepSeek） |
|------|-----------------|
| 一次 MEG 预处理规划 | ¥0.01 |
| 一次文献综述 | ¥0.10 |
| 一篇论文 Discussion | ¥0.16 |
| 每人每天 | ~¥0.40 |
| 5 人课题组月费 | ~¥60 |

---

## ❓ FAQ

**Q：必须装 Claude Code 吗？**
A：setup.sh 会帮你装。Claude Code 用于写代码和调试（如 MNE-Python 脚本）。纯分析规划写作可以用 AO + DeepSeek。

**Q：DeepSeek 花完了怎么办？**
A：GLM（智谱）API 作为备用。国内高校常能申请免费额度。

**Q：能用自己的 OpenAI key 吗？**
A：可以。编辑 `.env` 加上 `OPENAI_API_KEY`，然后在工作时指定 `--provider openai`。

---

## 📁 目录结构

```
bci-research-toolkit/
├── setup.sh / setup.bat     # 一键部署
├── .env.example             # API key 模板
├── agents/                  # 科研 Agent 定义（待添加）
├── workflows/               # 预设工作流（待添加）
├── skills/                  # 科研方法论（待添加）
├── prompts/                 # 高品质提示词库（待添加）
├── templates/               # 论文模板（待添加）
└── docs/                    # 教程文档（待添加）
```
