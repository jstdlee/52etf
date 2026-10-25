---
title: "BTC MVRV Z-Score 与 CBBI / BTI 周期复合指标 (MVRV & Composite Cycle Index)"
date: 2026-10-25T16:00:00+08:00
lastmod: 2026-10-25T16:00:00+08:00
tags: ["Crypto", "BTC", "MVRV", "CBBI", "CVDD", "NUPL", "Puell Multiple", "Pi Cycle"]
keywords: ["Crypto", "BTC", "MVRV", "MVRV Z-Score", "CBBI", "BTI", "CVDD", "NUPL", "Puell Multiple"]
ext_url: "https://charts.checkonchain.com/btconchain/unrealised/mvrv_all/mvrv_all_light.html"
backup_url: "https://colintalkscrypto.com/cbbi/"
summary: "MVRV = Market Cap / Realized Cap | MVRV小牛顶经验位 2.2~2.3 / 大底 <1.0 | CBBI 9因子公开复合指数 (0~100分) 与 12因子周期复合指标拆解"
---

### BTC MVRV、周期包络拟合核实与 CBBI / 12 因子复合指标拆解

- **MVRV 与 MVRV Z-Score 标准计算公式（Murad Mahmudov & David Puell, 2018）**：
  - `MVRV Ratio = Market Cap (流通总市值) / Realized Cap (已实现总市值)`
  - `MVRV Z-Score = (Market Cap - Realized Cap) / StdDev(Market Cap)`
  - **Realized Cap 口径说明**：按链上每个 UTXO **最后一次发生链上转移时的价格**加权计算总价值，作为全市场链上持仓总成本的近似代理（不含中心化交易所内部撮合换手，但包含交易所充提与冷钱包划转）。
  - **历史经验分位**：
    - `MVRV < 1.0`（或 `MVRV Z-Score < 0`）：流通市值跌破链上已实现总成本，对应历史宏观熊市底部区。
    - `MVRV ≈ 2.2 ~ 2.3`：对应历史上减半前/复苏期阶段性高点（2012、2016、2019、2024 年一季度）。
    - `MVRV > 3.5`（或 `MVRV Z-Score > 7.0`，随周期边际衰减）：历史大周期顶部过热区。
- **MVRV 大周期包络线函数拟合的数学核实**：
  - 针对链上研究中常见的周期顶底双曲线拟合（以创世以来天数 `x` 为自变量，上轨采用负指数衰减 `y_top = 3.41075 + 4.43171 × e^(-0.00060602x)`，下轨采用对数函数 `y_bottom = -0.55448 + 0.161056 × ln(x)`）：
  - **数学性质纠偏**：
    1. 上轨并非发散的 `e^x`，而是**负指数衰减函数** `a + b·e^(-cx)`，当 `x → ∞` 时收敛于水平渐近线 `y = a`（如 `3.41`）。
    2. 下轨对数函数 `ln(x)` 在 `x → ∞` 时单调递增趋向 `+∞`（**在数学上无上界、不收敛**），因此常数渐近上轨与对数递增下轨在长期**必然相交**，并非“无限收敛不相交函数”。
    3. 比特币历史仅有 3–4 个完整减半周期大顶，用 3 参数非线性方程拟合 4 个极值点属于经验包络参考，若未来周期峰值 MVRV 低于渐近常数 `3.41`，固定渐近线将失效。
- **CBBI (ColinTalksCrypto Bitcoin Bull Run Index) 与 12 因子复合指标对比**：
  - **CBBI 公开 9 因子复合指数（0–100 分）**：等权整合 9 个公开链上与趋势指标：`Pi Cycle Top`、`RUPL/NUPL`、`RHODL Ratio`、`Puell Multiple`、`2-Year MA`、`Bitcoin Trolololo Trend Line`、`MVRV Z-Score`、`Reserve Risk`、`Woobull Top Cap vs CVDD`。通常 `< 15` 为周期底部区间，`> 80~90` 为周期顶部预警区。
  - **社区 12 因子复合脚本（如 TradingView 私有指标 BTI，0–12 分）子因子完整还原**：
    1. `CVDD`：Cumulative Value Coin Days Destroyed（累计销毁币天价值）
    2. `NUPL`：Net Unrealized Profit/Loss（净未实现盈亏比）
    3. `MVRVZ`：MVRV Z-Score
    4. `PUELL`：Puell Multiple（矿工日发行价值 / 365日均值，常见笔误写为 `PURLL`）
    5. `CSI`：Calendar Seasonality Index（日历季节性指数）
    6. `HSI`：Halving Seasonality Index（减半周期季节性指数）
    7. `PLR`：Polylog Regression（多对数回归通道，常被文本摘要漏列）
    8. `RP`：Realized Price Ratio（市价与已实现价格偏离度）
    9. `PDM`：Price Decay / Distribution Model（价格衰减分布模型）
    10. `LMACD`：Logarithmic MACD（对数坐标 MACD）
    11. `PCT`：Pi Cycle Top Indicator（111DMA 与 350DMA×2）
    12. `TFS`：Trend Following System / Top Signal（趋势跟踪信号）
- **已验证可用数据源直达连接 (HTTP 200)**：
  - Checkonchain MVRV 全周期图表：<https://charts.checkonchain.com/btconchain/unrealised/mvrv_all/mvrv_all_light.html>
  - CBBI 官方 9 因子复合指数面板：<https://colintalkscrypto.com/cbbi/>
  - BGeometrics MVRV Ratio 图表：<https://charts.bgeometrics.com/mvrv_ratio_dark.html>
  - BGeometrics MVRV Z-Score 图表：<https://charts.bgeometrics.com/mvrv_dark.html>
  - CoinGlass CBBI 中文面板：<https://www.coinglass.com/zh/pro/i/cbbi-index>
  - Bitcoin Magazine Pro 子指标（CVDD / Puell / Pi Cycle）：<https://www.bitcoinmagazinepro.com/charts/cvdd/> | <https://www.bitcoinmagazinepro.com/charts/puell-multiple/> | <https://www.bitcoinmagazinepro.com/charts/pi-cycle-top-indicator/>
