# BCI Research Toolkit — 用户使用指南

> 从零到熟练，覆盖课题组全部日常科研场景。**推荐使用图形界面（`ao web`）上手。**

---

## 〇、第一次使用（3 分钟）

```bash
git clone git@github.com:BMG-SEU/bci-research-toolkit.git
cd bci-research-toolkit
bash setup.sh        # macOS/Linux
# setup.bat          # Windows（双击）

# 编辑 .env 填入 DeepSeek API key
# 打开 https://platform.deepseek.com/api_keys → 注册（1分钟）→ 创建 key → 复制
# 然后把 .env 里的 sk-your-deepseek-key-here 替换成你的真实 key
# DEEPSEEK_API_KEY=sk-abc123...

# 启动图形界面
ao web
```

浏览器自动打开 → 选工作流模板 → 填参数 → 点击运行。不用打命令。

---

## 一、三种使用模式（推荐第一种）

### 🖥️ 图形界面 —— 打开浏览器就能用（最推荐）

```bash
ao web
```

浏览器自动打开，中文界面。下拉选工作流模板 → 填参数 → 点运行。适合不习惯命令行的同学。

### ⌨️ 自然语言 —— 想到啥说啥

```bash
ao compose "你的需求" --run
```

不用记模板名、不用管哪个 Agent 负责什么。AO 自动拆任务、选角色、建流程、执行。

### 模式 2：预设工作流——高频场景一键跑

```bash
ao run workflows/模板名.yaml -i 参数=值
```

把课题组最常用的流程写成 YAML 模板，输入参数就能重复出稳定结果。

### 模式 3：Claude Code——写代码跑脚本

```bash
claude "你的编程需求"
```

需要读写文件、执行 Python、装包调试时用。

---

## 二、具体使用场景（8 个真实案例）

### 场景 A：刚拿到一批 MEG 数据，不知道该怎么处理

```bash
ao compose "我有3个被试的resting-state MEG数据，采样率1000Hz，306通道，帮我规划预处理方案" --run
```

**会发生什么**：AO 自动调用 MEG 分析专家 → 评估数据质量 → 推荐预处理策略（滤波/ICA/分段）→ 输出参数建议。耗时约 2 分钟，费用 ¥0.02。

### 场景 B：数据预处理方案已确定，想变成能跑的 Python 代码

```bash
ao compose "根据以下预处理方案写 MNE-Python 代码：0.1-40Hz带通、50Hz陷波、ICA 30成分、-200到800ms分段、基线校正-200到0ms。输出为可直接运行的 .py 文件" --run
```

**会发生什么**：AO 调用 Python 代码审查员 → 生成完整可执行的 MNE 脚本。耗时约 1 分钟，费用 ¥0.02。

### 场景 C：拿到代码需要真正跑起来（需要执行环境）

```bash
claude "读一下 meg_preprocessing.py，帮我在当前环境安装 mne 包，然后跑这个脚本。如果有 bug 帮我修"
```

**会发生什么**：Claude Code 读文件 → 检测缺包 → `pip install mne` → 运行脚本 → 报错就修 → 最终生成干净的预处理数据。

### 场景 D：要开始写综述，需要系统化搜文献

```bash
ao run workflows/literature-review.yaml -i topic="deep learning for motor imagery EEG classification"
```

**会发生什么**：5 步自动化——检索策略设计 → 文献分类框架 → 方法学回顾 → 未来方向 → 生成综述初稿。耗时约 4 分钟，费用 ¥0.10。产出：`literature_review_xxx.md`。

### 场景 E：Results 写完了，Discussion 写不出来

```bash
ao run workflows/paper-discussion.yaml \
  -i results_summary=@results.md \
  -i hypothesis="源空间功能连接特征比传感器空间更稳定" \
  -i limitations="样本量中等(N=20);仅静息态;未考虑个体差异"
```

**会发生什么**：4 步自动化——解释结果 + 对比文献 + 讨论局限 + 撰写完整 Discussion。产出：`discussion_draft.md`。

### 场景 F：英文写完了需要润色

