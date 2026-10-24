---
title: "波动率目标(Volatility Targeting)与等比网格步长计算公式页"
date: 2026-10-20T13:10:00+08:00
lastmod: 2026-10-20T13:10:00+08:00
keywords: ["策略工具", "波动率目标", "等比网格", "ATR步长", "数学模型"]
ext_url: "https://www.portfoliovisualizer.com/backtest-asset-class-allocation"
backup_url: "https://52etf.net/index.json"
summary: "根据历史年化波动率σ与14日ATR计算等比网格间距与目标波动率缩放系数"
---
纯数学参数生成公式（不含任何具体交易指令或实盘持仓）：

1. 目标波动率仓位缩放因子：
   Scale_t = min(L_max, sigma_target / sigma_realized_20d)
2. 等比网格价格序列：
   P_k = P_0 * (1 + g)^k,  k = -N, ..., -1, 0, 1, ..., N
