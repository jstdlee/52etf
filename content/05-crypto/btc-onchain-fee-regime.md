---
title: "BTC 链上手续费异常与费率 Z-Score (On-Chain Fee Regime & Z-Score)"
date: 2026-10-25T16:00:00+08:00
lastmod: 2026-10-25T16:00:00+08:00
tags: ["Crypto", "BTC", "链上手续费", "Fee Z-Score", "矿工收入", "区块空间"]
keywords: ["Crypto", "BTC", "Bitcoin Transaction Fee", "Fee Revenue Z-Score", "Ordinals", "Runes", "链上手续费"]
ext_url: "https://charts.checkonchain.com/btconchain/adoption/feerevenue_zscore/feerevenue_zscore_light.html"
backup_url: "https://charts.checkonchain.com/btconchain/adoption/feestotal_btc/feestotal_btc_light.html"
summary: "公式: Fee Share = Fees / (Subsidy + Fees) | Fee Revenue 2Y Z-Score | 结构性分界: 2018-2022现货拥堵拐点 vs 2023后铭文/符文脉冲与现货ETF链下分流"
---

### BTC 链上手续费异常指标（Fee Regime & Z-Score）计算公式与 2023 年后结构性变迁

- **核心统计指标与计算公式**：
  - **矿工手续费收入占比 (Fee Share of Miner Revenue)**：
    - `Fee Share (%) = Daily Transaction Fees (BTC) / [Daily Block Subsidy (BTC) + Daily Transaction Fees (BTC)]`
  - **手续费收入 Z-Score (Fee Revenue Z-Score, Checkonchain)**：
    - `Fee Z-Score = (当前链上手续费 - 2年滚动均值) / 2年滚动标准差`
    - 当 `Z-Score > +2.0` 时表征区块空间需求出现显著正偏态异常（拥堵脉冲）；当 `Z-Score < -0.5` 时表征链上结算需求清淡。
  - **大额手续费分档统计 (Dune `Bitcoin Big Fee`)**：
    - 按单笔交易费率/金额分档（`>100`、`>200`、`>300`、`>400`）统计高优交易在全网交易中的占比变化。
- **历史有效性核实与 2023–2026 年结构性失真辨析**：
  - **1. 2018–2022 年（纯货币转账主导期 —— 高度相关）**：
    - 在此阶段，比特币区块空间几乎完全用于 BTC 现货转账与交易所充提。每当出现趋势加速、恐慌抛售或牛市见顶（如 2019 年 5–8 月反弹、2020 年 10 月主升浪启动、2021 年 4 月高点），链上争夺区块确认会导致手续费脉冲式飙升，手续费异常与大级别价格拐点吻合度较高。
  - **2. 2023–2024 年（Ordinals 铭文 / BRC-20 / Runes 符文导致的非金融脉冲失真）**：
    - 2023 年 5 月（BRC-20 铸造潮）、2023 年 11–12 月（Ordinals 铭文热潮）以及 2024 年 4 月减半区块（Runes 符文上线）出现了历史极值级别的链上手续费飙升。此类异常源于**非金融数据写入（Data Inscriptions）抢占区块权重**，而非传统的 BTC 现货趋势见顶或主升浪换手。
  - **3. 2024–2026 年（现货 ETF 与托管中心化导致的“高币价、低费率”背离）**：
    - 自 2024 年 1 月美国比特币现货 ETF 上市后，大量机构与散户交易量迁移至美股 ETF 二级市场及中心化交易所内部账本撮合，叠加交易所批量打包（Batching）与闪电网络普及，导致 2024 下半年至 2026 年即使 BTC 价格处于高位区间，链上基础转账费率仍长期处于历史低位（`1–5 sat/vB`）。因此，**在当前市场结构下，链上手续费异常需剔除铭文/符文噪音并结合现货 ETF 成交量共同研判，不可单独作为牛熊顶底的充要条件**。
- **已验证可用数据源直达连接 (HTTP 200)**：
  - Checkonchain 比特币手续费收入 Z-Score 实时图表：<https://charts.checkonchain.com/btconchain/adoption/feerevenue_zscore/feerevenue_zscore_light.html>
  - Checkonchain 比特币每日链上总手续费 (BTC)：<https://charts.checkonchain.com/btconchain/adoption/feestotal_btc/feestotal_btc_light.html>
  - Dune Analytics 比特币大额手续费年度分布面板 (`@marx27`)：<https://dune.com/marx27/bitcion-transaction-fee>
