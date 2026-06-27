# BCI Research Toolkit — 常见问题

## 安装与配置

**Q：setup.sh 报错 "command not found: npm"**
A：需要先安装 Node.js。去 https://nodejs.org 下载 LTS 版本，安装后重新运行 setup.sh。

**Q：DeepSeek API key 在哪获取？**
A：https://platform.deepseek.com/api_keys → 注册 → 创建 API key → 复制到 .env 的 DEEPSEEK_API_KEY。

**Q：要充多少钱？**
A：充 10 块够用很久。¥2/1M tokens，一篇论文 Discussion 约 ¥0.16。

**Q：能用自己的 OpenAI key 吗？**
A：可以。在 .env 中加 OPENAI_API_KEY，然后 `--provider openai`。

**Q：能直接用 Claude 会员吗？**
A：可以。本机装了 Claude Code 并登录后，`--provider claude-code` 完全不额外花钱。

---

## 使用

**Q：ao web 和 ao compose 什么区别？**
A：`ao web` 是图形界面（浏览器操作），`ao compose` 是命令行（终端打字）。结果一样，看个人习惯。

**Q：怎么看工作流支持哪些参数？**
A：打开 `workflows/xxx.yaml` 文件，`inputs:` 下面列的就是。也可以用 `ao explain workflows/xxx.yaml` 查看。

**Q：怎么知道有哪些 Skills 可用？**
A：在 tutorial.md 里有速查表。日常直接用就行——AO 会根据你的需求自动加载对应的 Skill。

**Q：产出文件在哪？**
A：默认在 `ao-output/` 目录下。也可以在 YAML 里指定 `output_file`。

**Q：能中途修改参数重新跑某一步吗？**
A：可以。`ao run workflows/xxx.yaml --resume last --from <步骤ID>`。

---

## Agent 与 Skills

**Q：能自定义 Agent 吗？**
A：可以。在 `agents/` 目录复制一个 `.md` 文件，修改角色定义就行。

**Q：能自定义 Workflow 吗？**
A：可以。在 `workflows/` 目录复制一个 `.yaml` 文件，修改步骤和依赖关系。

**Q：能自定义 Skill 吗？**
A：可以。在 `skills/` 目录创建新文件夹，写入 `SKILL.md` 即可。

---

## 费用与安全

**Q：数据安全吗？**
A：所有数据存本地（SQLite + 文件系统）。API 调用只传文本不传数据文件，key 仅在本地 .env 中（已 gitignore）。

**Q：API key 会不会泄露？**
A：.env 已在 .gitignore 中，不会被 git push 上传。每人本机独立 key。

**Q：AO 和 Claude Code 哪个更耗钱？**
A：AO 用 DeepSeek 直接调用，¥0.01-0.16 一次。Claude Code 如果也配成 DeepSeek 后端，费用相同。如果用 Claude API 直连，费用高约 10 倍。

---

## 遇到问题

**Q：怎么报告 Bug？**
A：在 GitHub Issues 提交：https://github.com/BMG-SEU/bci-research-toolkit/issues

**Q：怎么贡献新功能？**
A：Fork → 创建分支 → 修改 → 发 PR。详见 CONTRIBUTING.md。

**Q：怎么更新工具包？**
A：`git pull origin main` 拉最新配置，`npm update -g agency-orchestrator` 更新引擎。
