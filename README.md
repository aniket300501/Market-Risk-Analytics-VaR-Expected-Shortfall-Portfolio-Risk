# Market Risk Analytics VaR-Expected Shortfall Portfolio Risk

This project is designed to mirror the **day‑to‑day analytical responsibilities of a Market Risk function within a global investment bank**, with direct alignment to roles in a **Risk Division** responsible for independent oversight, risk appetite monitoring, and regulatory compliance.

The analysis focuses on **market risk measurement, interpretation, and communication** using a suite of industry‑standard risk metrics including **Value at Risk (VaR), Expected Shortfall (ES), volatility‑adjusted models, and portfolio‑level risk analysis**. The project explicitly evaluates **risk behaviour during stressed market conditions (COVID‑19)** and connects quantitative outputs to **risk management actions and escalation decisions**.

## Key Results & Insights

* Volatility-adjusted and heavy-tailed models consistently produced higher and more realistic tail-risk estimates than basic parametric VaR, highlighting material model risk from normality and constant-volatility assumptions.

* During the COVID-19 stress period, Expected Shortfall increased disproportionately relative to VaR, demonstrating that VaR alone understates extreme downside risk.

* Portfolio diversification reduced VaR marginally; however, Expected Shortfall remained elevated due to high cross-asset correlation, indicating persistent systemic tail risk.

* Results reinforce the importance of Expected Shortfall, stress awareness, and volatility regime analysis for risk appetite monitoring and escalation to senior management.


## Key Portfolio Findings

* VaR marginally reduces due to diversification
* ES remains elevated due to **correlated tail risk**
* Diversification benefits diminish in systemic stress events
  
---

## Objectives

* Review and challenge market risk exposure using **VaR and ES** across multiple methodologies
* Assess the impact of **volatility regimes and tail risk** on capital and risk appetite
* Analyse **portfolio‑level risk** and diversification under high correlation
* Identify **model limitations and emerging risks** during market stress
* Translate quantitative risk measures into **clear insights for senior stakeholders**

---

##  Data & Instruments

* **Assets**:

  * MetLife Inc. (MET)
  * Prudential Financial Inc. (PRU)
* **Sector**: Insurance / Financial Services
* **Market**: NYSE
* **Frequency**: Daily
* **Period**: Feb 2018 – Feb 2023 (includes COVID stress period)
* **Data Source**: Yahoo Finance

Daily **log returns** are used to align with market risk desk conventions and risk factor modelling.

---

##  Risk Measures & Methodologies

### Core Risk Metrics

* **Value at Risk (VaR – 95%)**: Quantile‑based loss estimate
* **Expected Shortfall (ES – 95%)**: Average tail loss beyond VaR

These measures are consistent with **internal risk management frameworks and regulatory expectations (Basel III / FRTB)**.

---

### VaR & ES Models Implemented

#### 1. Historical Simulation

* Non‑parametric
* Captures fat tails and realised stress events
* Used as a benchmark risk measure

#### 2. Age‑Weighted Historical Simulation

* Higher weights on recent observations
* More responsive to changing volatility regimes
* Useful for **emerging risk identification**

#### 3. Parametric VaR (Normal)

* Implemented with:

  * Constant volatility
  * Volatility adjustment (time‑varying)
* Highlights **model risk from static assumptions**

#### 4. Hull–White Style Volatility Approach

* Incorporates stochastic volatility dynamics
* Better tail behaviour under stressed conditions

---

## Single‑Asset Risk Review (MetLife)

* VaR and ES estimates are compared across all models
* COVID‑19 period shows significant volatility clustering and tail losses
* Volatility‑adjusted models produce **more conservative and realistic tail risk estimates**

**Risk Insight:**

> Static volatility assumptions materially underestimate risk during stress periods, leading to delayed escalation and insufficient capital buffers.

---

##  Portfolio‑Level Risk Analysis

* Equal‑weighted portfolio (MET & PRU)
* Observed correlation ≈ **0.93**, indicating significant co‑movement


**Risk Interpretation:**

> Portfolio‑level VaR can improve while tail risk remains high, reinforcing the need for ES‑based monitoring and stress testing.

---

##  Model Risk, Controls & Governance Considerations

* Normality and IID assumptions fail during stress
* VaR alone is insufficient for tail risk governance
* Volatility clustering necessitates dynamic risk models
* High correlation creates hidden concentration risk

This analysis reflects a **control mindset**, emphasising model validation, limitations, and escalation triggers.

---

##  Risk Management & Escalation Implications

* Supports **risk appetite monitoring** and limit calibration
* Highlights scenarios requiring **risk escalation to senior management**
* Reinforces need for:

  * Stress testing
  * Scenario analysis
  * Cross‑asset diversification

---

##  Disclaimer

This project is for **educational and demonstration purposes only** and does not constitute investment advice.
