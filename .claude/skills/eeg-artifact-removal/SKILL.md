# EEG 去伪影方法论 (EEG Artifact Removal)

## 触发条件
用户提到「EEG 伪影」「去眼电」「去肌电」「artifact removal」「ICA 去伪影」时加载。

## 伪影类型与识别

| 伪影类型 | 特征 | 频段 | 典型分布 |
|---------|------|------|---------|
| 眼电（EOG） | 大幅慢波，瞬态 | <4 Hz | 前额电极（Fp1, Fp2） |
| 肌电（EMG） | 高频不规则振荡 | >30 Hz | 颞部、枕部 |
| 心电（ECG） | 规律 QRS 波形 | ~1 Hz | 全导联（幅度不一） |
| 线噪声 | 单频正弦波 | 50/60 Hz | 全导联 |
| 电极移位 | 突然的直流偏移 | 极低频 | 单个或少数电极 |

## 去伪影策略

### 策略 1：自动检测 + 拒绝（简单快速）
```
autoreject（自动坏段检测）
  → Local 或 Global 模式
  → 自动学习阈值
  → 适用：标准分析，伪影不严重
```

### 策略 2：ICA 分解（推荐）
```
滤波（1Hz 高通，避免慢漂移到 ICA）
  ↓
坏通道检测 + 插值
  ↓
ICA 分解（FastICA 或 Picard）
  ↓
成分识别：
  - EOG：前额主导，低频高幅
  - ECG：规律尖峰，全导联分布
  - EMG：高频，局部
  ↓
剔除污染成分
  ↓
重建信号
```

### 策略 3：SSP/SSS（MEG 专用）
```
Maxwell 滤波 + SSP
  → 去除外部磁噪声
  → 保留大脑信号
```

## 成分自动识别方法

### EOG 自动检测
```python
from mne.preprocessing import corrmap
# 基于眼电通道的相关性检测
eog_indices = find_eog_events(raw)
ica.exclude = corrmap(ica, template=(0, eog_indices[0]))
```

### 通用自动标记
```python
# 使用 ICLabel 自动分类
from mne_icalabel import label_components
ic_labels = label_components(raw, ica, method='iclabel')
# 自动剔除标记为'eye'和'heart'的成分
```

## 效果验证指标
- 伪影通道的方差降低 80%+
- PSD 在伪影频段无明显峰值
- 保留通道信号不失真（ERP 波形对比）

## Python 模板
```python
import mne
from mne.preprocessing import ICA

raw = mne.io.read_raw_fif('data.fif', preload=True)
raw.filter(1, 40)

ica = ICA(n_components=30, method='picard', random_state=42)
ica.fit(raw)

# 自动找 EOG 成分
eog_indices, eog_scores = ica.find_bads_eog(raw, ch_name='Fp1')
ica.exclude = eog_indices

# 应用 ICA
raw_clean = ica.apply(raw.copy())
```
