# BCI Research Toolkit

> 脑机接口与脑磁/脑电信号 — 科研智能体工具包

**一句话：** 让多个 AI 专家自动协作，帮你做 MEG/EEG 数据处理规划和论文写作。

---

## 🚀 5 分钟上手

### 方式一：传统安装
```bash
git clone git@github.com:BMG-SEU/bci-research-toolkit.git
cd bci-research-toolkit
bash setup.sh    # 一键部署
```

### 方式二：Docker（零环境依赖）
```bash
git clone git@github.com:BMG-SEU/bci-research-toolkit.git
cd bci-research-toolkit
# 编辑 .env 填入 DEEPSEEK_API_KEY
docker compose up -d       # 一键启动
# 浏览器打开 http://localhost:3000
```

# 3. 编辑 .env 填入 DeepSeek API key
# （充 10 块钱能用很久，¥2/1M tokens）

# 4. 启动（图形界面，推荐）
ao web
# 浏览器自动打开，选模板 → 填参数 → 点击运行

# 或者命令行模式
ao compose "帮我分析 MEG 时频特征" --run
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

### 预设工作流（11 个）
- ✅ MEG 预处理规划
- ✅ 文献综述
- ✅ 论文 Discussion 写作
- ✅ 论文方法学撰写
- ✅ 论文结果撰写
- ✅ EEG 数据分析
- ✅ 源定位分析
- ✅ 功能连接分析
- ✅ 论文摘要写作
- ✅ 科研图表生成
- ✅ 数据文件实际读取（AO+Claude Code桥接）

### 科研 Agent（7 个）
- ✅ EEG 预处理专家
- ✅ MEG 分析专家
- ✅ BCI 文献综述员
- ✅ 神经科学论文写手
- ✅ 统计方法顾问
- ✅ 科研图表设计师
- ✅ Python 科学代码审查员

### 科研 Skills（21 个）
**Nature 系列（8个）**：论文写作、润色、文献搜索、引用管理、数据分析、图表生成、论文精读、审稿回复
**PaperSpine 系列（10个）**：人性化改写、中英互译、引用银行、论文重写、期刊调研、论文组装、LaTeX排版、输出审计、工作流配置、工具包更新
**EEG/MEG 专用（3个）**：EEG去伪影、时频分析、统计检验

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
├── skills/                  # 科研方法论（18个，nature-* 8 + paperspine-* 10）
├── prompts/                 # 高品质提示词库（待添加）
├── templates/               # 论文模板（待添加）
└── docs/                    # 教程文档（待添加）
```
