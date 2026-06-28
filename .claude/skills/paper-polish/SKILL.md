# 科研论文润色方法论 (Nature Polishing)

> 基于 nature-polishing 方法论，专为中文母语研究者优化英文学术写作

## 触发条件
用户说「润色」「改语法」「polish」「proofread」「改一下英文」时自动加载。

## 润色层次

### Level 1：语言层（基础）
- 语法错误修正
- 拼写检查
- 时态一致性（Methods 用过去时；Results 用过去时；Discussion 可混合）
- 主谓一致
- 冠词使用（a/an/the）

### Level 2：表达层（进阶）
- 消除冗余：`"It is worth noting that"` → 删除或 `"Notably,"`
- 避免模糊：`"The results were relatively significant"` → `"The results showed a significant effect (p = .003, d = 0.52)"`
- 动词优先：`"We conducted an analysis of"` → `"We analyzed"`
- 平行结构：`"We filtered, ICA-corrected, and then we baseline-corrected"` → `"We filtered, ICA-corrected, and baseline-corrected"`

### Level 3：科学写作惯例层（最高）
- 主张强度与证据匹配：`"This proves that"` → `"This suggests that"` / `"This demonstrates that"`
- 避免拟人化：`"The data argues"` → `"The data suggest"` 或 `"These results indicate"`
- 区分发现与诠释：Results 段不加 "interestingly/importantly"，Discussion 段可以
- 精确量化：`"p < 0.05"` 不如 `"p = 0.032"`；报告实际 p 值而非阈值

## 润色流程

### Step 1：识别目标期刊
- 不同期刊有不同的风格偏好
- Nature/Science: 高度浓缩、故事性强
- NeuroImage: 容忍更多方法学细节
- Journal of Neuroscience: 介于两者之间

### Step 2：逐段润色
对每一段执行：
1. 理解原文意图（不只看字面）
2. 标记所有 Level 1/2/3 问题
3. 逐句改写
4. 保留所有数据、引用、专业术语的原始形式

### Step 3：一致性检查
- 术语一致性（同一概念始终用同一个词）
- 缩略词首次出现时定义
- 数据精度一致性（p 值/坐标等小数位数一致）
- 参考文献格式一致

### Step 4：输出格式
```markdown
## 润色结果

### 原文
[原始段落]

### 润色后
[润色后段落]

### 修改说明
- Level 1（语法）：3 处
- Level 2（表达）：2 处
- Level 3（惯例）：1 处
- 关键修改：[最重要的改动]
```

## 神经科学常用词汇对照

| 中文常见错误 | 正确英文学术表达 |
|-------------|----------------|
| 脑电信号 | EEG signals / EEG data |
| 脑磁信号 | MEG signals / MEG recordings |
| 伪影去除 | artifact removal / artifact rejection |
| 源定位 | source localization / source reconstruction |
| 时频分析 | time-frequency analysis / time-frequency decomposition |
| 功能连接 | functional connectivity |
| 事件相关电位 | event-related potentials (ERPs) |
| 感觉运动节律 | sensorimotor rhythm (SMR) |
| 统计显著 | statistically significant |
| 多重比较校正 | correction for multiple comparisons |
