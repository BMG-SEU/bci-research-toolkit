# BCI 科研工具包 — 新手上手指南

> **只要会复制粘贴，就能用。** 跟着步骤走，5 分钟搞定。

---

## 第 0 步：你需要准备什么

| 你需要 | 去哪弄 | 花多少钱 |
|--------|--------|:--:|
| 一台电脑 | 你的 | — |
| 一个 DeepSeek 账号 | https://platform.deepseek.com | 充 10 块 |
| 一个 GitHub 账号（可选） | https://github.com | 免费 |

> **充 10 块钱够用几个月。** DeepSeek 很便宜，一次论文分析不到 2 毛钱。

---

## 第 1 步：检查有没有 Node.js

> Node.js 是运行这个工具包的前提。**大多数做科研的电脑上已经有了。** 检查一下：

### Windows 用户

1. 按键盘 `Win + R`，输入 `cmd`，回车
2. 在黑色窗口里输入：
   ```
   node -v
   ```
3. 回车

### Mac 用户

1. 按 `Cmd + 空格`，输入 `Terminal`，回车
2. 输入：
   ```
   node -v
   ```
3. 回车

**看到类似 `v20.x.x` 说明已有 → 跳到第 2 步。**

**看到 `'node' 不是内部或外部命令` → 需要安装：**

1. 打开浏览器，访问：https://nodejs.org
2. 点击左边绿色的 **LTS** 按钮下载
3. 下载完成后双击安装（一路点「下一步」就行）
4. 安装完重新打开 cmd / Terminal，再输入 `node -v` 确认

---

## 第 2 步：获取 DeepSeek API key

> API key 就像一把钥匙，让工具包能调用 AI。

1. 打开浏览器，访问：https://platform.deepseek.com
2. 点右上角「注册」，用手机号或邮箱注册
3. 登录后，点左边菜单「API Keys」
4. 点「创建 API Key」
5. 复制那一串 `sk-` 开头的字符（**保存好，只显示一次**）
6. 去「充值」页面，充 10 块钱

> 这把 key 是**你自己的**，不要发给别人。

---

## 第 3 步：下载工具包（三选一）

### 方式 A：有 GitHub 账号（推荐）

1. 打开 https://github.com/BMG-SEU/bci-research-toolkit
2. 点绿色的 **Code** 按钮
3. 选 **Download ZIP**
4. 下载完解压到桌面

### 方式 B：用 Git 命令

打开 cmd（Win）或 Terminal（Mac），输入：

```
git clone https://github.com/BMG-SEU/bci-research-toolkit.git
```

> 如果没有 Git：https://git-scm.com 下载安装，一路下一步。

### 方式 C：Docker（无需装 Node.js，环境隔离）

如果你会 Docker 或者想用服务器部署：

1. 确保电脑已装 Docker Desktop（https://docker.com）
2. 解压后编辑 `.env` 填入 API key
3. 打开 cmd/Terminal，进入文件夹
4. 输入：
   ```
   docker compose up -d
   ```
5. 浏览器打开 `http://localhost:3000`

> Docker 的好处：不用装 Node.js、环境隔离、可以在服务器上跑。

---

## 第 4 步：一键安装

### Windows

1. 在解压后的 `bci-research-toolkit` 文件夹里
2. 双击 `setup.bat`
3. 如果弹出「Windows 保护了你的电脑」，点「更多信息」→「仍要运行」
4. 等它跑完（约 2 分钟）

### Mac

1. 打开 Terminal
2. 输入 `cd`，拖入 `bci-research-toolkit` 文件夹，回车
3. 输入 `bash setup.sh`，回车
4. 等它跑完（约 2 分钟）

**你会看到这样的输出：**

```
============================================
 BCI Research Toolkit — 一键部署
============================================

✅ Node.js v20.x.x
✅ agency-orchestrator 已安装
✅ Claude Code 已安装
✅ superpowers-zh 已安装
📦 初始化角色库...
✅ 角色库已初始化

============================================
 ✅ 部署完成！

 🖥️  启动图形界面（推荐）：
   ao web         浏览器打开，选模板 → 填参数 → 点运行
============================================
```

---

## 第 5 步：填入你的 API key

