# 科研文献搜索方法论 (Nature Academic Search)

> 基于 nature-academic-search 方法论，专为 BCI/MEG/EEG 领域优化

## 触发条件
用户提到「找文献」「查论文」「文献调研」「literature search」「检索」时自动加载。

## 核心原则

### 1. 结构化检索
不要漫无目的地搜。先定义：
- **PICO 框架**（人群/问题、干预、比较、结果）
- **关键词**（3-5 组，中英文）
- **数据库**（按优先级）
- **时间范围**
- **纳入/排除标准**

### 2. 可复现
让审稿人能复现你的检索过程。

## 检索策略设计

### Step 1：构建关键词组合

**BCI/MEG/EEG 常用关键词模板**：

```
(#1) 技术词: 
  "brain-computer interface" OR BCI OR 
  "electroencephalography" OR EEG OR 
  "magnetoencephalography" OR MEG

(#2) 方法词:
  "motor imagery" OR "SSVEP" OR "P300" OR 
  "steady-state" OR "event-related"

(#3) 技术词:
  "deep learning" OR "convolutional neural network" OR 
  "transfer learning" OR "Riemannian geometry" OR
  "common spatial pattern" OR CSP

(#4) 时间限定:
  2020:2025 [dp]

(#1) AND (#2) AND (#3) AND (#4)
```

### Step 2：选择数据库

| 数据库 | 优先级 | 适用场景 |
|--------|--------|---------|
| **PubMed** | ⭐⭐⭐ | 生物医学/神经科学首选 |
| **IEEE Xplore** | ⭐⭐⭐ | BCI 工程方法 |
| Scopus | ⭐⭐ | 覆盖面广 |
| Web of Science | ⭐⭐ | 引用追踪 |
| Google Scholar | ⭐ | 补充、灰色文献 |
| arXiv | ⭐ | 预印本（最新方法） |

### Step 3：执行检索

对每个数据库：
1. 运行关键词组合
2. 记录命中数量
3. 导出检索结果（BibTeX/RIS）
4. 去重

### Step 4：筛选文献

```
第一轮（标题筛选）：
  - 明显无关 → 排除
  - 可能相关 → 保留

第二轮（摘要筛选）：
  - 按纳入标准逐条检查
  - 不确定 → 保留到全文

第三轮（全文筛选）：
  - 逐篇读全文
  - 记录排除原因
```

### Step 5：输出检索报告

```markdown
## 文献检索报告

### 检索策略
- 数据库：PubMed, IEEE Xplore
- 日期：2026-06-26
- 关键词：(BCI OR EEG OR MEG) AND (deep learning) AND 2020:2025

### 检索结果
- PubMed: 487 篇
- IEEE Xplore: 623 篇
- 去重后: 892 篇

### 筛选结果
- 标题筛选保留: 156 篇
- 摘要筛选保留: 43 篇
- 全文筛选保留: 28 篇

### 最终纳入
| # | 标题 | 作者 | 年份 | 核心方法 | 样本量 |
|---|------|------|------|---------|--------|
| 1 | ... | ... | 2023 | CSP+SVM | N=54 |
| 2 | ... | ... | 2024 | EEGNet | N=108 |
```

## BCI 领域专题检索策略

### 运动想象 BCI
```
("motor imagery" OR "motor execution") AND 
("common spatial pattern" OR CSP OR "filter bank" OR 
 EEGNet OR "deep learning") AND 
EEG AND (offline OR online)
```

### SSVEP BCI
```
("steady-state visual evoked potential" OR SSVEP) AND 
(CCA OR "canonical correlation" OR 
 "task-related component" OR TRCA OR 
 "deep learning") AND 
EEG
```

### EEG/MEG 源定位
```
(MEG OR EEG) AND 
("source localization" OR "source reconstruction" OR 
 "beamforming" OR "minimum norm" OR 
 dSPM OR sLORETA OR "Bayesian") AND
("inverse problem" OR "forward model")
```

## 评估文献质量

读摘要时快速判断：
- ✅ 明确报告了被试数量和数据采集参数
- ✅ 有独立测试集（非仅交叉验证）
- ✅ 与至少 2 个基线方法对比
- ❌ 被试数 < 10
- ❌ 只在自建数据集上测试
- ❌ 没有开源代码或数据
