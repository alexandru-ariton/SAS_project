# 🛒 Retail Transaction Data Analysis (SAS & SQL)

A **SAS-based** data analysis project that explores **retail transaction data** using **SQL** for structured data queries. The project processes, analyzes, and extracts insights from customer purchase data using **PROC SQL** and **SAS procedures**.

---

## 📌 Project Overview

- **Dataset**: Retail Transaction Dataset  
- **Programming Language**: SAS  
- **Query Language**: SQL (PROC SQL)  
- **Key Techniques**:  
  - Data Cleaning & Preprocessing (PROC SQL)  
  - Sales Analysis using SQL Queries  
  - Discount & Pricing Strategy Evaluation  
  - Data Aggregation & Reporting with SQL  
  
---

## 🚀 Features

✅ **Data Preprocessing with SQL** – Cleans missing values and structures the dataset  
✅ **Store Location Analysis** – Identifies all store locations and sorts them alphabetically  
✅ **Product Sales Tracking** – Computes total quantity sold per product using **SQL GROUP BY**  
✅ **Revenue by Category** – Calculates total revenue per product category using **SUM()**  
✅ **Pricing Strategy Analysis** – Applies **CASE WHEN** logic for discounts  
✅ **Customer Segmentation** – Filters specific transactions using **WHERE & HAVING**  
✅ **Statistical Insights** – Computes **AVG(), MIN(), MAX()** for product prices  
✅ **Graphical Representation** – Generates bar charts for products above a certain price threshold using SAS procedures  

---

## 🏗️ System Architecture

This project is structured as follows:

📂 **codProiect.sas** – Main SAS script that processes and analyzes transaction data using SQL  
📂 **Retail_Transaction_Dataset.csv** – Dataset containing customer purchase information  
📂 **main.py** – Python script for additional analysis

---

## 📥 Running the Project

### 🔹 **Prerequisites**
Ensure you have access to **SAS Studio** or **Base SAS** installed.  

### 🔹 **Executing the SQL Queries in SAS**
1️⃣ Load the dataset into SAS using `PROC IMPORT`:  
```sas
PROC IMPORT DATAFILE='Retail_Transaction_Dataset.csv' 
    OUT=RetailData
    DBMS=CSV REPLACE;
    GETNAMES=YES;
RUN;
```

2️⃣ Run data processing queries using `PROC SQL`:  
```sas
PROC SQL;
    SELECT StoreLocation, COUNT(*) AS Transactions 
    FROM RetailData
    GROUP BY StoreLocation
    ORDER BY StoreLocation;
QUIT;
```

3️⃣ Execute business logic such as revenue calculations:  
```sas
PROC SQL;
    SELECT ProductCategory, SUM(TotalAmount) AS TotalRevenue 
    FROM RetailData
    GROUP BY ProductCategory;
QUIT;
```

4️⃣ Apply discount logic using `CASE WHEN`:  
```sas
PROC SQL;
    SELECT ProductID, Price,
        CASE 
            WHEN Price <= 40 THEN Price * (1 - DiscountApplied)
            WHEN Price BETWEEN 40 AND 50 THEN Price * 0.8
            ELSE Price * 0.7
        END AS DiscountedPrice
    FROM RetailData;
QUIT;
```

5️⃣ Generate statistical insights:  
```sas
PROC SQL;
    SELECT ProductID, AVG(Price) AS AvgPrice, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice
    FROM RetailData
    GROUP BY ProductID;
QUIT;
```

---

## 📊 Data Analysis Steps

### **📌 Data Processing**
- Reads the dataset into SAS tables  
- Extracts relevant columns for analysis  
- Cleans missing values using SQL functions  

### **📍 Key Analysis Tasks**
1. **Compute total quantity sold per product** using `SUM(Quantity)`  
2. **Calculate total revenue per product category** using `SUM(TotalAmount)`  
3. **Apply discount rules** using SQL **CASE WHEN**  
4. **Filter transactions based on payment method and discount criteria**  
5. **Remove low-value transactions (Price < 20)** using `DELETE FROM`  
6. **Compute average price per product** using `AVG(Price)`  
7. **Generate reports on product sales by category** using `GROUP BY`  
8. **Determine min/max price per product** using `MIN(Price), MAX(Price)`  
9. **Create a bar chart for high-priced products (Price > 30 EUR) using SAS procedures**  

---

## 📊 Visualization & Outputs

📌 **Bar Chart** – Visualizes high-priced products using `PROC SGPLOT`  
📌 **SQL Reports** – Displays summary metrics for transactions  
📌 **Filtered Data** – Highlights relevant customer segments  

---

## 🎯 Future Enhancements

🔮 **Next Steps:**  
- Implement **Predictive Analytics using SAS Machine Learning**  
- Expand **SQL Query Optimization** for faster processing  
- Develop **Automated SAS Dashboards** for data visualization  

---
 
👥 Contributors:  
- **Ariton Alexandru**  

---
