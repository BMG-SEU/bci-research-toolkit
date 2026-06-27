# 源定位分析方法论 (Source Localization)

## 触发条件
用户提到「源定位」「source localization」「源重建」「逆向问题」「dSPM」「sLORETA」「beamformer」时加载。

## 方法选型决策树

```
需要精确的时间序列？
├── 是 → beamformer (LCMV / DICS)
└── 否 → 分布式源成像

分布式源成像：
├── 最小范数估计 (MNE) — 快速，偏浅表
├── dSPM — 噪声归一化，统计友好
├── sLORETA — 标准化，零误差定位
└── MxNE (混合范数) — 稀疏解

beamformer：
├── LCMV (时域) — 线性约束最小方差
├── DICS (频域) — 频域相干源成像
└── SAM — 合成孔径成像
```

## 必要输入

| 输入 | 说明 | 获取方式 |
|------|------|---------|
| MRI T1 | 被试结构像 | 磁共振扫描 |
| 头模型 | 边界元 (BEM) 或球形 | mne.bem |
| 源空间 | 皮层表面或体积 | mne.setup_source_space |
| 正向解 | 从源到传感器的映射 | mne.make_forward_solution |
| 噪声协方差 | 基线或空房 | mne.compute_raw_covariance |

## MNE-Python 标准流程

```python
import mne

# 1. 源空间 (皮层表面)
src = mne.setup_source_space(
    'fsaverage', spacing='ico4', subjects_dir=subjects_dir
)

# 2. BEM 模型
model = mne.make_bem_model('fsaverage', conductivity=[0.3])
bem = mne.make_bem_solution(model)

# 3. 正向解
fwd = mne.make_forward_solution(
    raw.info, trans=trans, src=src, bem=bem,
    meg=True, eeg=True
)

# 4. 噪声协方差
noise_cov = mne.compute_raw_covariance(raw_empty)

# 5. 逆解
inv = mne.minimum_norm.make_inverse_operator(
    evoked.info, fwd, noise_cov,
    loose=0.2, depth=0.8
)

# 6. dSPM
stc = mne.minimum_norm.apply_inverse(
    evoked, inv, lambda2=1./9.,
    method='dSPM', pick_ori='normal'
)

# 7. 可视化
brain = stc.plot(
    subjects_dir=subjects_dir,
    hemi='both', views=['lateral', 'medial']
)
```

## 常见问题与解决

| 问题 | 原因 | 解决 |
|------|------|------|
| STC 没有脑区标签 | 缺少 annotation | `mne.datasets.fetch_hcp_mmp_parcellation()` |
| 逆解结果全是 0 | lambda² 太大 | 减小正则化参数 |
| 深部源被压制 | 深度加权不足 | 增大 depth 参数 (0.8→0.9) |

## 报告标准
- 报告使用的 MRI 模板（fsaverage / 被试自身）
- 报告源空间参数（ico-4 / volume）
- 报告正向模型（BEM / 球模型）
- 报告逆解方法（dSPM / sLORETA / beamformer）
- 报告正则化参数
