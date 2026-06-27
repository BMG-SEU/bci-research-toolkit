# BCI Research Toolkit — 功能测试计划

## 测试前准备

```bash
cd bci-research-toolkit
# 确保 .env 里 DEEPSEEK_API_KEY 已配置
```

---

## 第一阶段：零费用验证（不调用 API）

### 1.1 YAML 格式校验（30 秒）

```bash
for f in workflows/*.yaml; do
  echo "=== $f ==="
  ao validate "$f"
done
```

**预期**：11 个文件全部 `valid ✓`，无报错。

### 1.2 执行计划查看（不执行，不花钱）

```bash
ao plan workflows/meg-preprocessing.yaml -i file_path=@test.fif
ao plan workflows/literature-review.yaml -i topic="motor imagery BCI"
ao plan workflows/paper-methods.yaml -i design="被试内" -i participants="N=20" -i acquisition="64ch 500Hz" -i preprocessing="1-40Hz" -i analysis="CSP+SVM" -i stats="t检验"
ao plan workflows/paper-results.yaml -i neural="alpha ERD显著"
ao plan workflows/paper-discussion.yaml -i results_summary="alpha ERD" -i hypothesis="源空间稳定" -i limitations="N=20"
ao plan workflows/eeg-analysis.yaml -i file_path=@test.set -i analysis_type="time-frequency"
ao plan workflows/source-localization.yaml -i file_path=@test.fif -i method="dSPM"
ao plan workflows/connectivity-analysis.yaml -i file_path=@test.fif -i method="PLV"
ao plan workflows/paper-abstract.yaml -i background="BCI面临泛化挑战" -i method="迁移学习框架" -i results="准确率85%" -i conclusion="有效减少校准"
ao plan workflows/figure-generation.yaml -i data_desc="ERP P300 5.2±1.1 vs 3.1±0.9µV" -i figure_type="ERP波形"
ao plan workflows/data-analysis-bridge.yaml -i file_path=@test.fif
```

**预期**：每个命令输出完整的 DAG 执行计划，无报错。`--plan` 不调用 LLM，免费。

### 1.3 角色列表验证

```bash
ao roles
```

**预期**：列出所有可用的 Agent 角色。

---

## 第二阶段：功能验收测试（调用 API，少量花费）

### 2.1 自由对话——一句话出结果

```bash
ao compose "帮我规划 MEG 数据的预处理步骤，采样率1000Hz，306通道" --run
```

**验证点**：✅ 自动拆解任务 ✅ 匹配角色 ✅ 输出可用方案

### 2.2 预设模板——MEG 预处理

```bash
ao run workflows/meg-preprocessing.yaml \
  -i file_path=@test.fif \
  -i task_type="resting-state"
```

**验证点**：✅ 4 步骤依次执行 ✅ DAG 依赖正确 ✅ 产出报告

### 2.3 预设模板——文献综述

```bash
ao run workflows/literature-review.yaml \
  -i topic="deep learning for motor imagery BCI" \
  -i year_start="2022" \
  -i year_end="2025"
```

**验证点**：✅ 5 步骤执行 ✅ 自动并行 ✅ 产出综述 .md

### 2.4 预设模板——论文 Discussion

```bash
ao run workflows/paper-discussion.yaml \
  -i results_summary="alpha ERD在C3电极显著(t=3.4,p=.003)" \
  -i hypothesis="源空间连接比传感器空间更稳定" \
  -i limitations="样本中等(N=20);仅静息态;未跨范式验证"
```

**验证点**：✅ 4 步骤执行 ✅ 并行（文献对比+局限讨论）✅ 产出 Discussion .md

### 2.5 预设模板——论文 Methods

```bash
ao run workflows/paper-methods.yaml \
  -i design="2×2被试内设计" \
  -i participants="N=20健康成人(10女,年龄22-35,Mean=26.3±3.1)" \
  -i acquisition="64ch BrainAmp EEG,500Hz,FCz参考" \
  -i preprocessing="0.1-40Hz滤波,ICA30成分,±100µV拒绝" \
  -i analysis="CSP(6对滤波器)+LDA分类器" \
  -i stats="配对t检验,FDR校正,Cohen's d效应量"
```

**验证点**：✅ 6 步骤依次生成 ✅ 产出完整 Methods .md

### 2.6 预设模板——论文 Results

```bash
ao run workflows/paper-results.yaml \
  -i behavioral="反应时A:450±30ms vs B:480±35ms,t(19)=2.8,p=.01,d=0.63" \
  -i neural="alpha ERD:C3电极8-13Hz,条件A显著强于条件B(聚类置换p=.02)" \
  -i comparison="vs EEGNet:准确率+8%,ITR+5bps" \
  -i figures="Fig1:ERP在Cz;Fig2:地形图alpha频段;Fig3:混淆矩阵"
```

**验证点**：✅ 按序执行 ✅ 产出 Results .md

### 2.7 预设模板——图表生成

```bash
ao run workflows/figure-generation.yaml \
  -i data_desc="ERP P300:Cz电极条件A(5.2±1.1µV)vs条件B(3.1±0.9µV),t=3.4,p=.003" \
  -i figure_type="ERP波形对比" \
  -i journal_style="NeuroImage"
```

**验证点**：✅ 三步法（分析→选图→绘图）✅ 产出 Python 代码

### 2.8 Web 界面

```bash
ao web
```

**验证点**：✅ 浏览器打开 ✅ 工作流列表可见 ✅ 可参数化运行

---

## 第三阶段：完整验收清单

| # | 测试项 | 状态 |
|---|--------|:--:|
| 1 | 全部 11 个 YAML 通过 `ao validate` | ⬜ |
| 2 | 全部 11 个通过 `ao plan` | ⬜ |
| 3 | 自然语言编排正常工作 | ⬜ |
| 4 | 多 Agent 自动协作（角色匹配正确） | ⬜ |
| 5 | DAG 自动并行检测 | ⬜ |
| 6 | `{{变量}}` 传递正确 | ⬜ |
| 7 | `output_file` 产出文件 | ⬜ |
| 8 | Web 界面（`ao web`） | ⬜ |
| 9 | Skills 自动加载（工作流中引用 skill 的步骤提示词包含方法论） | ⬜ |
| 10 | Claude Code 桥接（如有真实数据文件） | ⬜ |

---

## 费用预估

| 测试项 | 预估 tokens | 费用 |
|--------|------------|------|
| 11 个 validate + plan | 0 | **¥0** |
| 5 个核心工作流测试 | ~200K | **¥0.40** |
| 全部 11 个工作流 | ~400K | **¥0.80** |

> 花不到 1 块钱就能验证全部功能。
