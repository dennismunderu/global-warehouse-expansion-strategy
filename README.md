 # 🌍 Warehouse Expansion Strategy for a Global Logistics E-commerce

<img src="visualizations/banner/Project_banner.jpg" alt="Global Logistics Network - Warehouse Expansion Strategy" width="100%"/>

 ## Overview

 This project evaluates **global shipping and order data** to identify the most strategic regions for **international warehouse expansion**. The core objective is to help a U.S.-based, logistics-driven e-commerce company reduce international shipping costs, improve delivery reliability, and build a scalable fulfillment network aligned with global demand patterns.

The analysis moves beyond surface-level metrics and integrates **order volume, revenue contribution, product movement, customer behavior, seasonality, and operational constraints** to support data-backed expansion decisions that are both financially and operationally sound.

---

## Business Context
The company enables customers—primarily based in the United States and its territories—to purchase goods and ship them internationally. As global demand has expanded, the business has evolved from a simple cross-border shipping facilitator into a full-service logistics provider handling both personal and commercial shipments across multiple continents.

However, this growth has exposed a critical limitation:  
**fulfilling all international orders from U.S.-based warehouses is no longer sustainable.**

Key pressures include:
- Rising international shipping costs driven by fuel surcharges, inflation, and carrier pricing changes  
- Increasing delivery lead times and unpredictability in high-demand regions  
- Margin compression and declining customer satisfaction  

These challenges prompted a strategic shift toward evaluating **regional fulfillment centers** as a long-term solution.

## Project Objective
The goal of this project is to **identify high-impact global regions for warehouse expansion** by analyzing:
- Historical shipping destinations  
- Order volume and revenue contribution  
- Product and category performance  
- Customer segment behavior  
- Seasonal demand patterns  
- Payment and operational efficiency  

The outcome supports decisions on **where** to expand, **why** those regions matter, and **how** inventory and operations should be structured for maximum impact.

---

