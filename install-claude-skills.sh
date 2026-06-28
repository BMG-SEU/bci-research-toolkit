#!/bin/bash
# BCI Research Toolkit — Claude Code Skills 一键安装
# 用法：curl -fsSL https://raw.githubusercontent.com/BMG-SEU/bci-research-toolkit/main/install-claude-skills.sh | bash
set -e

REPO="https://raw.githubusercontent.com/BMG-SEU/bci-research-toolkit/main"
TEMP_DIR=$(mktemp -d)
TARGET="${1:-.}"

echo "🧠 BCI Research Toolkit — Claude Code Skills 安装"
echo "   $REPO"
echo ""

# 检测 Claude Code 项目
if [ -f "$TARGET/CLAUDE.md" ] || [ -d "$TARGET/.claude" ]; then
  echo "✅ 检测到 Claude Code 项目: $TARGET"
elif [ "$TARGET" = "." ]; then
  echo "ℹ️  未检测到 CLAUDE.md，将安装到当前目录"
else
  echo "ℹ️  安装到: $TARGET"
fi

mkdir -p "$TARGET/.claude/skills"

# 下载 Skills 列表并逐个安装
SKILLS=(
  "bci-research-toolkit"
  "eeg-artifact-removal"
  "literature-search"
  "machine-learning-bci"
  "nature-citation"
  "nature-data"
  "nature-figure"
  "nature-reader"
  "nature-response"
  "paper-audit"
  "paper-build"
  "paper-citation"
  "paper-humanize"
  "paper-intake"
  "paper-latex"
  "paper-polish"
  "paper-research"
  "paper-rewrite"
  "paper-translate"
  "paper-update"
  "paper-writing"
  "source-localization"
  "statistical-analysis"
  "time-frequency-analysis"
)

echo "📦 安装 Skills..."
for skill in "${SKILLS[@]}"; do
  echo "   📥 $skill"
  mkdir -p "$TARGET/.claude/skills/$skill"
  curl -fsSL "$REPO/claude-code-only/.claude/skills/$skill/SKILL.md" \
    -o "$TARGET/.claude/skills/$skill/SKILL.md" 2>/dev/null || {
    echo "   ⚠️  跳过 $skill（文件不存在）"
    rm -rf "$TARGET/.claude/skills/$skill"
    continue
  }
done

# 安装可执行脚本
echo "📦 安装工具脚本..."
mkdir -p "$TARGET/.claude/skills/bci-research-toolkit/scripts"
curl -fsSL "$REPO/claude-code-only/.claude/skills/bci-research-toolkit/scripts/run_workflow.sh" \
  -o "$TARGET/.claude/skills/bci-research-toolkit/scripts/run_workflow.sh" 2>/dev/null
curl -fsSL "$REPO/claude-code-only/.claude/skills/bci-research-toolkit/scripts/validate_all.sh" \
  -o "$TARGET/.claude/skills/bci-research-toolkit/scripts/validate_all.sh" 2>/dev/null
chmod +x "$TARGET/.claude/skills/bci-research-toolkit/scripts/"*.sh 2>/dev/null || true

# 可选：安装工作流和 Agent
echo ""
echo "📦 安装工作流模板和 Agent 定义..."
mkdir -p "$TARGET/workflows" "$TARGET/agents"
for f in meg-preprocessing eeg-analysis literature-review paper-methods paper-results paper-discussion paper-abstract figure-generation source-localization connectivity-analysis data-analysis-bridge; do
  curl -fsSL "$REPO/claude-code-only/workflows/${f}.yaml" \
    -o "$TARGET/workflows/${f}.yaml" 2>/dev/null
done
for f in meg-analyst eeg-preprocessor bci-literature-reviewer neuroscience-paper-writer stats-methodologist figure-designer code-reviewer-python; do
  curl -fsSL "$REPO/claude-code-only/agents/${f}.md" \
    -o "$TARGET/agents/${f}.md" 2>/dev/null
done

# 安装提示词库
echo "📦 安装提示词库..."
mkdir -p "$TARGET/prompts"
curl -fsSL "$REPO/claude-code-only/prompts/AI%E7%A7%91%E7%A0%94%E5%86%99%E4%BD%9CPrompt%E5%90%88%E9%9B%86.md" \
  -o "$TARGET/prompts/AI科研写作Prompt合集.md" 2>/dev/null

echo ""
echo "============================================"
echo " ✅ BCI Research Toolkit Skills 安装完成！"
echo ""
echo " 已安装:"
echo "   📂 .claude/skills/  → 24 个科研 Skill"
echo "   📂 workflows/       → 11 个工作流模板"
echo "   📂 agents/          → 7 个科研 Agent"
echo "   📂 prompts/         → 89+ 提示词"
echo ""
echo " 🎯 现在直接对 Claude Code 说:"
echo "   '帮我规划 EEG 去伪影策略'"
echo "   '帮我润色这段论文'"
echo "   '帮我搜 BCI 文献'"
echo ""
echo " 📖 完整文档: https://github.com/BMG-SEU/bci-research-toolkit"
echo "============================================"
