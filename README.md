# 52etf.net — GitHub Repo + Hugo 极简财经指标与连接汇集站

> **内容原则**：仅做客观数据缓存、关键字标记与有效连接汇集，**不做任何主观解读，不透露任何个人资产或持仓信息**。

## 1. GitHub Repo 目录即页面（Hugo 架构）

仓库中 `content/` 目录下的每个文件夹对应一个频道，文件夹内的每一个 `.md`（或 `.txt`）文件对应一条指标连接及其独立页面：

```text
52etf-hugo/
├── hugo.toml                                  # Hugo 站点配置 (输出 HTML + Sitemap + JSON搜索索引 + llms.txt)
├── content/
│   ├── 01-daily-52etf/                        # 每日自动化指标、政策原文、标的公告、再平衡与风险管理模板
│   │   ├── _index.md
│   │   ├── etf-daily-flow-breadth.md          # -> 生成独立页 /01-daily-52etf/etf-daily-flow-breadth/
│   │   └── ...
│   ├── 02-macro/                              # 中美与 Crypto 宏观指标
│   ├── 03-bonds-fx/                           # 国债收益率、外汇、人民币短期债比例监控
│   ├── 04-valuation-pbpe/                     # PB/PE 历史分位数据
│   ├── 05-fund-managers/                      # 基金经理季报与 13F 客观数据分析页
│   ├── 06-realestate-watch/                   # 房产见底指标观测 Dashboard
│   │   └── household-loan-vs-18t-bank-credit.md  # -> 含 http://t.cn/AXh6wnlO 与住户贷款/18万亿总信贷对比独立页
│   └── 07-tools-strategy/                     # 策略数学工具与 WebMCP 接口页
├── layouts/                                   # 极简宽度限制模板 (按更新时间倒序 + >6个月自动标红 + 模糊搜索)
├── static/.well-known/mcp.json                # WebMCP 发现清单
└── scripts/calibrate_links.py                 # 外部 Agent 链接自动校准与超期巡检脚本
```

## 2. 如何新增或更新一条指标

只需在 GitHub 网页端或通过外部 Agent 在对应目录下新建/修改 `content/<目录>/<文件名>.md`：

```markdown
---
title: "房产是否到底指标观测：居民住户贷款环比增量 vs 18万亿银行信贷规模对比"
date: 2026-10-24T21:00:00+08:00
lastmod: 2026-10-24T21:00:00+08:00
keywords: ["房产见底观测", "居民住户贷款", "银行信贷18万亿", "t.cn/AXh6wnlO"]
ext_url: "http://t.cn/AXh6wnlO"
backup_url: "http://www.pbc.gov.cn/diaochatongjisi/116219/116319/index.html"
summary: "过去火爆年代居民住户贷款环比月增5000亿至超10000亿RMB | 今年过去8个月累积增量未达3000亿RMB | 当前银行信贷年增量约18万亿RMB(没有去向居民住户贷款项目中)"
---
这里写点击标题进入后的【独立页面】详细内容、历史统计序列或公式说明...
```

Push 到 GitHub 后，Hugo 自动完成：
1. 按 `lastmod` 倒序排列所有目录与条目；
2. 自动计算距今是否超过 180 天（6 个月），超过则全行标红 `[超6个月未更新]`；
3. 生成首页列表、目录分页面、每条指标的独立页面、全站模糊搜索索引 `/index.json`、搜索引擎 `/sitemap.xml` 以及 Agent 专用 `/llms.txt`。

## 3. 外部 Agent 驱动链接校准协议

外部 Agent 定时读取 `/index.json`（或运行 `python3 scripts/calibrate_links.py`）：
- 筛选 `is_stale_6m == true`（超过 6 个月未更新）或 `ext_url` 不可达的 `.md` 文件；
- 校验 `ext_url` 与 `backup_url` 状态，更新对应 `content/<dir>/<slug>.md` 中的 `summary`、`ext_url` 与 `lastmod` 字段并提交 PR / Commit，网站自动刷新。
