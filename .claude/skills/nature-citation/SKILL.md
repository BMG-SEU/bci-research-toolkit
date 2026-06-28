# 学术论文引用管理 (Nature Citation)

> 基于 nature-citation 方法论，为 BCI/MEG/EEG 论文构建引用支持库

## 触发条件
用户提到「引用」「参考文献」「citation」「参考文献格式」「citation bank」时加载。

## 核心功能
为论文的 Introduction 和 Discussion 构建引用支持库——确保每个主张都有文献支撑。

## 流程

### Step 1：提取论文中的主张
从论文草稿中提取每个需要引用的主张：
- Introduction 中的背景陈述
- Discussion 中与文献对比的每条论断
- Methods 中使用的方法学引用

### Step 2：为每个主张匹配文献
对每个主张，提供：
```markdown
| 主张 | 推荐引用 | DOI | 年份 | 匹配理由 |
|------|---------|-----|------|---------|
| BCI分类准确率平均72% | Lotte2018 review | 10.1088/... | 2018 | 综述，覆盖50+研究 |
| EEGNet在少被试场景表现好 | Lawhern2018 | 10.1088/... | 2018 | 原论文，4个数据集 |
| CSP+CNN优于单独CSP | Schirrmeister2017 | 10.1002/... | 2017 | Deep ConvNet原论文 |
```

### Step 3：检查引用完整性
- [ ] 每个主张都有至少 1 条引用？
- [ ] 引用年份是否恰当（经典工作 vs 最新进展）？
- [ ] 是否覆盖了本课题组的前期工作？
- [ ] Discussion 中是否引用了 Introduction 列出的关键文献？

### Step 4：格式化
按目标期刊要求格式化参考文献（APA/Vancouver/Nature 格式）。

## BCI 领域核心文献速查

| 主题 | 必引文献 |
|------|---------|
| EEGNet | Lawhern et al. (2018) J Neural Eng |
| Deep ConvNet | Schirrmeister et al. (2017) Hum Brain Mapp |
| CSP | Blankertz et al. (2008) NeuroImage |
| FBCSP | Ang et al. (2012) Front Neurosci |
| Riemannian | Barachant et al. (2012) IEEE TBME |
| MNE-Python | Gramfort et al. (2013) Front Neurosci |
| FieldTrip | Oostenveld et al. (2011) Comput Intell Neurosci |
| 源定位 | Baillet et al. (2001) IEEE SPM |
| ICA 去伪影 | Jung et al. (2000) Psychophysiology |
| 聚类置换检验 | Maris & Oostenveld (2007) J Neurosci Methods |
