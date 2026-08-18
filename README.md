# Olist E-Commerce Data Analysis

## Project Overview

This project analyzes the Brazilian Olist e-commerce dataset to understand business performance, customer behavior, delivery performance, product categories, sellers, and customer satisfaction.

The analysis uses SQL to answer key business questions and an executive dashboard to summarize the most important findings for business decision-making.

## Business Questions

This project answers the following business questions:

1. How has revenue changed over time?
2. How well are orders being delivered?
3. Does late delivery drive bad customer reviews?
4. Which product categories perform best?
5. How concentrated are sales among sellers?
6. How do freight costs vary across orders?
7. How do customers pay for their orders?
8. How does performance vary geographically?
9. Who are the most valuable customers?
10. How does customer retention change across cohorts?
11. What patterns appear in customer reviews?
12. How much revenue may be at risk due to late delivery?

## Tools & Technologies

- **PostgreSQL** — Data storage and SQL analysis
- **DBeaver** — Running SQL queries and exporting results
- **Google Sheets / Excel** — Pivot tables, KPI calculations, charts, and executive dashboard
- **VS Code** — Project organization and SQL documentation
- **Git & GitHub** — Version control and portfolio presentation

## Key Findings

- **Total delivered revenue:** R$15.42 million.
- **Average review score:** 4.16 out of 5.
- **On-time delivery rate:** 91.88%, with 88,644 of 96,478 delivered orders arriving on or before the estimated delivery date.
- **Top-selling product category:** `cama_mesa_banho`, with 11,115 items sold.
- Customer purchase frequency analysis shows that repeat purchasing is an important opportunity for improving customer lifetime value.


## Executive Dashboard

The executive dashboard summarizes the main business findings from the SQL analysis.

### Dashboard Highlights

- Total revenue and order performance
- Average customer review score
- On-time delivery performance
- Monthly revenue trend
- Top 10 product categories
- Customer purchase frequency
- Key business recommendations

The complete dashboard is available in:

- `outputs/executive_summary.xlsx`
- `outputs/executive_summary.pdf`


## Project Structure

```text
olist-ecommerce-analysis/
│
├── sql/
│   ├── 00_data_profiling.sql
│   ├── 01_revenue_trend.sql
│   ├── 02_delivery_performance.sql
│   ├── 03_delivery_vs_review.sql
│   ├── 04_category_performance.sql
│   ├── 05_seller_concentration.sql
│   ├── 06_freight_cost_analysis.sql
│   ├── 07_payment_behaviour.sql
│   ├── 08_geographic_analysis.sql
│   ├── 09_customer_rfm.sql
│   ├── 10_cohort_retention.sql
│   ├── 11_review_text_patterns.sql
│   └── 12_estimated_revenue_at_risk.sql
│
├── outputs/
│   ├── charts/
│   ├── executive_summary.xlsx
│   └── executive_summary.pdf
│
└── README.md

## Business Recommendations

1. **Prioritize high-volume product categories**  
   Maintain strong product availability and seller support for the categories generating the highest marketplace activity.

2. **Increase customer retention**  
   Target one-time buyers with retention campaigns and incentives designed to encourage repeat purchases and increase customer lifetime value.

3. **Protect delivery performance**  
   Maintain and improve delivery reliability to protect customer satisfaction, especially since 91.88% of delivered orders currently arrive on or before the estimated delivery date.

   ## How to Run This Project

1. Load the Olist dataset into PostgreSQL.
2. Open the SQL files in the `sql/` folder.
3. Run the queries in numerical order using DBeaver or another PostgreSQL client.
4. Review the business question and finding documented in each SQL file.
5. Open `outputs/executive_summary.xlsx` to explore the executive dashboard, pivot tables, and supporting data.
6. Open `outputs/executive_summary.pdf` for the one-page executive summary.