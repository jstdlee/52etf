---
title: "多资产基准权重偏离度与再平衡阈值数学模板"
date: 2026-10-23T20:00:00+08:00
lastmod: 2026-10-23T20:00:00+08:00
keywords: ["建议持仓框架", "再平衡阈值", "风险平价", "等权模型", "纯数学模板"]
ext_url: "https://www.portfoliovisualizer.com/asset-correlations"
backup_url: "https://52etf.net/llms.txt"
summary: "等权/60-40/波动率倒数加权理论偏离阈值(±5%绝对/±15%相对带宽)纯计算公式"
---
声明：本页仅为公开资产配置数学公式记录，不含任何个人持仓数据、账户金额或具体标的推荐。

1. 相对偏离度触发公式：
   Drift_i = |w_i(t) - w_i(target)| / w_i(target)
   当 Drift_i > 0.15（即相对偏离超 15%）或绝对偏离 |w_i(t) - w_i(target)| > 0.05 时标记触发再平衡。

2. 波动率倒数权重计算（Inverse Volatility Weighting）：
   w_i = (1 / sigma_i) / sum_j(1 / sigma_j)
   其中 sigma_i 为过去 60 / 252 个交易日年化历史波动率。
