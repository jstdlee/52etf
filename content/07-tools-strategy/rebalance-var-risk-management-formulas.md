---
title: "跨资产再平衡阈值矩阵、最大回撤(MaxDD)与参数法VaR/流动性覆盖率(LCR)数学公式"
date: 2026-10-25T10:00:00+08:00
lastmod: 2026-10-25T10:00:00+08:00
tags: ["策略工具", "再平衡阈值", "VaR", "最大回撤", "风险管理"]
keywords: ["策略工具", "再平衡阈值", "VaR", "最大回撤", "风险管理"]
ext_url: "https://www.portfoliovisualizer.com/asset-correlations"
backup_url: "https://www.portfoliovisualizer.com/monte-carlo-simulation"
summary: "5/25再平衡带宽法则 | 95%/99%参数法VaR = μ×√T - Z×σ×√T | 应急流动性覆盖率 LCR = 高流动短债货币 / 12个月支出"
---

### 风险管理与跨周期再平衡纯数学模型（不含任何个人持仓数据）

1. **再平衡偏离度触发公式 (5/25 Rule)**：
   - 绝对偏离：`Δw_i = |w_i(t) - w_i^*| >= 5%`
   - 相对偏离：`δw_i = |w_i(t) - w_i^*| / w_i^* >= 25%`
2. **参数法在险价值 (Parametric VaR) 与最大回撤 (MaxDD)**：
   - `VaR_(α, T) = |μ_d × T - Z_α × σ_d × √T|`（`Z_0.95 = 1.645`，`Z_0.99 = 2.326`）
   - `MaxDD = max((Peak_t - Trough_t) / Peak_t)`，恢复所需涨幅 `R = MaxDD / (1 - MaxDD)`
3. **流动性覆盖率 (LCR)**：
   - `LCR = T+1可无损变现高流动性资产 ÷ 未来12个月基准支出总额`