```bash
ao compose "帮我润色这段 Methods，目标是 NeuroImage 期刊，保持数据不变" --run
# 然后粘贴你的英文
```

**会发生什么**：自动加载 paper-polish skill，三层次润色（语法→表达→学术惯例），输出修改前后的对比。

### 场景 G：收到审稿意见需要回复

```bash
ao compose "帮我写审稿回复信。审稿意见如下：[粘贴审稿意见]" --run
```

**会发生什么**：自动加载 nature-response skill，逐条分解 → 分类（可改/需澄清/无法改）→ 逐条撰写回复 → 生成 Cover Letter。

### 场景 H：论文写好了需要最后检查

```bash
ao compose "帮我审计这篇论文的完整性，目标期刊 NeuroImage：[粘贴论文]" --run
```

**会发生什么**：自动加载 paper-audit skill，检查结构完整性、数据一致性、统计报告、BCI 特定项，输出审计报告。

---

## 三、预设工作流参考卡

| 工作流 | 命令 | 输入 | 产出 |
|--------|------|------|------|
| MEG 预处理 | `ao run workflows/meg-preprocessing.yaml -i file_path=@data.fif` | .fif 文件 | 方案 + 代码 |
| 文献综述 | `ao run workflows/literature-review.yaml -i topic="xxx"` | 研究主题 | 综述 .md |
| 论文讨论 | `ao run workflows/paper-discussion.yaml -i results_summary=@xxx.md -i hypothesis="xxx" -i limitations="xxx"` | 3 个输入 | Discussion .md |

---

## 四、Skills 速查（“我该用什么 Skill？”）

| 我想... | 直接说 | 会自动加载 |
|---------|--------|-----------|
| 写论文某部分 | 「写 Introduction」 | paper-writing |
| 润色英文 | 「润色这段英文」 | paper-polish |
| 搜文献策略 | 「帮我搜 BCI 文献」 | literature-search |
| 管理引用 | 「帮我查这个主张的引用」 | nature-citation |
| 规划数据处理 | 「帮我分析这个数据」 | nature-data |
| 画科研图 | 「这张图怎么画」 | nature-figure |
| 精读一篇论文 | 「帮我精读这篇论文」 | nature-reader |
| 回复审稿意见 | 「帮我回复审稿人」 | nature-response |
| 写 Cover Letter | 「写投稿 Cover Letter」 | paper-research |
| 降低 AI 检测率 | 「帮我降低 AI 痕迹」 | paper-humanize |
| 中译英/英译中 | 「翻译这段」 | paper-translate |
| 重写论文 | 「重写这篇论文」 | paper-rewrite |
| LaTeX 排版 | 「帮我排 LaTeX」 | paper-latex |
| 组装论文 | 「帮我把各部分拼起来」 | paper-build |
| 检查论文完整性 | 「审计这篇论文」 | paper-audit |
| 配置论文工作流 | 「配置论文流水线」 | paper-intake |
| 更新工具包 | 「检查更新」 | paper-update |

---

## 五、常见问题

**Q：我只想用免费的，不花钱行吗？**
A：如果已有 Claude 会员（$20/月），可以用 `--provider claude-code` 完全不花钱。但没有会员的话 DeepSeek 最便宜——充 10 块钱能用很久。

**Q：组员没有 Claude 会员怎么办？**
A：`.env` 里只填 `DEEPSEEK_API_KEY`，日常分析写作全用 AO + DeepSeek，需要跑代码时手动用 Claude Code（也配成 DeepSeek 后端）。

**Q：AO 和 Claude Code 什么时候用哪个？**
A：一句话判断——需要「跑代码/装包/调试」用 Claude Code，其余全部用 AO。

**Q：能处理真实的 .fif 文件吗？**
A：AO 不能读写数据文件，但能生成处理代码。Claude Code 能读写和执行。所以流程是：AO 出方案和代码 → Claude Code 执行。

**Q：团队怎么共享经验？**
A：把好用的流程写成 YAML 放入 workflows/，git push，大家就都能复用。

**Q：数据安全吗？**
A：所有数据存本地，API 调用只传文本（不传数据文件本身），key 只存在本机 .env 中（已 gitignore）。
