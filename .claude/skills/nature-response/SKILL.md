# 审稿意见回复方法论 (Nature Response)

> 基于 nature-response 方法论，系统化处理审稿意见并撰写回复信

## 触发条件
用户提到「审稿回复」「response to reviewers」「rebuttal」「修改意见」时加载。

## 回复信撰写流程

### Step 1：逐条提取审稿意见
把审稿意见分解为可逐条回复的单元：
```markdown
## Reviewer 1
### Comment 1.1: 关于方法学...
### Comment 1.2: 关于统计...
### Comment 1.3: 关于讨论...

## Reviewer 2
...
```

### Step 2：分类标注
| 类型 | 标注 | 策略 |
|------|------|------|
| 可补充的实验/分析 | 🔧 | 补充并标注修改位置 |
| 需要澄清的误解 | 💬 | 耐心解释，引用原文 |
| 无法满足的要求 | ⚠️ | 承认 + 理由 + 加入局限性 |
| 格式/文字问题 | ✏️ | 直接修改 |

### Step 3：撰写回复
每条回复的模板：
```
Reviewer Comment X.X:
[原文引用]

Response:
[感谢] → [做了什么] → [在哪里改的（行号/段落）] → [为什么这样做]

修改内容：
[粘贴新增/修改的文字]
```

### Step 4：撰写 Cover Letter
```markdown
Dear Editor,

We thank the reviewers for their constructive feedback.
We have addressed all comments point by point.

Key changes:
1. Added X analysis (Reviewer 1, Comment 3)
2. Clarified Y in Methods section (Reviewer 2, Comment 1)
3. Added limitation Z to Discussion (Reviewer 1, Comment 5)

All changes are highlighted in the revised manuscript.

Sincerely,
[你的名字]
```

## 黄金法则
1. **永远感谢审稿人**（哪怕是尖锐批评）
2. **逐条回复，不跳过任何一条**
3. **明确标注修改位置**（行号/段落/Track Changes）
4. **解释为什么这样做**（不只是做了什么）
5. **保持谦逊**——承认局限性比过度辩解更让人接受
6. **及时回复**——不要拖延超过 deadline
