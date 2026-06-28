# LaTeX 论文排版 (PaperSpine LaTeX)

> 基于 paper-spine-latex 方法论，处理 LaTeX 项目组装、图表布局和编译就绪

## 触发条件
用户提到「LaTeX」「latex」「排版」「overleaf」「编译」时加载。

## 流程

### Step 1：创建 LaTeX 项目骨架
```latex
% main.tex
\documentclass[review,12pt]{elsarticle}  % NeuroImage/Elsevier 模板
% 或 \documentclass[jou]{apa7}  % APA 格式
% 或 \documentclass{ieeetran}   % IEEE 格式

\usepackage{graphicx}
\usepackage{booktabs}
\usepackage{hyperref}
\usepackage{lineno}  % 行号用于审稿

\begin{document}

\title{Your Title Here}

\author[1]{Author One}
\author[2]{Author Two}
\affiliation[1]{University A}
\affiliation[2]{University B}

\begin{abstract}
...
\end{abstract}

\section{Introduction}
...

\section{Methods}
...

\section{Results}
...

\section{Discussion}
...

\bibliographystyle{elsarticle-num}
\bibliography{references}

\end{document}
```

### Step 2：图表管理
```
project/
├── main.tex
├── references.bib
├── figures/
│   ├── figure1_erp.pdf     ← PDF 格式（矢量）
│   ├── figure2_topo.tiff   ← TIFF 格式（位图）
│   └── ...
└── tables/
    ├── table1.tex
    └── table2.tex
```

插入图表：
```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=\linewidth]{figures/figure1_erp.pdf}
  \caption{ERP waveforms at electrode Cz.}
  \label{fig:erp}
\end{figure}
```

### Step 3：编译检查
```bash
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex  # 两次获取交叉引用
```

### Step 4：常见问题修复
| 问题 | 解决 |
|------|------|
| 参考文献消失 | 重新运行 bibtex + pdflatex ×2 |
| 图片太大超出页面 | `width=\linewidth` |
| 表格太宽 | 用 `\resizebox` 或 landscape |
| 行号未显示 | 检查 `\usepackage{lineno}` |

## BCI 常用期刊 LaTeX 模板
- Elsevier (NeuroImage): `elsarticle` 文档类
- IEEE (TBME): `ieeetran` 文档类
- APA (J Neurosci Methods): `apa7` 文档类
- 通用: Overleaf 在线编辑
