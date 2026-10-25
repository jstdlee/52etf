---
title: "52etf.net 自动化链接核实 (check-links.mjs -> 404.txt) 与 WebMCP / Agent 接口规范"
date: 2026-10-25T10:00:00+08:00
lastmod: 2026-10-25T10:00:00+08:00
tags: ["WebMCP", "404.txt", "Agent校准", "llms.txt", "sitemap"]
keywords: ["WebMCP", "404.txt", "Agent校准", "llms.txt", "sitemap"]
ext_url: "https://jstdlee.github.io/52etf/404.txt"
backup_url: "https://jstdlee.github.io/52etf/llms.txt"
summary: "CI自动运行 scripts/check-links.mjs 巡检全部外链并提交至 /404.txt | 提供 /llms.txt、/index.json、/sitemap.xml 供Agent单次读取"
---

### 自动化外链有效性核实 (`scripts/check-links.mjs` -> `404.txt`) 与 Agent 接口

- **机器可读端点清单**：
  - **异常与超期链接清单 (`/404.txt`)**：每次 GitHub Actions CI 运行时由 `node scripts/check-links.mjs` 自动扫描 `content/**/*.md` 中的所有外部链接，将失效链接（404/410/DNS错误/超时）及超 6 个月未更新条目写入仓库根目录 `404.txt` 与站点 `/404.txt`。
  - **纯文本全量索引 (`/llms.txt`)**：适合外部 LLM / Agent 单次请求读取全站指标摘要。
  - **JSON 结构化索引 (`/index.json`)**：提供前端模糊搜索与程序化字段解析。
  - **Sitemap (`/sitemap.xml`)**：标准搜索引擎与爬虫站点地图。
