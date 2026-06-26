# 论文组装构建 (PaperSpine Build)

> 基于 paper-spine-build 方法论，从零散材料组装完整论文

## 触发条件
用户说「帮我组装论文」「把各部分拼起来」「build paper from materials」时加载。

## 流程

### Step 1：清点材料
检查以下材料是否齐全：
```markdown
## 材料清单
- [ ] 研究动机文档（1 页）
- [ ] 方法学描述（含参数细节）
- [ ] 结果数据表（descriptive stats + inferential stats）
- [ ] 图表文件（Figure 1-5, Table 1-3）
- [ ] 参考文献列表（.bib 或格式化的）
- [ ] 目标期刊格式要求
- [ ] 作者列表及所属单位
```

### Step 2：按 IMRaD 组装
```
┌──────────────────────────────────┐
│ Title Page                       │
│ Title + Authors + Affiliations   │
├──────────────────────────────────┤
│ Abstract (200-300 words)         │
│ 1. Background (1 sentence)       │
│ 2. Objective (1)                 │
│ 3. Methods (2-3)                 │
│ 4. Results (2-3)                 │
│ 5. Conclusion (1)                │
├──────────────────────────────────┤
│ Introduction (~1000 words)       │
├──────────────────────────────────┤
│ Methods (~2000 words)            │
├──────────────────────────────────┤
│ Results (~2000 words)            │
│ [插入 Figure 1-5, Table 1-3]     │
├──────────────────────────────────┤
│ Discussion (~1500 words)         │
├──────────────────────────────────┤
│ References                       │
├──────────────────────────────────┤
│ Supplementary Materials           │
└──────────────────────────────────┘
```

### Step 3：交叉检查
- [ ] 所有图表在正文中都被引用？
- [ ] 参考文献格式一致？
- [ ] 缩写首次出现时定义？
- [ ] 数据和统计值前后一致？

### Step 4：生成提交就绪文件
输出期刊要求格式的完整手稿。
