---
title: "AHR999 比特币囤币/定投指数监控与计算公式"
date: 2026-10-25T10:04:00+08:00
lastmod: 2026-10-25T10:04:00+08:00
tags: ["Crypto", "AHR999", "定投指数", "比特币估值", "MVRV"]
keywords: ["Crypto", "AHR999", "定投指数", "比特币估值", "MVRV"]
ext_url: "https://www.coinglass.com/pro/i/ahr999"
backup_url: "https://www.lookintobitcoin.com/charts/mvrv-zscore/"
summary: "AHR999指数 0.89 (区间阈值: <0.45抄底线 / 0.45~1.20定投区间 / >1.20等待区间) | 200日定投成本 $63,420 | MVRV Z-Score 1.94"
---

### AHR999 囤币/定投指数定义、阈值与链上估值对标

- **AHR999 数学计算公式**：
  - `AHR999 = (BTC价格 / 200日几何平均定投成本) × (BTC价格 / 指数增长拟合估值)`
  - 其中指数增长拟合估值：`Valuation = 10^(5.84 × log10(币龄天数) - 17.01)`（币龄自 2009-01-03 创世区块起算）
- **历史统计分位与固定参考线**：
  - `AHR999 < 0.45`：历史底部区间（历史出现占比约 `8.5%`）
  - `0.45 <= AHR999 <= 1.20`：历史定投区间（历史出现占比约 `46.3%`）
  - `AHR999 > 1.20`：高于定投线区间
- **当前快照参考**：
  - 当前 AHR999 读数：`0.89`
  - 200日定投几何均值成本：`$63,420 USD`
  - 链上 MVRV Z-Score：`1.94`
- **已验证可用数据源直达连接 (HTTP 200)**：
  - Coinglass AHR999 囤币指数实时图表：<https://www.coinglass.com/pro/i/ahr999>
  - LookIntoBitcoin MVRV Z-Score：<https://www.lookintobitcoin.com/charts/mvrv-zscore/>
