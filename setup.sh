#!/bin/bash
set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo "============================================"
echo -e "${GREEN} BCI Research Toolkit — 一键部署${NC}"
echo " 脑机接口与脑磁/脑电信号科研智能体工具包"
echo "============================================"
echo ""

# 1. 检查 Node.js
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ 需要 Node.js >= 18。请先安装：https://nodejs.org${NC}"
    exit 1
fi
echo -e "${GREEN}✅${NC} Node.js $(node -v)"

# 2. 安装 agency-orchestrator
echo ""
if command -v ao &> /dev/null; then
    echo -e "${GREEN}✅${NC} agency-orchestrator 已安装 ($(ao --version 2>&1 | head -1))"
else
    echo "📦 安装多Agent编排引擎..."
    npm install -g agency-orchestrator 2>&1 | tail -1
    echo -e "${GREEN}✅${NC} agency-orchestrator 已安装"
fi

# 3. 安装 Claude Code
echo ""
if command -v claude &> /dev/null; then
    echo -e "${GREEN}✅${NC} Claude Code 已安装 ($(claude --version 2>&1 | head -1))"
else
    echo "📦 安装 Claude Code..."
    npm install -g @anthropic-ai/claude-code 2>&1 | tail -1
    echo -e "${GREEN}✅${NC} Claude Code 已安装"
fi

# 4. 安装 superpowers-zh skills
echo ""
if [ -d ".claude/skills" ] && [ "$(ls -A .claude/skills 2>/dev/null)" ]; then
    echo -e "${GREEN}✅${NC} superpowers-zh 已安装"
else
    echo "📦 安装 superpowers-zh（AI编程方法论）..."
    npx superpowers-zh 2>&1 | tail -5
    echo -e "${GREEN}✅${NC} superpowers-zh 已安装"
fi

# 5. 初始化角色库（ao compose 需要）
echo ""
if [ -d "agency-agents-zh" ]; then
    echo -e "${GREEN}✅${NC} 角色库已初始化"
else
    echo "📦 初始化角色库（ao compose 需要）..."
    ao init 2>&1 | tail -3
    echo -e "${GREEN}✅${NC} 角色库已初始化"
fi

# 5. 配置 .env
if [ ! -f .env ]; then
    cp .env.example .env
    echo ""
    echo -e "${YELLOW}⚙️  请编辑 .env 文件，填入你的 API key：${NC}"
    echo "   DEEPSEEK_API_KEY=sk-xxx"
    echo "   GLM_API_KEY=xxx（可选）"
    echo ""
    read -p "按回车继续..."
fi

echo ""
echo "============================================"
echo -e "${GREEN} ✅ 部署完成！${NC}"
echo ""
echo " 🖥️  启动图形界面（推荐）："
echo "   ao web         浏览器打开，选模板 → 输入参数 → 点运行"
echo ""
echo " ⌨️  命令行模式："
echo "   ao compose \"帮我分析 MEG 时频特征\" --run"
echo "   ao run workflows/【模板名】.yaml"
echo ""
echo " 💻  写代码调试："
echo "   claude \"帮我写 MNE-Python 预处理脚本\""
echo "============================================"
