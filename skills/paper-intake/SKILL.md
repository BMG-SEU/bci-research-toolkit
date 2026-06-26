# 论文工作流配置导入 (PaperSpine Intake)

> 基于 paper-spine-intake 方法论，收集配置选项并生成论文工作流方案

## 触发条件
用户第一次使用论文工作流，或说「配置论文工作流」「setup paper workflow」时加载。

## 流程

### Step 1：收集配置
通过交互式提问收集：
```markdown
## 论文配置向导

1. **论文阶段**：[ ] 初稿 [ ] 修改 [ ] 定稿 [ ] 润色
2. **目标期刊**：NeuroImage / J Neural Eng / IEEE TBME / 其他
3. **语言**：[ ] 英文撰写 [ ] 中文转英文 [ ] 中英双语
4. **图表数量**：Figure __ 个，Table __ 个
5. **参考文献管理**：[ ] BibTeX [ ] Zotero [ ] 手动
6. **主流 LLM**：[ ] DeepSeek [ ] GLM [ ] OpenAI
7. **协作方式**：[ ] 单人 [ ] 多人（需标注作者分工）

写入配置文件：paper_config.yaml
```

### Step 2：生成工作流方案
根据配置生成推荐的工作流组合：
```yaml
# 示例：初稿 + NeuroImage + 英文学术
workflows:
  - paper-research   # 先调研期刊格式
  - paper-intake     # 记录配置
  - literature-search # 文献支持
  - paper-writing    # 初稿撰写
  - paper-citation   # 引用管理
  - paper-audit      # 完整性检查
  - paper-polish     # 语言润色
  - paper-humanize   # 降低AI痕迹
  - paper-build      # 组装提交
```

### Step 3：保存配置
写入 `paper_config.yaml`，后续使用时自动加载。
