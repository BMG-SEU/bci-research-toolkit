# 工具包更新维护 (PaperSpine Update)

> 基于 paper-spine-update 方法论，检查和更新 BCI Research Toolkit

## 触发条件
用户说「更新工具包」「check update」「升级」时加载。

## 流程

### Step 1：检查版本
```bash
# 检查 agency-orchestrator 版本
npm list -g agency-orchestrator

# 检查 Claude Code 版本
claude --version

# 检查 Git 仓库状态
cd bci-research-toolkit
git remote show origin
git status
```

### Step 2：拉取最新更新
```bash
cd bci-research-toolkit
git pull origin main
```

### Step 3：更新依赖
```bash
npm update -g agency-orchestrator
npm update -g @anthropic-ai/claude-code
```

### Step 4：更新日志
输出本次更新的内容摘要：
```markdown
## BCI Research Toolkit 更新 (2026-06-26)

### 新增
- 12 个科研 Skills（nature-* + paperspine-*）
- 7 个科研 Agent
- 3 个核心工作流
- 项目任务书

### 更新建议
- 重新运行 setup.sh 同步依赖
```

## 定期维护建议
| 频率 | 操作 |
|------|------|
| 每周 | `git pull` 拉取最新版本 |
| 每月 | `npm update -g` 更新 npm 全局包 |
| 每季度 | 检查 DeepSeek API key 余额 |
| 每学期 | 收集团队反馈，提交 Issue/PR |
