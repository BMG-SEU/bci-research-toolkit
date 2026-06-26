# 降低 AI 检测率 — 论文人性化改写 (PaperSpine Humanize)

> 基于 paper-spine-humanize 方法论，通过层级化风格约束降低 AIGC 检测率

## 触发条件
用户提到「AI检测」「降重」「AIGC降低」「看起来像人写的」时加载。

## 核心策略

### Tier 1：词汇层
- 替换 AI 高频词：`delve` → `explore`，`crucial` → `critical`，`moreover` → 直接写下一句
- 引入领域术语的自然变体（不强制同义词替换）
- 保持专业术语不变（如 EEG, MEG, ERP 等）

### Tier 2：句式层
- 变换句长（AI 倾向均匀句长，人类有长有短）
- 穿插简单句（10 词以内）和复杂句（25 词以上）
- 偶尔用问句引出话题（Discussion 中：「But does this reflect causality or mere correlation?」）

### Tier 3：段落层
- 段落长度不一（AI 倾向每段 3-5 句均匀分布）
- 引入适度的元话语（「In what follows, we first review... Then we ...」）
- 在 Methods 中加入实用细节（「We used the default parameters except...」）

### Tier 4：风格层
- 避免过度连贯（AI 写的每句都完美衔接，真正的学术写作会有「突兀但有意义的转折」）
- 加入适度的限定词（`likely`, `suggest`, `may reflect`）
- 保留 1-2 处不完美但自然的表达

## 改写流程

### Step 1：检测 AI 风格
```markdown
## AI 特征检测
| 特征 | 出现次数 | 严重程度 |
|------|---------|---------|
| 均匀句长 | 贯穿全文 | 高 |
| delve/crucial 高频 | 5次 | 中 |
| 完美段落过渡 | 每段 | 高 |
```

### Step 2：分层改写
逐层应用 Tier 1-4，每层改完检查可读性。

### Step 3：验证
- 改完后让另一个 AI 盲测对比
- 检查关键数据和引用是否被篡改（绝不能改数据）

## 反模式
- ❌ 随机替换为生僻词（降低质量）
- ❌ 加入语法错误（学术论文不能有语法错误）
- ❌ 改完不检查引用和数据完整性
- ❌ 过度改写导致原意丢失
