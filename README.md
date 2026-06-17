# GinishTech-SQL-data-modeling-E-commerce

# 🛒 E-Commerce Relational Data Modeling & Advanced SQL Analytics

## 📋 Project Overview
This repository contains an end-to-end relational database design and analytical portfolio for a modern e-commerce platform. The project starts by constructing a normalized database schema from scratch, populating it with realistic transactional mock data, and executing **47 strategic business intelligence queries** to extract actionable insights.

The purpose of this project is to demonstrate advanced SQL competency, data architecture design patterns, and the ability to bridge raw technical tables into executive-level business metrics.

---

## 📐 Relational Database Schema Architecture

The database environment is designed using a highly normalized **8-table architecture** to maintain transactional integrity, minimize data redundancy, and map out the entire customer lifecycle.

### Database ER Diagram
Below is the structural entity-relationship mapping for this e-commerce ecosystem:

![Database Schema Diagram](GinishTech%20e_commerce%20Tables%20Schema.jpg)

### Core Schema Components:
* **`Customers`**: Stores user registration profiles and platform registration timeline data.
* **`Categories`**: High-level classifications for structural catalog clustering.
* **`Suppliers`**: Tracks international supplier networks and sourcing origins.
* **`Products`**: Inventory catalog master records mapping pricing, stocks, categories, and suppliers.
* **`Orders`**: Top-level transaction logging mapping transactional values to specific customers.
* **`Order_Items`**: The core cross-reference bridge table managing many-to-many granular item purchases.
* **`Shipments`**: Logistics fulfillment logs handling transit stages and carrier data.
* **`Product_Reviews`**: Post-purchase customer feedback loop recording numeric ratings and reviews.

---

## 🛠️ Key Query Showcases & Technical Snippets

Here are visual deep dives into some of the most critical query types implemented within the project, showcasing performance validation directly from the database compiler.

### 1. Conditional Aggregations (`GROUP BY` + `HAVING`)
**Business Problem:** Isolate top-tier customer segments whose cumulative lifetime transactions exceed $500 to run targeted retention campaigns.
![Query 1 Snippet](Query%201.png)

### 2. Time-Series Window Functions (`SUM() OVER`)
**Business Problem:** Calculate transactional daily revenue pacing along with a monthly running total for the financial ledger.
![Query 4 Snippet](Query%204.jpg)

### 3. Dynamic Evaluation Logic (`CASE WHEN`)
**Business Problem:** Transform stock raw numerical volumes into automated, operational status triggers (`Healthy`, `Low Stock`, `Out of Stock`).
![Query 17 Snippet](Query%2017.png)

### 4. Multi-Table Linear Linage Tracking (`INNER JOIN`)
**Business Problem:** Stitch 6 distinct entities together to perfectly trace a customer's experience from their name down to shipping updates.
![Query 18 Snippet](Query%2018.jpg)

### 5. System Integrity Exception Handling (`LEFT JOIN` + `IS NULL`)
**Business Problem:** Audit backend logs to detect "orphan orders"—purchases successfully checked out but missing package allocations.
![Query 46 Snippet](Query%2046.png)

---

## 🚀 Getting Started & Execution

To test or deploy this environment locally:

1. Clone this repository:
   ```bash
   git clone [https://github.com/YOUR_USERNAME/YOUR_REPOSITORY_NAME.git](https://github.com/YOUR_USERNAME/YOUR_REPOSITORY_NAME.git)
