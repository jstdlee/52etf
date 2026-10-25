---
title: "BTC RHODL 比率 (Realized HODL Ratio 短期与中长期已实现价值比)"
date: 2026-10-25T16:00:00+08:00
lastmod: 2026-10-25T16:00:00+08:00
tags: ["Crypto", "BTC", "RHODL", "HODL Waves", "链上周期", "已实现价值"]
keywords: ["Crypto", "BTC", "RHODL", "Realized HODL Ratio", "HODL Waves", "链上周期"]
ext_url: "https://www.bitcoinmagazinepro.com/charts/rhodl-ratio/"
backup_url: "https://charts.bgeometrics.com/rhodl_1m_dark.html"
summary: "公式: (1周Realized Cap HODL Wave / 1-2年Realized Cap HODL Wave) × 市场天数 | 阈值: <350历史积累区 / >50,000周期过热区 | 减半周期6~9个月横盘特征"
---

### BTC RHODL 比率 (Realized HODL Ratio) 数学定义、口径核实与周期区间

- **核心数学公式（Philip Swift / LookIntoBitcoin 提出）**：
  - `RHODL Ratio = (RHODL Wave [1 Week] / RHODL Wave [1–2 Years]) × Market Age (Days)`
  - 其中 `RHODL Wave` 为 **已实现市值权重波段（Realized Cap HODL Waves）**，即按每个链上 UTXO 最后一次移动时的美元价格加权计算的价值占比；`Market Age` 为自 2010 年比特币产生连续价格记录以来的存续天数。
- **关键口径核实（已实现价值 vs. 原始持币数量）**：
  - **已实现价值加权（USD）而非原始币量（BTC）**：部分中文研报将其简述为“链上持币 1 周 BTC 数量与持币 1–2 年 BTC 数量之比”，属于通俗近似；严格公式对比的是 `1 周内移动筹码的已实现美元价值占比` 与 `1–2 年移动筹码的已实现美元价值占比`。由于短期活跃筹码按当前市价计价，而 1–2 年筹码按历史沉淀均价计价，已实现价值加权能显著放大周期顶部短期投机资金涌入的信号。
  - **市场天数（Market Age）校准因子**：随时间推移，早期永久丢失的 BTC（Lost Coins）与减半后通胀率下降会导致长期持币分母结构性偏大、原始比值峰值逐周期衰减；乘以 `Market Age (Days)` 用于拉平跨周期极值水位。
- **历史周期参考区间与减半横盘特征**：
  - `RHODL Ratio < 350`（绿色积累带）：短期链上换手价值相对于 1–2 年沉淀筹码处于极低水平，对应历史宏观周期底部区间。
  - `RHODL Ratio > 50,000`（红色过热带）：1 周内高价换手资金占比相对 1–2 年长期筹码极度膨胀，对应 2013、2017、2021 等历史周期顶部区域。
  - **减半周期横盘特征**：历史三轮减半前后（2016 年约 6 个月、2020 年约 9 个月、2024 年 3 月至 10 月约 8 个月），RHODL 指标均出现中枢横盘震荡，反映短期筹码与中长期筹码在减半换手期的再平衡。
- **已验证可用数据源直达连接 (HTTP 200)**：
  - Bitcoin Magazine Pro (LookIntoBitcoin) RHODL Ratio 官方图表：<https://www.bitcoinmagazinepro.com/charts/rhodl-ratio/>
  - BGeometrics RHODL 比率交互图表：<https://charts.bgeometrics.com/rhodl_1m_dark.html>
  - BGeometrics Realized Cap HODL Waves 分层图表：<https://charts.bgeometrics.com/hodl_waves_realized_cap_dark.html>
  - CoinGlass RHODL Ratio 中文图表：<https://www.coinglass.com/zh/pro/i/r-hodl-ratio>
