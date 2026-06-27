# BCI 机器学习方法论 (Machine Learning for BCI)

## 触发条件
用户提到「BCI 分类」「机器学习」「特征提取」「CSP」「EEGNet」「深度学习」「迁移学习」时加载。

## 特征提取方法速查

| 方法 | 适用场景 | 维度 | 关键参数 |
|------|---------|------|---------|
| CSP | 运动想象 | C²×M | 滤波器对 C=3-6 |
| FBCSP | 运动想象 | 多频段 CSP | 频段 4-40Hz，子带 4-8 个 |
| 功率谱密度 | 通用 | F×Ch | 频段和窗口 |
| 共空间模式 | 运动想象 | — | 正则化 (正则 CSP) |
| 黎曼几何 | 多类 | M×(M+1)/2 | M=通道数 |
| 时域特征 | ERP | T×Ch | Hjorth, 统计特征 |
| 深度学习 | 大数据 | 端到端 | — |

## 经典方法 Pipeline

### CSP + LDA（基线方法）
```
原始 EEG
  ↓ 带通滤波 (8-30 Hz motor imagery)
  ↓ Epoch 分段
  ↓ CSP 特征 (6 滤波器对 → 12 维特征)
  ↓ 对数方差
  ↓ LDA 分类
  → 准确率基线 ~70-80%
```

### EEGNet（深度学习）
```python
# 紧凑 CNN，4 个卷积层
model = EEGNet(
    nb_classes=2, Ch=64, Samples=500,
    dropoutRate=0.5,
    kernLength=64,   # 采样率/2
    F1=8, D=2, F2=16
)
```

## 分类器选型

| 分类器 | 优点 | 缺点 |
|--------|------|------|
| LDA | 简单快速，小样本友好 | 线性假设 |
| SVM (RBF) | 非线性，鲁棒 | 需要调参 |
| 黎曼 MDM | 不需特征选择，旋转不变 | 维度高 |
| EEGNet | 端到端，泛化好 | 需要较多数据 |
| DeepConvNet | 深层，表达力强 | 容易过拟合 |
| 迁移学习 | 减少校准 | 需要源域数据 |

## 评估标准

```python
from sklearn.model_selection import cross_val_score, StratifiedKFold

cv = StratifiedKFold(n_splits=5, shuffle=True, random_state=42)
scores = cross_val_score(model, X, y, cv=cv, scoring='accuracy')

print(f"Accuracy: {scores.mean():.3f} ± {scores.std():.3f}")
```

## 报告清单
- [ ] 特征提取方法及参数
- [ ] 分类器及超参数
- [ ] 交叉验证策略（K-fold, K=?）
- [ ] 性能指标：accuracy + ITR + confusion matrix
- [ ] 是否独立测试集？
- [ ] 是否与基线方法对比（≥2 个）？