1. 在 `bci-research-toolkit` 文件夹里找到 `.env.example` 文件
2. 把它**复制一份**，重命名为 `.env`（去掉 `.example`）
3. 用记事本打开 `.env`
4. 找到这一行：
   ```
   DEEPSEEK_API_KEY=sk-your-deepseek-key-here
   ```
5. 把 `sk-your-deepseek-key-here` 替换成你在第 2 步拿到的真实 key
6. 保存文件

> ⚠️ `.env` 文件名就是 `.env`，不是 `.env.txt`。Windows 可能隐藏扩展名，改完确认文件名变成了「ENV 文件」类型。

---

## 第 6 步：启动！（图形界面，推荐）

### Windows

1. 在 `bci-research-toolkit` 文件夹的地址栏里输入 `cmd`，回车
2. 输入：
   ```
   ao web
   ```
3. 回车

### Mac

1. 打开 Terminal
2. 输入 `cd`，拖入 `bci-research-toolkit` 文件夹，回车
3. 输入 `ao web`，回车

**浏览器会自动打开一个界面。** 你会看到：

```
┌──────────────────────────────────┐
│  🧠 Agency Orchestrator         │
│                                  │
│  📁 选择工作流                    │
│  📝 输入参数                      │
│  ▶ 运行                          │
└──────────────────────────────────┘
```

> 如果浏览器没自动打开，手动打开浏览器访问 `http://127.0.0.1:8088`

---

## 第 7 步：开始使用！

### 方式一：图形界面（最简单）

1. 在界面里下拉选择工作流模板（比如「文献综述」）
2. 在输入框里填你的需求（比如研究主题）
3. 点「运行」
4. 等待 1-3 分钟
5. 结果自动保存到 `ao-output/` 文件夹

### 方式二：打字聊天（也能行）

在刚才的黑色窗口（cmd/Terminal）里输入你想问的：

```
ao compose "我有 MEG 数据，不知道该怎么处理" --run
```

回车后 AI 会给你反馈。就像聊天一样。

---

## 🎯 常用操作速查

| 我想... | 怎么做 |
|---------|--------|
| 启动工具 | 进入文件夹 → `ao web` |
| 搜文献 | 图形界面选「文献综述」模板，或在命令行输入 `ao compose "帮我搜 BCI 文献" --run` |
| 写论文 | 图形界面选「论文讨论/方法/结果」模板 |
| 规划数据处理 | `ao compose "帮我规划 MEG 预处理" --run` |
| 润色英文 | `ao compose "帮我润色这段英文" --run`，然后粘贴你的英文 |
| 翻译论文 | `ao compose "帮我把这段翻译成英文" --run` |
| 看不懂某个结果 | `ao compose "这个统计分析结果怎么看" --run` |
| 不知道怎么用 | 直接在窗口里描述你的问题，AI 自己判断该用什么功能 |

---

## 🆘 遇到问题怎么办

| 问题 | 解决 |
|------|------|
| `ao` 命令找不到 | 重新双击 `setup.bat`（Win）或 `bash setup.sh`（Mac），确保没有报错 |
| 浏览器没自动打开 | 手动打开浏览器，地址栏输入 `http://127.0.0.1:8088` |
| 运行报错「API key」 | 检查第 5 步：文件名是 `.env`，key 填对了 |
| 运行报错「model」 | 确保 `.env` 里 `AO_DEFAULT_MODEL=deepseek-chat` 这一行存在 |
| DeepSeek 提示余额不足 | 去 https://platform.deepseek.com 充值 |
| 想退出 | 关掉浏览器页面，在 cmd/Terminal 里按 `Ctrl + C` |
| 完全不知道该怎么办 | 打开 cmd/Terminal，粘贴这句：`ao compose "我第一次用这个工具，我能做什么？" --run` |

---

## 💡 小贴士

- **别怕犯错**——你是跟 AI 聊天，问什么都不会坏
- **越具体越好**——「帮我处理 EEG」不如「我有 64 通道 500Hz EEG 数据，眼电伪影很严重」
- **不满意就说**——「这个方案太简单了，给我更详细的」
- **花钱很少**——一次提问 ¥0.01-0.16，充 10 块钱能用几个月
- **数据在你电脑上**——不上传任何数据到云端，API 只传你的文字指令
