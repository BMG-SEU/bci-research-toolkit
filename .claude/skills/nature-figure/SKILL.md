# 科研图表生成方法论 (Nature Figure)

> 基于 nature-figure 方法论，生成符合期刊标准的神经科学图表

## 触发条件
用户提到「画图」「图表」「figure」「可视化」「作图」时加载。

## 图表质量标准

### 分辨率与格式
| 图表类型 | 格式 | 分辨率 | 色彩模式 |
|---------|------|--------|---------|
| 波形图/线图 | SVG/PDF | 矢量 | RGB |
| 地形图/热力图 | TIFF/PNG | ≥300 DPI | RGB |
| 脑解剖图 | TIFF | ≥300 DPI | RGB/灰度 |

### 配色方案
- 色盲友好：viridis / plasma / magma / inferno
- 双极数据：RdBu（红蓝发散）
- 统计显著性：用 * 标注，不用颜色区分
- 多条件对比：用不同线型（实线/虚线）+ 颜色

### 图表类型速查

| 数据类型 | 推荐图表 | MNE 函数 |
|---------|---------|---------|
| 原始数据 | 多通道信号图 | `raw.plot()` |
| PSD | 功率谱密度图 | `raw.plot_psd()` |
| ERP/ERF | 蝴蝶图 + 地形图 | `evoked.plot()` + `evoked.plot_topomap()` |
| 时频 | ERSP 图 | `power.plot()` (TFR) |
| 源定位 | 脑切片叠加 | `stc.plot()` |
| 功能连接 | 脑网络连接图 | 自定义 matplotlib |
| 统计对比 | 差异波 + 显著区间 | `mne.viz.plot_compare_evokeds()` |

### MNE 图表代码模板

```python
import mne
import matplotlib.pyplot as plt

plt.style.use('seaborn-v0_8-paper')
plt.rcParams.update({
    'font.size': 10,
    'axes.labelsize': 11,
    'figure.dpi': 300,
    'savefig.dpi': 300,
    'savefig.bbox': 'tight',
})

# ERP 波形图（标配）
fig, axes = plt.subplots(1, 2, figsize=(10, 4))
evoked.plot(axes=axes[0], show=False)
evoked.plot_topomap(times=[0.1, 0.2, 0.3], axes=axes[1], show=False)
plt.savefig('figure1_erp.svg', format='svg')
```
