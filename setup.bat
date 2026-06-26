@echo off
setlocal enabledelayedexpansion

echo ============================================
echo  BCI Research Toolkit — 一键部署
echo  脑机接口与脑磁/脑电信号科研智能体工具包
echo ============================================
echo.

REM 1. 检查 Node.js
where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [错误] 需要 Node.js >= 18。请先安装：https://nodejs.org
    pause
    exit /b 1
)
echo [OK] Node.js 已安装

REM 2. 安装 agency-orchestrator
echo.
where ao >nul 2>nul
if %ERRORLEVEL% equ 0 (
    echo [OK] agency-orchestrator 已安装
) else (
    echo 安装多Agent编排引擎...
    call npm install -g agency-orchestrator
    echo [OK] agency-orchestrator 已安装
)

REM 3. 安装 Claude Code
echo.
where claude >nul 2>nul
if %ERRORLEVEL% equ 0 (
    echo [OK] Claude Code 已安装
) else (
    echo 安装 Claude Code...
    call npm install -g @anthropic-ai/claude-code
    echo [OK] Claude Code 已安装
)

REM 4. 安装 superpowers-zh
echo.
if exist ".claude\skills\*.md" (
    echo [OK] superpowers-zh 已安装
) else (
    echo 安装 superpowers-zh（AI编程方法论）...
    call npx superpowers-zh
    echo [OK] superpowers-zh 已安装
)

REM 5. 配置 .env
if not exist .env (
    copy .env.example .env >nul
    echo.
    echo [提示] 请编辑 .env 文件，填入你的 API key：
    echo    DEEPSEEK_API_KEY=sk-xxx
    echo    GLM_API_KEY=xxx（可选）
    echo.
    pause
)

echo.
echo ============================================
echo  部署完成！
echo.
echo  快速开始：
echo    自然语言：ao compose "帮我分析 MEG 时频特征" --run
echo    预设模板：ao run workflows/【待添加】.yaml
echo    图形界面：ao web
echo.
echo  使用 Claude Code（写代码调试）：
echo    claude "帮我写 MNE-Python 预处理脚本"
echo ============================================

pause
