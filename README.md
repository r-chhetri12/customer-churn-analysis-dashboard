
# Telecom Customer Churn Analysis (SQL + Python + Power BI)
This project analyzes telecom customer churn to understand **why customers are leaving** and which segments are at highest risk.  
I used **SQL for data cleaning**, **Python for statistical analysis**, and **Power BI for interactive visualisation**.
---

##  Tools Used

- **SQL** – data cleaning, handling missing values, basic aggregations  
- **Python (Pandas, SciPy, Matplotlib)** – EDA, feature engineering, churn rate calculation, chi-square tests  
- **Power BI** – interactive dashboard, KPI cards, drill-downs, tooltips and visuals  

---

##  Project Workflow

### 1. Data Cleaning – SQL
- Imported the raw telecom churn dataset into SQL.
- Performed **data type corrections**, removed/handled invalid values and duplicates.
- Filled or treated **null values** for important columns.
- **Standardize the data**
- Created cleaned tables that were then exported to **CSV** for Python and Power BI.
- [`Churn_Clean.sql`](Churn_Clean.sql) for codes for data cleaning.

### 2. Analysis – Python
Key steps in Python:
- Created **tenure buckets** and **age buckets** using `pd.cut`  
  - `tenure_bucket` (0–1, 1–6, 7–12, 13–24, 25–48, 49+ months)  
  - `age_bucket` (Under 30, 30–44, 45–59, 60+)
- Converted **Churn_Label** into a numeric **churn flag (1 = Churned, 0 = Active)**.
- Calculated:
  - Overall churn rate  
  - Churn rate by tenure, age, contract, internet type, and services  
  - Total revenue, revenue from churned customers, and % revenue lost
- Used **Chi-Square tests** (`chi2_contingency`) to check **association between categorical variables and churn**, for example:
  - Gender vs Churn  
  - Internet_Type vs Churn  
  - Tenure_Bucket vs Churn  
  - Streaming_TV vs Churn  
  - Churn_Category vs Churn  
  - Payment_Method vs Churn  
- Shown contingency tables.
These tests helped identify which factors are **statistically related** to churn.

### 3. Visualization – Power BI

Built an interactive **Churn Analysis Dashboard** with:

- KPI cards for:
  - **Total Customers**
  - **Active Customers**
  - **Churned Customers**
  - **Overall Churn Rate**
  - **Average Tenure**
  - **Lost Amount by Churn**
- Visuals:
  - **Churn Rate by Tenure**
  - **Churn Rate by Age**
  - **Churn Rate by Internet Type**
  - **Churn Rate by Contract**
  - **Churn Rate by Payment Method**
  - **Total Churn by Churn Category (pie chart)**
- **Tooltip on Churn Category** visual to show **detailed churn reasons** when hovering over segments.

---

##  Key Insights

- The overall **churn rate is 27% (1,869 customers)**, meaning about **1 in 4 customers leave**, making churn a critical business issue.
- Customers with a **tenure of 0–1 months have the highest churn rate at 62%**, showing serious issues in **early customer experience / onboarding**.
- **Senior citizens (60+)** are more likely to churn, with a churn rate of **35%**, compared to **22% for customers under 30**.
- **Lost revenue due to churn is \$8M**, which is **26% of the total revenue (\$31M)**.
- Among internet types, **Fiber Optic** has the **highest churn rate at 41%**, making it the **riskiest internet service segment**.
- For add-on services, customers with **Internet Service–related add-ons** show a higher churn rate of **32%** compared to other add-on services.
- **Month-to-Month contracts** have a churn rate of **46%**, much higher than **1-Year (11%)** and **2-Year (3%)** contracts, showing that **longer contracts are much more stable**.
- The top churn reason is **“Competitor”**, accounting for **45% of churned customers**, indicating many customers are **switching to rival providers**.
-[`Churn_EDA.ipynb`](Churn_EDA.ipynb)
---

##  Dashboard Preview
![Telecom Churn Dashboard](images/churn_dashboard.png)
