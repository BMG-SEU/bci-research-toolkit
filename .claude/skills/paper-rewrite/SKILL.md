# 论文重写方法论 (PaperSpine Rewrite)

> 基于 paper-spine-rewrite 方法论，从研究动机和证据出发系统化重写论文

## 触发条件
用户提到「重写」「rewrite」「改论文结构」「重构论文」时加载。

## 核心原则

**不从草稿改，而从材料重新构建。** 传统的「修改」在问题草稿上打补丁。重写是从原始材料出发重新组织。

## 流程

### Step 1：收集输入材料
确认以下材料齐全：
- [ ] 研究动机（为什么要做这个研究）
- [ ] 研究假设（预期什么结果）
- [ ] 已确认的研究结果（描述性数据/统计表）
- [ ] 图表清单及说明
- [ ] 参考文献列表
- [ ] 目标期刊的作者指南

### Step 2：从零构建大纲
不看原稿，只看材料，重新构建逻辑流：
```markdown
## 论文大纲（从材料重建）

### Introduction
1. Paragraph 1: [背景：BCI 运动康复的临床需求]
2. Paragraph 2: [问题：EEG-BCI 的泛化性挑战]
3. Paragraph 3: [解决方案：迁移学习]
4. Paragraph 4: [本研究：我们做了什么]

### Methods
1. Participants: [N=X, age=Y]
2. Task: [motor imagery, 2 classes]
3. Data Acquisition: [64ch, 500Hz]
...

### Results
1. Behavioral: [accuracy=85%, ITR=12 bpm]
2. EEG: [ERD in alpha/mu band, CSP features]
3. Comparison: [vs baseline: +15%, p<.001]

### Discussion
1. [主要发现 + 与文献对比]
2. [方法学讨论]
3. [局限性]
4. [结论与展望]
```

### Step 3：逐段写作
按大纲逐段撰写，先 Methods → Results → Introduction → Discussion。

每段只关注当前要传达的信息，不回头看不该前一段。

### Step 4：对照检查
写完后对照原稿：
- 哪些内容在新稿中遗漏了 → 是故意删掉还是疏忽？
- 哪些原稿的表达更好 → 选择性保留

## 反模式
- ❌ 一边看原稿一边改（会被原稿束缚）
- ❌ 保留了原稿的结构问题
- ❌ 改写后不检查数据准确性
