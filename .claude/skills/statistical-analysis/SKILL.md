# 统计检验方法论 (Statistical Analysis)

## 触发条件
用户提到「统计」「t检验」「ANOVA」「p值」「显著性」「多重比较」「效应量」时加载。

## 实验设计 → 统计方法 速查

| 实验设计 | 参数方法 | 非参数方法 |
|---------|---------|-----------|
| 两条件配对 | Paired t-test | Wilcoxon signed-rank |
| 两条件独立 | Independent t-test | Mann-Whitney U |
| 多条件单因素（配对） | One-way RM ANOVA | Friedman test |
| 多条件单因素（独立） | One-way ANOVA | Kruskal-Wallis |
| 多条件多因素 | Two-way ANOVA | — |
| 时间序列 × 条件 | 聚类置换检验 | — |
| 相关性 | Pearson r | Spearman ρ |

## 分析前检查清单

- [ ] 正态性：Shapiro-Wilk test / Q-Q plot
- [ ] 方差齐性：Levene test / Bartlett test
- [ ] 球形假设（RM ANOVA）：Mauchly's test
- [ ] 异常值：±3 SD 外 → 考虑剔除
- [ ] 样本量是否充足（≥ 20 被试，效应量足够）

## 多重比较校正

| 方法 | 适用 | 严格度 |
|------|------|:--:|
| Bonferroni | 独立检验 | 最严 |
| Bonferroni-Holm | 独立检验 | 较严 |
| FDR (Benjamini-Hochberg) | 大规模检验 | 适中 |
| TFCE | 连续数据 | — |
| 聚类置换检验 | 时空连续数据 | — |

## MNE 聚类置换检验（BCI/MEG/EEG 最常用）

```python
from mne.stats import permutation_cluster_1samp_test

# 单样本 vs 0（如 ERD vs baseline）
T_obs, clusters, cluster_p_values, H0 = \
    permutation_cluster_1samp_test(
        data, n_permutations=1000,
        threshold=2.0,  # t-value 聚类形成阈值
        tail=0,          # 双侧
        adjacency=adjacency_matrix,  # 通道邻接矩阵
        n_jobs=-1
    )

# 可视化显著聚类
for i_c, c in enumerate(clusters):
    if cluster_p_values[i_c] < 0.05:
        c_times = times[c[1]]  # 显著时间窗
        print(f"Cluster {i_c}: p={cluster_p_values[i_c]:.3f}")
```

## 报告格式标准

```
统计报告必含四要素：
  检验类型（自由度） = 值，p = 实际值，效应量 = 值

示例：
  "分类准确率显著高于随机水平（t(19) = 8.34, p < .001, d = 1.86）"
  "条件间存在主效应（F(2,38) = 5.67, p = .007, η² = .23）"
```

## 常见统计错误

| 错误 | 正确 |
|------|------|
| 只报告 p 值 | p + 效应量 |
| p < .05 笼统 | p = .032（实际值） |
| 被试内用被试间检验 | 配对检验 |
| 不做多重比较校正 | 至少 FDR |
| 不检查假设就参数检验 | 先检查，必要时非参数 |
| 小样本用大样本方法 | N<20 优先非参数 |
