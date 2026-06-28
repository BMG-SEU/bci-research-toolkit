#!/bin/bash
# BCI Research Toolkit — YAML 校验器
# 验证所有工作流 YAML 是否合法

TOOLKIT_DIR="$(cd "$(dirname "$0")/../../../.." && pwd)"
cd "$TOOLKIT_DIR"

echo "=== BCI Toolkit YAML 校验 ==="
echo ""

PASS=0
FAIL=0
for f in workflows/*.yaml; do
  result=$(ao validate "$f" 2>&1)
  if echo "$result" | grep -q "valid\|✓\|通过"; then
    echo "✅ $(basename "$f")"
    PASS=$((PASS + 1))
  else
    echo "❌ $(basename "$f"): $result"
    FAIL=$((FAIL + 1))
  fi
done

echo ""
echo "=== 结果: $PASS 通过, $FAIL 失败 ==="
