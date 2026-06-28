#!/bin/bash
# BCI Research Toolkit — 工作流执行器
# Claude Code 可直接调用此脚本执行 AO 工作流

TOOLKIT_DIR="$(cd "$(dirname "$0")/../../../.." && pwd)"
cd "$TOOLKIT_DIR"

ACTION="${1:-list}"
WORKFLOW="${2:-}"
shift 2 2>/dev/null || true

case "$ACTION" in
  list)
    echo "=== 可用工作流 ==="
    for f in workflows/*.yaml; do
      name=$(grep -m1 'name:' "$f" | sed 's/.*"\(.*\)".*/\1/')
      echo "  $(basename "$f"): $name"
    done
    ;;
    
  run)
    if [ -z "$WORKFLOW" ]; then
      echo "用法: run_workflow.sh run <工作流名> [参数...]"
      echo "先用 run_workflow.sh list 查看可用工作流"
      exit 1
    fi
    WF_FILE="workflows/${WORKFLOW}.yaml"
    if [ ! -f "$WF_FILE" ]; then
      WF_FILE="workflows/${WORKFLOW}"
    fi
    if [ ! -f "$WF_FILE" ]; then
      echo "❌ 工作流不存在: $WF_FILE"
      exit 1
    fi
    echo "🚀 执行工作流: $WORKFLOW"
    ao run "$WF_FILE" "$@"
    ;;

  compose)
    PROMPT="$*"
    if [ -z "$PROMPT" ]; then
      echo "用法: run_workflow.sh compose \"你的需求描述\""
      exit 1
    fi
    echo "🧠 自然语言编排: $PROMPT"
    ao compose "$PROMPT" --run
    ;;

  *)
    echo "BCI Research Toolkit — 工作流执行器"
    echo ""
    echo "用法:"
    echo "  run_workflow.sh list                        列出所有工作流"
    echo "  run_workflow.sh run <名称> [参数]            执行预设工作流"
    echo "  run_workflow.sh compose \"需求描述\"          自然语言编排"
    echo ""
    echo "示例:"
    echo "  run_workflow.sh run literature-review -i topic=\"motor imagery BCI\""
    echo "  run_workflow.sh run paper-abstract -i background=\"...\" -i method=\"...\" -i results=\"...\" -i conclusion=\"...\""
    echo "  run_workflow.sh compose \"帮我分析MEG数据的时频特征\""
    ;;
esac
