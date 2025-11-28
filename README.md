# ✈️ Airline Flight Delays Analytics  
### **End-to-End Data Analysis | SQL + Power BI**

This project analyzes **6 million U.S. domestic flights** to uncover patterns related to delays, cancellations, diversions, and overall airline/airport performance. It combines **SQL data modeling** and **Power BI visual analytics** to deliver meaningful insights for operational decision-making in the aviation sector.

---

## 📌 Project Summary  
The goal of this project is to understand the key drivers of flight delays and evaluate how airlines and airports perform across different time periods, routes, and operational conditions.

The analysis covers:

- Airline performance  
- Delay patterns & causality  
- Cancellation and diversion behavior  
- Seasonal and hourly trends  
- Airport congestion and route performance  
- Cost impact of delays  

The final deliverable includes both **SQL views** for KPIs and a set of **interactive Power BI dashboards**.

---

## 🛠️ Tools & Technologies  
- **SQL (MySQL)** – Data cleaning, transformation, KPI calculation, feature engineering  
- **Power BI** – Dashboarding, visualization, storytelling  
- **Maven Analytics Dataset** – U.S. airline on-time performance database  

---

## 📊 Key Insights (High-Level)

- **46%** of flights experienced some level of delay.  
- **Evening and Night** flights show the highest delays due to accumulated daily congestion.  
- **National Air System** issues account for over **half of all cancellations**.  
- **ATL, ORD, and DFW** are the busiest airports, influencing delay propagation.  
- Certain airlines maintain strong on-time performance despite high traffic volume, highlighting operational efficiencies.

---

## 🚀 Project Structure  
```
Airline-Flight-Delays-Analytics/
│
├── SQL/
│ └── KPI_Views.sql
│
├── PowerBI_Dashboard/
│ └── Flight_Delays.pbix
│
├── Documentation/
│ └── Airline_Project_Documentation.pptx
│
└── README.md
```
---

## 📁 Dataset  
The dataset comes from **Maven Analytics** and includes:

- Flight times (scheduled & actual)  
- Airline identifiers  
- Airport locations  
- Delay duration by cause  
- Cancellation reasons  
- Route information  
- Taxi-in/taxi-out metrics  

---

## 📐 Data Model  
The project uses a simplified star-schema structure:

- **Flights** (fact table)  
- **Airlines** (dimension)  
- **Airports** (dimension)  
- **Cancellation Codes** (dimension)  

This modeling supports efficient KPI calculation and visualization.

---

## 🔍 What’s Included

### ✔ SQL Data Transformations  
Over **30 analytical SQL views**, including:

- On-time arrival & departure rates  
- Delay distribution categories  
- Delay cause breakdown  
- Cancellation & diversion rates  
- Route and airport rankings  
- Time-of-day and seasonality analytics  
- Cost estimation of delays  

### ✔ Power BI Dashboards  
- **Airline Performance**  
- **Delay Analysis**  
- **Cancellation Analysis**  
- **Seasonality & Trends**  
- **Airport & Route Insights**  

Each dashboard provides interactive explorations of flight operations and reliability metrics.

---

## 💡 Potential Future Enhancements

- Predictive modeling for flight delays (Machine Learning)  
- Real-time data integration via FAA or airline APIs  
- Forecasting of congestion patterns  
- Passenger impact & satisfaction modeling  

---

## 📣 About This Project  
This project demonstrates end-to-end analytical thinking:

- Collect → Clean → Model → Analyze → Visualize  
- Translate aviation data into insights relevant for business stakeholders  
- Showcase SQL proficiency and Power BI storytelling  

---