## Data & Architecture
- **Source:** [Supply Chain Data Hub](https://supplychaindatahub.org/)  
- **Raw Dataset:**  
  - 155,489 records  
  - 41 columns  
- **Post-Cleaning:**  
  - 148,991 records  
  - 8 relational tables  

### Core Tables
- `categories` – product category and department structure  
- `customer_segments` – customer segmentation profiles  
- `payment_types` – accepted payment methods  
- `shipping_mode` – shipping service levels  
- `products` – product-level details  
- `customers` – customer geography and demographics  
- `orders` – order-level and fulfillment information  
- `order_items` – line-item transaction data  

All data cleaning and standardization were performed in **Python (pandas)** and documented separately. Final analysis leveraged **SQL** for relational querying and **Power BI** for visualization.

---

## Analytical Approach
1. **Data Cleaning & Preparation** – Python (Jupyter Notebook) 🐍✨
2. **Relational Modeling & Aggregation** – SQL 🔗📊
3. **Exploratory Data Analysis & Visualization** – Power BI 📈🌟 
4. **Business Interpretation** – Translating insights into strategic recommendations 💡🚀

---

## Key Insights

### 🌐 High-Volume Shipping Regions

<p align="center">
  <img 
    src="visualizations/screenshots/orders per region by order country.JPG" 
    alt="Global Order Distribution" 
    width="450"
  />
 <br/>
  <em>Order Distribution per Region</em>
</p>

- **Europe** leads globally in order volume, placing **four countries in the top ten**.
- Demand is **stable and recurring**, not seasonal, making fulfillment needs predictable.

**Implication:** Europe is a prime candidate for regional warehousing due to consistent demand and scale.

---

### 💰 Revenue Contribution by Region

<table>
  <tr>
    <td><strong>Revenue by Market (Region)</strong></td>
    <td><strong>Revenue by Country</strong></td>
  </tr>
  <tr>
    <td><img src="visualizations/screenshots/total revenue by market.JPG" alt="Revenue by Market (Region)" width="100%"/></td>
    <td><img src="visualizations/screenshots/revenue by order country.JPG" alt="Revenue by Country" width="100%"/></td>
  </tr>
</table>

- Europe contributes **29.72% of total revenue**, followed closely by **LATAM at 26.58%**.
- The U.S. remains the single largest revenue-generating country, reflecting its role as the current fulfillment hub.
- France, Germany, the UK, Italy, Mexico, and Brazil emerge as high-value markets.

**Implication:** Revenue concentration outside the U.S. supports distributed fulfillment to protect margins and delivery performance.

---

### ⚖️ Revenue vs. Order Volume Efficiency

<p align="center">
  <img 
    src="visualizations/screenshots/rank gap.JPG" 
    alt="Payment Preference by Region" 
    width="450"
  />
 <br/>
  <em>Revenue Efficiency by Region: Rank Gap Analysis</em>
</p>

- High-volume regions generally translate into high revenue.
- Markets with aligned volume and revenue (rank_gap ≤ 0)—such as the U.S., France, Germany, Mexico, and Brazil—offer the **highest ROI** for infrastructure investment.
- Some regions show efficiency but lack scale (a negative rank_gap), limiting near-term strategic value.

**Implication:** Expansion decisions should prioritize **absolute impact**, not efficiency alone.

---

### 📦 Product & Category Trends
- **Revenue-driven categories:** Fishing, Cleats, Camping & Hiking, Cardio Equipment, Women’s Apparel  
- **Volume-driven categories:** Cleats, Footwear, Apparel, Indoor/Outdoor Games  
- Cleats is the **most globally shipped category**, appearing as the top category in the top 20 countries.

**Implication:** A hybrid inventory strategy—balancing high-value items and fast-moving goods—is essential, especially in mature regions like Europe.

---

### 👥 Customer Segment Behavior

<table>
  <tr>
    <td><strong>Consumer Segments</strong></td>
    <td><strong>Total Revenue and orders per Customer Segment</strong></td>
  </tr>
  <tr>
    <td><img src="visualizations/screenshots/customer segments.JPG" alt="Consumer Segments" width="100%"/></td>
    <td><img src="visualizations/screenshots/total revenue and order per customer segment.JPG" alt="Total Revenue and orders per Customer Segment" width="100%"/></td>
  </tr>
</table>

- The **Consumer segment** accounts for:
  - ~52% of customers  
  - ~50% of international orders  
  - ~52% of total revenue  
- This dominance is consistent across all regions.

**Implication:** Warehouse stocking and fulfillment strategies should be optimized primarily around Consumer demand patterns.

---

### 📅 Seasonal Demand Patterns

<p align="center">
  <img 
    src="visualizations/screenshots/average orders per month.JPG" 
    alt="Global Order Distribution" 
    width="450"
  />
 <br/>
  <em>Average Orders Per month</em>
</p>

- Global demand peaks sharply in **November and December**.
- The rest of the year shows **stable baseline activity**.

**Implication:** Warehousing strategies should rely on **temporary seasonal scaling**, not permanent overcapacity.

---

### 💳 Payment & Operational Insights

<p align="center">
  <img 
    src="visualizations/screenshots/payment preferrence by region.JPG" 
    alt="Payment Preference by Region" 
    width="450"
  />
 <br/>
  <em>Payment Method Preferrence by Region</em>
</p>

- Debit is the most commonly used payment method globally.
- **High payment friction** exists in parts of Africa and Asia, with up to 60% of orders in pending statuses.
- Northern Europe and Central America show **high order completion rates (>75%)**.

**Implication:** Payment reliability is a critical risk factor in expansion planning.

---

## Strategic Recommendations

1. **Prioritize Europe for the Next Warehouse**  
   Stable demand, high revenue concentration, and balanced product performance make Europe the strongest candidate.

2. **Retain U.S.-Centric Fulfillment for North America & LATAM**  
   Road-based logistics and existing infrastructure make expansion unnecessary in the short term.

3. **Invest in Revenue–Volume Aligned Markets**  
   Focus on countries where scale and monetization reinforce each other (e.g., France, Germany, Brazil, Mexico).

4. **Adopt a Hybrid Inventory Model**  
   Combine high-margin, low-frequency products with high-turnover consumer goods.

5. **Design Around the Consumer Segment**  
   Prioritize categories like Cleats, Footwear, and Apparel to support repeat international purchases.

6. **Plan for Seasonal Peaks Without Overbuilding**  
   Use flexible staffing and inventory buffers for year-end surges.

7. **Address Payment Friction Before Risky Expansion**  
   Improve payment processes before expanding into high-risk regions; favor markets with strong completion rates.

---

## Why This Project Matters
This analysis demonstrates how **data-driven supply chain strategy** can directly inform high-stakes business decisions. It integrates technical execution (Python, SQL, Power BI) with **clear commercial reasoning**, making it highly relevant for roles in:
- Data Analytics  
- Supply Chain Analytics  
- Operations Strategy  
- Logistics & Fulfillment Optimization.

🔗 Feel free to reach out — I'd love to discuss how I can contribute to your team's goals!
---










