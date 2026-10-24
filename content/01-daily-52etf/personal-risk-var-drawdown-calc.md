---
title: "个人风险管理：最大回撤(MaxDD)与参数法VaR/CVaR公式页"
date: 2026-10-22T09:40:00+08:00
lastmod: 2026-10-22T09:40:00+08:00
keywords: ["个人风险管理", "VaR", "CVaR", "最大回撤", "压力测试"]
ext_url: "https://www.portfoliovisualizer.com/monte-carlo-simulation"
backup_url: "https://fred.stlouisfed.org/series/VIXCLS"
summary: "95%/99%置信度日度与月度在险价值(VaR)及历史最大回撤数学检验公式"
---
纯无状态风险度量公式（不记录任何个人资金规模）：

- 参数法日度 VaR (99%)：VaR_99 = Z_0.99 * sigma_daily = 2.326 * (sigma_annual / sqrt(252))
- 历史最大回撤 (Max Drawdown)：MaxDD = max_{t in (0,T)} [ (Peak_t - NAV_t) / Peak_t ]
- 波动率参考源（CBOE VIX）：https://fred.stlouisfed.org/series/VIXCLS
