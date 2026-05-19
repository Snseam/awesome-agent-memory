---
title: Information sources for the agent-memory Research Radar
date: 2026-05-19
status: working-spec
language: zh-CN
---

# 信息源 catalog

`research-radar-spec.md §2` 的扩展版。Radar 的输入面就是这份清单 ——
新论文、新产品、新讨论应该都能在下面 10 个类别里找到落点。
找不到落点的来源是 catalog 本身的 bug,补到这里。

## 1. 一手论文源

- **arXiv** 的 cs.AI / cs.CL / cs.IR / cs.LG / cs.HC 子分类。
  agent memory 在 cs.AI 占主流,RL 类记忆走 cs.LG,UI / audit 类工作偶尔出现在 cs.HC。
- **OpenReview**:ICLR / NeurIPS / ICML / ACL / EMNLP / COLM 的 active 投稿与公开评审。
  在大会前 1-2 个月看 OpenReview 的偏好分数,经常能比 arXiv crawl 早抓到趋势。
- **Papers with Code**:同时跟"有 code 没 code"是 Ymem evidence_level
  判断的快速过滤器。
- **Semantic Scholar**:做"被引-引用"图谱、找 lineage 时用,但搜索功能不如 arXiv。
- **会议 deadline 表**(AI Deadlines / Conference Partner):**用作 pre-print 浪潮信号**
  —— 大会 deadline 后两周 arXiv 上 memory / agent 类投稿会激增,radar 可以踩点放大扫描频率。

## 2. 论文聚合 / 精读源

- **alphaxiv.org**:arXiv 论文的注释和讨论层,值得作为"二手意见"输入。
- **papers.cool / arxiv-sanity-lite / Cool Papers**:个性化推荐与每日精选,
  对 agent memory 这种长尾子领域比 HF Daily 命中率更高。
- **HuggingFace Daily Papers**:覆盖广但偏 LLM 主线,memory 命中率 ≤ 5%,
  作为补充而不是主线。
- **ArXivIQ Substack** / **AI Coffee Break with Letitia**:对单篇论文做深读式精读
  的少数严肃来源,适合给 stub 升级成 ResearchItem 时找 second opinion。

## 3. 实验室与厂商官方

| 角色 | 主源 | 在意 |
|---|---|---|
| 大厂研究 | Anthropic 研究页 / OpenAI 研究页 / Google DeepMind blog / Microsoft Research / Meta AI / Mistral / DeepSeek | memory 系统级架构 |
| 大厂工程 | Anthropic Engineering 博客 / OpenAI Cookbook / DeepMind technical blog | 工程 trade-off, eval 方法 |
| 平台与 SDK | LangChain / LlamaIndex / LangGraph / AutoGen / CrewAI release notes | API 形状,反推 host-app 需求 |
| memory 专门 | Mem0 / Letta / Zep / Cognee / Graphiti 博客与 changelog | 直接对标 Ymem |
| 上下文协议 | MCP spec 与官方 server 列表 | memory 与 tool / prompt 的边界 |
| IDE/Agent host | Cursor / Windsurf / Replit / Devin / Claude Code blog | memory 在真实 agent 工作流里的露出形态 |

## 4. 同生态 awesome-list

详见 [`related-work.md`](related-work.md)。9 个仓库被 Radar 视为
"先看一眼"层 —— 它们已经替我们做了一遍粗筛,Ymem 笔记从这里挑选深读对象。
**但我们不直接复制这些 list 的笔记**,只引用条目与 source。

## 5. 个人 / 独立精品来源

- **Karpathy**:LLM Wiki / X 长贴对 memory architecture 的直觉判断
- **Lilian Weng**:OpenAI 出身,memory 与 agent 综述质量高,更新慢但稳
- **Chip Huyen**:工程化视角,LLM 系统设计书
- **Hamel Husain** / **Eugene Yan**:eval / observability 视角,补 Ymem benchmark 思路
- **Simon Willison**:产品发布层面的"快讯 + 一句话评论",滤掉公关稿
- **Latent Space**(swyx)/ **The Sequence**(TheSequence)/ **Import AI**(Jack Clark)/
  **Interconnects**(Nathan Lambert)/ **Ahead of AI**(Sebastian Raschka):周报型,
  Radar 的 signals.md 主要从这几个里挑。

## 6. 中文社区(zh-CN)

中文资料对国内产品(夸克 / 智谱 / Kimi / Doubao / 元宝)的 memory 实现和落地场景
有独占信息,**单独成节,不与英文源合并**。

- **知乎**:`agent 记忆` / `长上下文` / `Mem0` / `Letta` 等关键词,中文综述长贴质量
  参差但偶有原创架构思考。
- **微博 / 小红书**:产品视角,看普通用户对 "AI 还记不记得我" 的真实反馈。
- **公众号(用 RSSHub 或 wechat2rss 订阅)**:
  - **量子位** / **机器之心** / **新智元**:论文与产品综合快讯
  - **PaperWeekly** / **AI科技评论**:论文深度
  - **智东西**:产品横评与商业化
- **B 站**:论文长视频解读(尤其 ICLR / NeurIPS 后)
- **中文 awesome**:`IAAR-Shanghai/Awesome-AI-Memory` 是目前最全的双语 list,
  我们引用它的条目但不复制其笔记。

## 7. 工程信号

- **GitHub trending**(按 week / month,language=Python)和 memory-related 仓库的
  `releases` / `issues` / `pulls`。
- **Hacker News**:`memory` / `agent memory` / 具体产品名作为关键词,通常评论比帖子
  更有信息密度。
- **Reddit**:`r/MachineLearning`(论文)/ `r/LocalLLaMA`(开源工程)/
  `r/LLMDevs`(产品工程师视角)。
- **X / Twitter**:`#agentmemory`、关键人物(参见 §5)。
- **Hugging Face**:Trending models / spaces / datasets,memory bench 类 dataset
  往往最先出现在这里。
- **LMArena / 记忆专项 leaderboards**(LongMemEval 官方 leaderboard、
  MemoryAgentBench leaderboard):基线移动信号。

## 8. 产品横评与行业报告

详见 [`signals.md`](signals.md)。常出处:

- mem0.ai/blog / fountaincity.tech / atlan.com / blog.devgenius.io /
  explore.n1n.ai / evermind.ai:agent memory 产品横评高产源
- a16z / Sequoia / Greylock 季报中的 AI agent 章节
- Anthropic / OpenAI / Google 的 yearly report 与 dev day keynotes

## 9. 学术活动

- **NeurIPS / ICLR / ICML / ACL / EMNLP / COLM** memory / agents 相关 workshop
- **AI Engineer Summit** / **Anthropic AI Engineer** / **OpenAI DevDay** /
  **Google I/O AI** keynote 与 breakout 录像
- **Linux Foundation / CNCF AI events**:企业 agent 落地视角

## 10. Radar 自动化路径(v1+)

当前(v0)所有来源都靠人工扫描;后续按优先级实现:

1. **v0.5 半自动**:每周固定时段(周一 / 周四)手动扫 §1 / §2 / §6 / §7
2. **v1**:arXiv API(`category=cs.AI` + keyword 过滤)+ GitHub API
   (watched 仓库 release)定期拉取,落到 `signals.md` 草稿,人工筛
3. **v2**:同生态 awesome-list (§4)的 README 做 weekly diff,新增条目自动建 stub
4. **v3**:中文公众号 RSSHub 接入

Radar 不目标做"全自动论文阅读";自动化只用来**减少漏读**,paper 是否值得深读
仍由人工决定。
