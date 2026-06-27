# BCI Research Toolkit Docker 镜像
# 用法:
#   docker build -t bci-research-toolkit .
#   docker run -it -v $(pwd):/workspace -e DEEPSEEK_API_KEY=sk-xxx bci-research-toolkit

FROM node:20-slim

LABEL org.opencontainers.image.title="BCI Research Toolkit"
LABEL org.opencontainers.image.description="脑机接口与脑磁/脑电信号科研智能体工具包"
LABEL org.opencontainers.image.url="https://github.com/BMG-SEU/bci-research-toolkit"

# 安装系统依赖
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# 创建工作目录
WORKDIR /workspace

# 安装 agency-orchestrator 和 Claude Code
RUN npm install -g agency-orchestrator @anthropic-ai/claude-code

# 复制工具包配置
COPY . /workspace/bci-research-toolkit

# 设置工作区环境变量
ENV AO_HOME=/workspace
ENV AO_OUTPUT_DIR=/workspace/ao-output

# 设置 Claude Code 默认走 DeepSeek（可选）
# 运行时通过 -e 传入实际 key
# ENV ANTHROPIC_BASE_URL=https://api.deepseek.com/anthropic

# 默认启动 Web 界面
EXPOSE 3000
CMD ["ao", "web"]
