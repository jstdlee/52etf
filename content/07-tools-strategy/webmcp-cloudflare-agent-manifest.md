---
title: "52etf.net WebMCP与Cloudflare Agent标准接口说明 (llms.txt / index.json / mcp.json)"
date: 2026-10-24T21:15:00+08:00
lastmod: 2026-10-24T21:15:00+08:00
keywords: ["WebMCP", "CF-Agent", "llms.txt", "sitemap", "防高频爬取"]
ext_url: "https://52etf.net/.well-known/mcp.json"
backup_url: "https://52etf.net/llms.txt"
summary: "提供 /llms.txt、/index.json、/sitemap.xml 与浏览器 navigator.modelContext 工具注册，单次读取免高频爬取"
---
52etf.net 对 Agent 友好且防高频爬取架构说明：

- 全量结构化 JSON 索引（供站内模糊搜索与外部 Agent 单次拉取）：`/index.json`
- 纯文本 LLM 索引（符合 Cloudflare Agent 标准）：`/llms.txt`
- 搜索引擎与 Agent 站点地图：`/sitemap.xml`
- WebMCP 发现清单：`/.well-known/mcp.json`
- 防高频爬取策略：静态文件通过 Cloudflare Edge 缓存（`s-maxage=3600`），高频并发抓取 HTML（>15 req/min/IP）限流并引导至 `/index.json` 或 `/llms.txt`。
