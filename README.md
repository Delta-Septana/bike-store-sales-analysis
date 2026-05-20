# 🚲 Bike Store Sales Analysis

## 🔎 Overview
This project analyzes bike sales performance at three bike shops, as well as product inventory and employee performance.

## 🛠️ Tools
- SQL
- Python
- Power BI

## 📝 Key Steps
- Data importing, cleaning, formatting, and joining in SQL
- Exploratory Data Analysis with Python
- Interactive Bussiness Dashboard using Power BI

## 📊 Key Results
- Sales fluctuated steadily before experiencing an unprecedented surge in **April 2018**, followed by a sharp drop to near-zero stagnation until early 2019.
- **Cruiser Bicycles** (Category) and **Electra** (Brand) act as high-volume market penetration drivers. Conversely, **Mountain Bikes** and **Trek** serve as the premium revenue anchors.
- The **Trek Slash 8** is the ultimate highly-profitable SKU, dominating both demand and revenue generation.
- **Emmit Sanchez** is the most frequent buyer, while **Sharyn Hopkins** maximizes financial contribution.
- Physical inventory was distributed evenly across stores regardless of local demand, causing capital inefficiencies.
- **Baldwin Bikes** generates the highest revenue but holds the lowest inventory buffer, triggering high stockout risks.
- Identified critical data inconsistencies, including active personnel with **0 processed orders** and cross-branch reporting hierarchy errors (`manager_id` routing faults at Rowlett Bikes).

## 💡 Recommendations
- Halt uniform warehouse distribution; dynamically allocate inventory based on each store's historical sales capacity.
- Establish strict safety stock thresholds for high-velocity SKUs specifically at the Baldwin Bikes hub.
- Deploy targeted promotions and high-margin bundling packages for slow-moving premium items to free up tied-up working capital.
- Execute an immediate HR data audit to fix the foreign key (`manager_id`) routing errors at Rowlett Bikes.
- Implement continuous transactional logging checks to reconcile employee active statuses against real-time order fulfillment logs.

## Preview
| Entity Relational Diagram             | Sales Trend                         |
|---------------------------------|----------------------------------------|
| ![](images/ERD.png)   | ![](images/Salestrend_chart.png) |

| Top Products            | Dashboard                         |
|---------------------------------|----------------------------------------|
| ![](images/TopSalesproduct_chart.png)   | ![](images/Dashboard.png) |

## 🔗 Full Project
More detailed explanation available on Notion: 
[Bike Store Sales Analysis](https://zesty-fern-8c2.notion.site/Bike-Store-Sales-Analysis-3654607c638e80dfac87dccb6e8a02d4?source=copy_link)