---
title: "52etf.net 自动化链接核实 (check-links.mjs -> 404.txt) 与 Cloudflare Agent / WebMCP 接口规范"
date: 2026-10-25T10:00:00+08:00
lastmod: 2026-10-25T13:15:00+08:00
tags: ["WebMCP", "CloudflareAgent", "404.txt", "Agent校准", "llms.txt", "llms-full.txt", "sitemap"]
keywords: ["WebMCP", "Cloudflare Agent", "Markdown for Agents", "404.txt", "llms.txt", "llms-full.txt", "mcp.json", "agent.json"]
ext_url: "https://jstdlee.github.io/52etf/404.txt"
backup_url: "https://jstdlee.github.io/52etf/llms.txt"
summary: "Cloudflare Agent 规范 (/*/index.md + Content-Signal) | 单次全量语料 /llms-full.txt | WebMCP 浏览器工具注册 | CI 自动巡检外链 -> /404.txt"
---

### Cloudflare Agent 规范、WebMCP 工具注册与自动化外链巡检 (`404.txt`)

- **站点主域名与镜像域名**：
  - **自定义主域名**：`https://52etf.net/`
  - **GitHub Pages 镜像**：`https://jstdlee.github.io/52etf/`
  - **GitHub 校准仓库**：<https://github.com/jstdlee/52etf>
- **Cloudflare Agent 规范端点 (Markdown for Agents & Content Signals)**：
  - **Content-Signal 声明**：`search=yes, ai-input=yes, ai-train=no`（允许搜索引擎索引、允许 RAG/AI 搜索与 Agent 工具调用、禁止基底模型预训练）
  - **全站单次请求完整 Markdown 语料库 (`/llms-full.txt`)**：`https://52etf.net/llms-full.txt`（1 次 HTTP 请求获取全部 25 个经济/金融/Crypto/地产指标正文、公式与外链）
  - **精简目录索引 (`/llms.txt`)**：`https://52etf.net/llms.txt`
  - **结构化 JSON 全量索引 (`/index.json`)**：`https://52etf.net/index.json`（含全部分类、指标元数据、`stale_over_6m` 状态与 `raw_markdown`）
  - **每页原生 Markdown 孪生页 (`/*/index.md`)**：任意页面 URL 后追加 `index.md`（如 `/index.md`、`/05-crypto/index.md`、`/05-crypto/hyperliquid-onchain-long-short-oi-funding/index.md`），并在 HTML `<head>` 内通过 `<link rel="alternate" type="text/markdown">` 暴露
  - **异常与超期 (>180天) 链接核实报告 (`/404.txt`)**：<https://jstdlee.github.io/52etf/404.txt>
- **MCP 与 A2A 发现清单 & 浏览器 WebMCP (`navigator.modelContext`)**：
  - **MCP 服务描述 (`/.well-known/mcp.json`)**：`https://52etf.net/.well-known/mcp.json`
  - **A2A Agent Card (`/.well-known/agent.json`)**：`https://52etf.net/.well-known/agent.json`
  - **浏览器 WebMCP 已注册工具 (`window.MCP_TOOLS` & `navigator.modelContext`)**：
    1. `search_indicators({ query, category, tag, include_stale })`
    2. `get_indicator_detail({ slug_or_url })`
    3. `get_stale_or_broken_links()`
    4. `list_categories()`
