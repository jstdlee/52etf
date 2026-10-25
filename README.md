# 52etf.net — 宏观经济、能源粮食、国债外汇、房地产、Crypto与权益多空指标缓存仓库

- **在线站点 (GitHub Pages)**：<https://jstdlee.github.io/52etf/>
- **异常与超期链接巡检报告 (`404.txt`)**：<https://jstdlee.github.io/52etf/404.txt>
- **LLMs 纯文本全量索引 (`llms.txt`)**：<https://jstdlee.github.io/52etf/llms.txt>
- **JSON 结构化索引 (`index.json`)**：<https://jstdlee.github.io/52etf/index.json>
- **页面视觉风格**：对齐 <https://jstdlee.github.io/blog/> 极简等宽字体 (`ui-monospace`, `72ch`) 风格。

---

## 1. 核心设计原则与纪律

1. **纯客观数据与有效连接呈现**：不做任何行情评论与主观解读，不提供任何投资建议，**绝不透露或暗示任何个人资产与持仓信息**。
2. **剔除日频噪音，聚焦中观/宏观周期与结构数据**：
   - `01-macro-money`：中美货币存量对比（中国 M1/M2/社融存量 vs 美国 M2/美联储资产负债表 `WALCL`）、中美 CPI/PCE/PPI 通胀指数、制造业/服务业 PMI 与非农周期、全球航运指数 (BDI/SCFI)。
   - `02-commodities-cpi`：全球能源指数（WTI/Brent 原油、Henry Hub 天然气、S&P GSCI 能源指数、EIA 库存）、全球粮食指数（联合国 FAO 食品与谷物价格指数、CBOT 大豆/玉米/小麦、USDA 供需库存消费比）、金油比/铜金比与盈亏平衡通胀率。
   - `03-bonds-fx`：人民币短期债比例监控（1Y 以内短债占比、同业存单 NCD 占比、DR007）、中美国债收益率曲线与 TIPS 实际利率、外汇（USD/CNY 中间价、USD/CNH 离岸掉期点、美元指数 DXY、日元套息指标）。
   - `04-realestate`：中国房产是否见底核心观测（**居民住户贷款环比增量 vs 18 万亿银行信贷规模对比**：过去火爆年代月增 5000 亿~1 万亿+ RMB vs 过去 8 个月累积未达 3000 亿 RMB，主链接 `http://t.cn/AXh6wnlO`）、70 城房价与一线城市租售比 vs 5Y LPR、美国房地产数据（Case-Shiller 房价指数、30Y 固定房贷利率、成屋销售与新屋开工）。
   - `05-crypto`：**Crypto 专题** —— **Hyperliquid 链上多空数据**（巨鲸多空比、全网未平仓合约 OI、资金费率、HLP 金库敞口）、**美国现货 BTC/ETH ETF 资金流入流出**（IBIT/FBTC/ETHA 累计净流入与持仓占比）、**ETH/BTC 汇率比例与 BTC.D 市占率**、**AHR999 囤币/定投指数**、全网稳定币总市值（USDT/USDC）。
   - `06-equity-tsla-spcx`：**Tesla (`TSLA`) 与 SpaceX (`SPCX`/`DXYZ`) 多空持仓数据**（TSLA 空头持仓比例 Short Interest、期权 Put/Call OI 比、SpaceX 一级半估值与公开载体折溢价）、A/港/美宽基指数 PB/PE 十年分位、中美基金经理季报与 SEC 13F 机构持仓穿透。
   - `07-tools-strategy`：再平衡阈值矩阵、VaR/最大回撤公式、WebMCP 与 `404.txt` 自动巡检说明。
3. **超 6 个月未更新自动标红 (`> 180 days`)**：
   - 构建期与前端运行时双重校验 `Lastmod`，超过 180 天未更新的条目整行以红色 (`.stale`) 高亮显示。
4. **CI 自动巡检链接并写入 `404.txt`**：
   - 每次 GitHub Actions 构建或定时任务运行 `node scripts/check-links.mjs`，自动扫描 `content/**/*.md` 的全部主/备链接并检测超期条目，将结果输出并提交至仓库根目录 `404.txt` 及静态产物 `/404.txt`，供外部 Agent 一键读取校准。

---

## 2. 外部 Agent 校准工作流

1. 读取 `https://jstdlee.github.io/52etf/404.txt` 获取当前失效/超时连接（`SECTION 1`）与超过 6 个月未更新的指标文件（`SECTION 2`）。
2. 修改对应 `content/<section>/<slug>.md` 的 `ext_url`、`backup_url`、`summary` 与 `lastmod` 字段。
3. 运行 `node scripts/check-links.mjs && hugo --minify` 并提交推送到 `main` 分支。
