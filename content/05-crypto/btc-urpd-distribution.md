---
title: "BTC URPD 链上筹码价格分布 (UTXO Realized Price Distribution)"
date: 2026-10-25T16:00:00+08:00
lastmod: 2026-10-25T16:00:00+08:00
tags: ["Crypto", "BTC", "URPD", "UTXO", "筹码分布", "已实现价格"]
keywords: ["Crypto", "BTC", "URPD", "UTXO Realized Price Distribution", "链上筹码分布", "Entity-Adjusted URPD"]
ext_url: "https://charts.bgeometrics.com/distribution_realized_price_dark.html"
backup_url: "https://docs.google.com/spreadsheets/d/1E9awSVwrVOxKOiaMdYT5YZvfveeFd9ENU-iO6dVcGj0/edit?usp=sharing"
summary: "统计流通BTC最后一次链上移动对应的价格桶分布 | 核心区分: ATH-Partitioned (含交易所归集噪音) vs Entity-Adjusted (实体调整后真实换手成本区)"
---

### BTC URPD (UTXO 已实现价格分布) 统计口径与“巨量柱”噪音辨析

- **指标定义与坐标结构**：
  - **URPD (UTXO Realized Price Distribution)** 统计当前比特币网络中所有未花费交易输出（UTXO）在**最后一次发生链上移动时对应的市场价格区间分布**。
  - **横轴（X轴）**：UTXO 最后一次移动时的 BTC 美元价格分桶（Price Buckets）；**纵轴（Y轴）**：落在该价格桶内的 BTC 数量（枚）或占流通供应量比例（%）。
- **核心口径核实：`ATH-Partitioned URPD` vs. `Entity-Adjusted URPD`**：
  - **1. 原始按历史高点分区 (`URPD ATH-Partitioned`)**：
    - 将 `$0` 至当前历史最高价（ATH）等分为约 100 个价格桶，直接统计全部原始 UTXO。
    - **链上归集噪音（重要局限）**：当大型中心化交易所（如 Coinbase、Binance）或 ETF 托管机构在某一价格附近进行**冷热钱包整理、UTXO 合并或托管地址迁移**时，数十万枚存量 BTC 的“最后移动价格”会被瞬间重置为当日市价，在原始 URPD 图表上形成单桶超 50 万~70 万枚 BTC 的“巨量柱”。此类巨量柱大量包含非交易性质的内部划转，**不能直接等同于主力资金的真实建仓或派发成本**。
  - **2. 实体调整版 (`URPD Entity-Adjusted`)**：
    - 通过链上聚类算法识别同一实体（同一交易所、托管方或巨鲸实体）名下的关联地址群：同一实体内部的钱包划转**不重置**成本价，且同一实体的持仓按其加权平均成本（Average Cost Basis）计入对应价格桶。
    - **观测原则**：分析筹码密集换手区（High-Volume Nodes）、支撑带与派发结构时，必须结合 `Entity-Adjusted URPD` 剔除交易所冷钱包归集伪影。
  - **3. 价格分桶宽度效应（Bucket Width Effect）**：
    - 在 `ATH-Partitioned` 口径下，随着 BTC 创出新 ATH，每个价格桶跨越的美元宽度成比例扩大，单柱容纳的 BTC 绝对数量天然上升；跨周期对比时应优先观察**占流通量百分比（% of Supply）**而非固定 BTC 枚数阈值。
- **已验证可用数据源直达连接 (HTTP 200)**：
  - BGeometrics 实时链上已实现价格分布图 (Distribution of Realized Price)：<https://charts.bgeometrics.com/distribution_realized_price_dark.html>
  - Phyrex 链上 URPD 持仓价格区间每日变动统计表 (Google Sheets)：<https://docs.google.com/spreadsheets/d/1E9awSVwrVOxKOiaMdYT5YZvfveeFd9ENU-iO6dVcGj0/edit?usp=sharing>
  - Checkonchain 已实现价格与筹码成本分布套件：<https://charts.checkonchain.com/>
