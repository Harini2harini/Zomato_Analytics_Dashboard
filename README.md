# Food Delivery Analytics | SQL & Power BI

End-to-end data analytics project analyzing a Zomato-style food delivery dataset using SQL for data exploration, cleaning, and KPI generation, and Power BI for building an interactive 4-page dashboard.

## Overview

This project covers the full analytics pipeline — from raw relational data to business-ready insights:
- Data exploration and quality checks using SQL
- Data cleaning (handling invalid values, nulls, and placeholder text)
- KPI query development across revenue, restaurants, customers, and menu data
- Interactive Power BI dashboard with KPI cards, visuals, slicers, and key insights

## Dataset

Zomato-style food delivery dataset with 5 relational tables:
- `orders` — 150K+ order transactions
- `restaurant` — 148K+ restaurant records across 821 cities
- `menu` — restaurant-cuisine-food mapping with pricing
- `food` — food item details (veg/non-veg classification)
- `users` — 100K+ customer demographic details

## Tools Used

- **SQL Server (SSMS)** — data exploration, cleaning, KPI queries
- **Power BI Desktop** — data modeling, DAX, dashboard design

## SQL Files

| File | Description |
|---|---|
| `data_exploration.sql` | Row counts and initial structure checks across all 5 tables |
| `data_cleaning.sql` | Handles invalid order values, cleans placeholder text in ratings, checks for orphan foreign keys |
| `KPI.sql` | 9 core KPI queries — revenue, orders, top restaurants/cities, veg/non-veg split, age group orders, monthly revenue trend |

## Data Modeling

Built relationships across all 5 tables in Power BI:
- `orders.r_id` → `restaurant.id`
- `orders.user_id` → `users.user_id`
- `menu.r_id` → `restaurant.id`
- `menu.f_id` → `food.f_id`

Since `restaurant.cuisine` contained multi-value comma-separated entries (e.g. "North Indian,Chinese"), a **bridge table** was created to split cuisines into individual rows while preserving the one-to-many relationship integrity — avoiding duplicate primary key errors on the main `restaurant` table.

## Dashboard Pages

**1. Overview**
Total Revenue, Total Orders, Total Quantity Sold, Avg Order Value | Revenue Trend, Top 5 Cities by Revenue, Revenue by Cuisine, Orders per Year, Revenue vs Orders

**2. Restaurant Insights**
Total Restaurants, Average Rating, Total Cuisines, Total Cities | Top 10 Restaurants by Revenue, Average Cost for Two by Cuisine, Restaurant Count by City

**3. Customer Insights**
Total Customers, Avg Family Size, Total Occupations, Income Brackets | Orders by Educational Qualification, Orders by Monthly Income, Orders by Gender, Orders by Occupation

**4. Food/Menu Insights**
Total Items, Veg Items, Non-Veg Items, Avg Price | Item Count by Cuisine, Restaurant Count Offering Each Cuisine, Average Price by Cuisine, Veg vs Non-Veg Split

## Key Insights

- Brands (Domino's, KFC, Pizza Hut) dominate revenue over independent restaurants
- 72.88% of menu items are vegetarian — a strongly veg-first platform
- Sri Lankan, Japanese, and Asian/Turkish cuisines command premium average pricing
- Students and employees with no/lower income drive the highest order volumes
- Restaurant presence is concentrated in a handful of cities, pointing to tier-1/tier-2 hub concentration

