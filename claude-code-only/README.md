# BCI Research Toolkit — Claude Code 纯 Skill 版

> **不需要装 AO，不需要 Node.js。** 只需拷贝文件到项目中，Claude Code 自动识别。

## 🚀 安装（30 秒）

```bash
# 方式一：复制整个目录到你项目中
cp -r claude-code-only/.claude /你的项目路径/
cp -r claude-code-only/workflows /你的项目路径/
cp -r claude-code-only/agents /你的项目路径/

# 方式二：直接从 GitHub 下载
# 把 claude-code-only/ 下面的内容复制到你的项目
```

> Claude Code 会自动检测 `.claude/skills/` 下的所有 Skill 文件。

## 📦 包含什么

| 组件 | 位置 | 数量 | 说明 |
|------|------|:--:|------|
| 科研 Skills | .claude/skills/ | 27 | Claude Code 自动加载的方法论 |
| YAML 工作流 | workflows/ | 11 | 多步骤模板，Claude Code 按步骤执行 |
| 科研 Agent | agents/ | 7 | 角色定义，Claude Code 切换人格 |
| 可执行工具 | .claude/skills/bci-research-toolkit/scripts/ | 2 | run_workflow.sh + validate_all.sh |
| 提示词库 | prompts/ | 89+ | 学术写作提示词 |

## 🎯 使用方式

### 方式一：直接对话（Skill 自动触发）

在 Claude Code 里直接提科研需求，Skill 自动激活：

```
你: "帮我规划 EEG 去伪影策略"
→ Claude Code 自动加载 eeg-artifact-removal/SKILL.md
→ 按方法论一步步执行

你: "帮我润色这段论文 Methods"
→ 自动加载 paper-polish/SKILL.md
→ 三层次润色

你: "帮我查 BCI 文献"
→ 自动加载 literature-search/SKILL.md
→ PICO 框架 + 数据库策略
```

### 方式二：跟随 YAML 工作流模板

```bash
# 直接说你要用哪个模板
"按照 workflows/paper-methods.yaml 的模板，帮我写方法学部分。
我的实验：2×2被试内设计，N=20健康成人，64ch EEG..."

# Claude Code 会读 YAML → 按步骤执行
```

### 方式三：调可执行脚本

```bash
# 列出所有工作流
bash .claude/skills/bci-research-toolkit/scripts/run_workflow.sh list

# 校验 YAML
bash .claude/skills/bci-research-toolkit/scripts/validate_all.sh
```

## ⚠️ 与完整版的区别

| 能力 | 纯 Skill 版 | 完整版（含 AO） |
|------|:---:|:---:|
| 23 个方法论 | ✅ | ✅ |
| 工作流模板参考 | ✅ (YAML 文本) | ✅ (AO 自动编排) |
| 多角色自动并行 | ❌ 手动串行 | ✅ AO 自动并行 |
| DAG 自动执行 | ❌ | ✅ |
| Web 界面 | ❌ | ✅ |
| 适合场景 | 已有 Claude Code，单人使用 | 全组部署，多人协作 |

> **如果你需要多角色自动并行协作，请用完整版：`bash setup.sh`**

---

*完整版仓库：https://github.com/BMG-SEU/bci-research-toolkit*
