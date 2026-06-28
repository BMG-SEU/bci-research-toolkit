# 神经科学论文写作方法论 (Nature Writing)

> 基于 nature-writing 方法论，适配 BCI/MEG/EEG 领域

## 触发条件
用户提到「写论文」「写 Introduction」「写 Methods」「写 Results」「写 Discussion」「论文写作」时自动加载。

## 核心原则

### 1. 先有骨架，后有血肉
不要从头写到尾。按以下顺序：
- **先写 Methods**（最客观、最好写）
- **再写 Results**（基于数据分析结果）
- **再写 Introduction**（把故事讲清楚）
- **最后写 Discussion**（需要前面三部分都定稿）

### 2. IMRaD 结构（神经科学标准）

```
Introduction:   为什么做？已知什么？未知什么？本研究填补什么？
Methods:        怎么做的？（可复现性第一）
Results:        发现了什么？（数据说话，不加解释）
Discussion:     发现意味着什么？与文献异同？局限性？未来方向？
```

### 3. 神经科学特有要点

#### Methods 部分
- ✅ 报告采样率、滤波器参数、参考电极
- ✅ 报告被试数量、纳入/排除标准
- ✅ 报告使用的软件包及版本（MNE x.x.x）
- ✅ 报告统计检验方法及多重比较校正
- ❌ 不要只说「使用标准方法」

#### Results 部分
- ✅ 先报告行为数据，再报告神经信号
- ✅ 报告效应量（Cohen's d / η²），不只 p 值
- ✅ 时频分析：报告频率范围、基线校正方法
- ✅ 源定位：报告使用的模板和正向模型
- ❌ 不要在 Results 里讨论结果的意义

#### Discussion 部分
- 第一段：重述主要发现（3-5 句）
- 中间段：逐条与文献对比
- 局限性段：诚实但有分寸
- 最后段：结论和未来方向

## 写作流程

### Step 1：收集素材
确认以下信息齐全：
- [ ] 研究假设
- [ ] 被试信息（人数、性别、年龄）
- [ ] 数据采集参数
- [ ] 预处理步骤和参数
- [ ] 分析方法
- [ ] 统计结果（含效应量）
- [ ] 图表清单

### Step 2：写 Methods
```
模板结构：
1. Participants
2. Experimental Design / Task
3. Data Acquisition
4. Preprocessing
5. Analysis Methods
6. Statistical Analysis
```

### Step 3：写 Results
```
模板结构：
1. Behavioral Results（如有）
2. Main Neural Findings
   - 时域（ERP 成分）
   - 时频域（振荡功率变化）
   - 空间（地形图 / 源定位）
3. Control Analyses（如有）
```

### Step 4：写 Introduction
```
三段式：
1. 已知：该领域的研究背景（3-5句话）
2. 未知：现有研究的不足或空白（2-3句话）
3. 本研究：我们做了什么来填补空白（2-3句话）
```

### Step 5：写 Discussion
```
五段式：
1. 重述主要发现
2. 将发现与文献联系起来
3. 讨论方法学优势与局限性
4. 提出未来研究方向
5. 结论（2-3句）
```

### Step 6：写 Abstract
Methods 和 Results 定稿后再写，200-300 字：
1. 背景（1 句）
2. 目的（1 句）
3. 方法（2-3 句）
4. 结果（2-3 句）
5. 结论（1 句）
