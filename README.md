# 📊 Fintech Transaction Analysis

A data analytics portfolio project simulating a real-world fintech business scenario.
This project analyzes financial transaction data to answer 4 strategic business questions
that directly impact revenue, retention, and growth.

---

## 🏢 Business Context

In the financial industry, data is the foundation of every strategic decision.
Fintechs operate in a highly competitive environment where retaining customers,
managing risk, and optimizing revenue are not optional — they are survival requirements.

This project was built to answer a fundamental question:

> *"What is our transaction data telling us that we are not yet acting on?"*

Using a financial transactions dataset structured in a star schema, I applied
analytical thinking to four critical business problems that any fintech faces:

- **Customers leave silently** — churn is only noticed after the revenue is already gone
- **Fraud grows with volume** — as transactions scale, so does the exposure to abnormal patterns
- **Revenue is concentrated** — a small portion of products and customers drive most of the business
- **Cross-sell is underexplored** — customers using multiple products generate significantly more value

The goal of this project is not just to explore data — it is to simulate the
analytical process a Data Analyst would follow inside a real fintech to
**turn transactional data into decisions**.

---

## ❓ Business Problems

| # | Problem | Business Impact |
|---|---------|----------------|
| 1 | **Customer Churn** | Identify customers at risk of leaving before they do |
| 2 | **Fraud Detection** | Flag abnormal transaction patterns |
| 3 | **Cross-sell Opportunities** | Do customers with more products generate more value? |
| 4 | **Product Pareto** | Which 20% of products generate 80% of revenue? |

---

## 🗂️ Dataset

Source: [FinTech Financial Transactions — Kaggle](https://www.kaggle.com/datasets/saidaminsaidaxmadov/financial-transactions)

Star schema with 1 fact table and 5 dimension tables:

| Table | Type | Description |
|-------|------|-------------|
| `FactTransaction` | Fact | All financial transactions |
| `DimCustomer` | Dimension | Customer demographic data |
| `DimAccount` | Dimension | Account types and balances |
| `DimProduct` | Dimension | Product catalog |
| `DimProductCategory` | Dimension | Product categories |
| `DimProductSubCategory` | Dimension | Product subcategories |

---

## 🛠️ Tools & Stack

- **PostgreSQL** — data storage, transformation and views
- **Power BI** — dashboards and data visualization
- **GitHub** — version control and documentation

- ---

## 🔍 Key Findings

### 1. Customer Churn

**Key Findings**
- **Churn Rate:** 6% of the customer base has already churned
- **32%** of the base is at some level of risk — At Risk, Inactive or Churned
- **50%** of churned customers had a **Suspended** account status
- No significant demographic pattern (age, gender, region) was found among churned customers

**Recommendations & Next Steps:**
- Investigate the reasons behind account suspensions with the operations team —
this information is not available in the dataset but is critical to understanding
the root cause of churn
- Immediately monitor the 3 customers classified as **At Risk with Suspended accounts** —
this profile has the highest churn probability based on the data
- Build a retention workflow prioritizing the **21 At Risk customers** before
they migrate to Inactive or Churned
- In a real-world scenario, cross-reference this data with **CAC (Customer Acquisition Cost)**
to quantify the financial impact of churn on the business

### 2. Fraud Detection

**Methodology: Z-Score Analysis**
To detect potentially fraudulent transactions, a **Z-Score** (standard score) approach
was applied at the individual customer level. Rather than comparing transactions against
a global average, each transaction was evaluated against the customer's own historical
mean and standard deviation — making the model sensitive to each customer's personal
behavior pattern.

Transactions were classified into 4 risk levels based on their absolute Z-Score:

| Risk Level | Z-Score Range | Description |
|------------|--------------|-------------|
| Normal | < 1 | Within expected behavior |
| Unusual | 1 — 2 | Slightly outside the pattern |
| Anomalous | 2 — 3 | Significant deviation — requires investigation |
| High Risk | > 3 | Severe deviation — immediate action required |

**Key Findings**
- **2 transactions** classified as **High Risk** — both with the exact same amount of $10,000,
belonging to different customers, which is highly suspicious
- **56 transactions** classified as **Anomalous** — deviating more than 2 standard deviations
from each customer's historical average
- **Aaron Taylor Jr.**, **David Fischer** and **Rachel Dawson** are the most critical cases —
all with **4 anomalous transactions** each
- **Suspended accounts concentrate the highest reincidence** — 50% of customers
with 3 or more anomalous transactions have a Suspended account status
- The majority of anomalous transactions carry **large negative values** near -$5,000,
suggesting a systematic pattern of abnormal outflows

**Recommendations & Next Steps:**
- Proactively block and immediately investigate the 2 **High Risk** transactions of $10,000 
- Prioritize investigation of **Aaron Taylor Jr.**, **David Fischer** and **Rachel Dawson**

### 3. Cross-sell Opportunities
> 🔄 In progress

### 4. Product Pareto
> 🔄 In progress

---

## 👤 Author

**Alexandre Gomez Martins**  
[LinkedIn](https://www.linkedin.com/in/alexandregomezm/)
