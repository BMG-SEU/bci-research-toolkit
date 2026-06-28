# 论文引用支持库构建 (PaperSpine Citation)

> 基于 paper-spine-citation 方法论，为 Introduction 和 Discussion 构建引用证据库

## 触发条件
用户提到「引用支持」「citation support」「需要引用来支撑」「reference bank」时加载。

## 与 nature-citation 的区别
- nature-citation：单篇论文的引用管理
- paper-citation：构建可复用的引用证据库，系统性为论文提供引用支撑

## 流程

### Step 1：解构论文主张
从 Introduction 和 Discussion 中提取每个待引用主张：
```markdown
## Introduction 主张列表
1. BCI 在运动康复中有广阔前景 [需要引用]
2. EEG-based BCI 面临低信噪比挑战 [需要引用]
3. 深度学习近年来在 EEG 分类中表现优异 [需要引用]

## Discussion 主张列表
1. 本研究准确率（85%）高于已有方法 [需要引用对比]
2. 迁移学习减少校准时间是可行方向 [需要引用]
3. 样本量限制了结论的泛化性 [需要引用]
```

### Step 2：搜索匹配置信度分级
| 引用质量 | 标准 |
|---------|------|
| ⭐⭐⭐ 高度匹配 | 直接研究了相同问题，样本量充足 |
| ⭐⭐⭐ 系统综述 | Meta 分析或大规模综述 |
| ⭐⭐ 中度匹配 | 相关但不完全一致 |
| ⭐⭐ 方法学标杆 | 经典方法论文 |
| ⭐ 弱匹配 | 仅在讨论中提及，非核心证据 |

### Step 3：构建引用银行
```markdown
## 引用银行

### 主张：BCI 在运动康复中有广阔前景
| 引用 | 质量 | 关键数据 |
|------|------|---------|
| Chaudhary2016 Nat Rev Neurol | ⭐⭐⭐ | 综述，覆盖 ALS 患者 BCI 应用 |
| Wolpaw2012 Brain-Computer Interfaces | ⭐⭐ | 经典教材 | 
```

### Step 4：插入引用
将引用银行中的匹配项插入论文对应位置，标注匹配质量。
