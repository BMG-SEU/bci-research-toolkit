# 时频分析方法论 (Time-Frequency Analysis)

## 触发条件
用户提到「时频分析」「ERSP」「wavelet」「Hilbert」「multi-taper」「功率谱」时加载。

## 方法选型决策

| 场景 | 推荐方法 | 关键参数 |
|------|---------|---------|
| 探索性分析 | Morlet 小波 | 周期数 3-7 |
| 稳态分析 | Multi-taper | 带宽 2-4 Hz |
| 相位分析 | Hilbert 变换 | 窄带滤波后 |
| 时间精度高 | Morlet（低周期数） | 周期数 3 |
| 频率精度高 | Morlet（高周期数）/ Multi-taper | 周期数 7+ |

## 参数速查表

| 参数 | 常见范围 | 选择依据 |
|------|---------|---------|
| 频率范围 | 2-100 Hz | 低频 2-4 Hz（delta），4-8（theta），8-13（alpha），13-30（beta），30-100（gamma） |
| 频率步长 | 0.5-2 Hz | 线性/对数间隔 |
| 周期数 | 3-10 | 低=时间精度，高=频率精度 |
| 基线 | 刺激前 200-500ms | 常用 -200 到 0 ms |
| 基线校正方式 | dB / % / z-score | dB 最常用 |
| 时间窗 | 刺激前 500ms → 后 1000-2000ms | 根据范式 |

## Morlet 小波详解

```
中心频率 f，时间 t：
W(f, t) = (σ√π)^(-1/2) * exp(-t²/2σ²) * exp(2πift)

其中 σ = n_cycles / (2πf)

关键：周期数越大 → 频率分辨率越高，时间分辨率越低
```

## 常用 MNE 代码

```python
import mne

# 定义频率
freqs = np.logspace(*np.log10([2, 40]), num=20)  # 对数间隔

# Morlet 小波
n_cycles = freqs / 2.  # 低频少周期，高频多周期
power = mne.time_frequency.tfr_morlet(
    epochs, freqs, n_cycles=n_cycles,
    return_itc=False, average=True
)

# 基线校正 (dB)
power.apply_baseline(baseline=(-0.2, 0), mode='logratio')

# 可视化
power.plot(picks=['C3', 'C4'], baseline=(-0.2, 0),
           mode='logratio', title='ERD/ERS')
```

## 结果解读指南

| 现象 | 频段 | 含义 |
|------|------|------|
| alpha ERD | 8-13 Hz↓ | 感觉/运动皮层激活 |
| beta ERD | 13-30 Hz↓ | 运动准备/执行 |
| gamma ERS | 30-100 Hz↑ | 局部信息处理 |
| theta ERS | 4-8 Hz↑ | 记忆/注意力 |

## 常见错误
- ❌ 不报告基线校正方法
- ❌ 不报告周期数
- ❌ 基线过短（<100ms，统计不稳定）
- ❌ 滤波后做时频分析（边界效应）
