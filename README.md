# Student Performance ETL & Predictive Analytics Pipeline

## Overview
This project implements an end-to-end data pipeline that transforms relational data into actionable insights and predictive outcomes. The workflow combines relational database design, ETL (Extract, Transform, Load), data quality validation, exploratory analytics, and predictive modeling using linear regression.

The goal of the project is to simulate a real-world analytics scenario where raw operational data stored in a relational database must be cleaned, validated, transformed, and analyzed to support decision-making.

---

## Problem Statement
An academic institution records student journeys from admission through coursework and assessments. The raw data is distributed across multiple relational tables and contains inconsistencies, missing values, and invalid entries.

The objectives of this project are to:
- Load and manage relational data in a SQL database
- Perform data quality inspection and exception reporting
- Transform normalized relational data into an analytics-ready dataset
- Extract descriptive insights through exploratory analysis
- Build a predictive model to estimate future student performance based on historical effort

---

## Tech Stack
- **Database:** MariaDB (SQL)
- **Programming Language:** Python
- **Data Processing:** Pandas, NumPy
- **Data Visualization:** Matplotlib, Seaborn
- **Machine Learning:** scikit-learn (Linear Regression)
- **Environment:** Jupyter Notebook

---

## Data Model
The dataset represents an academic institution with the following entities:
- **Department** – academic departments
- **Employee** – university employees (professors)
- **Student** – student demographic and admission information
- **Student Performance** – assessment scores and effort hours

The relational schema enforces primary and foreign key constraints and reflects a normalized design suitable for transactional systems.

---

## Pipeline Architecture

### 1. Data Loading (SQL)
- CSV files are loaded into a relational database
- Tables are created using a predefined schema
- Primary and foreign key relationships are enforced

### 2. Data Quality Validation
The following data quality dimensions are explicitly checked and reported:

**Completeness**
- Detection of missing or null values in critical fields

**Validity**
- Marks must be within the range 0–100
- Effort hours must be greater than or equal to 0
- Date fields must contain valid calendar values

**Consistency**
- Foreign key relationships are validated
- Student and paper references must exist across tables

**Uniqueness**
- Duplicate student IDs are flagged
- A student cannot have more than one mark per paper

Invalid or incomplete records that affect predictive modeling are discarded, while all issues are logged for transparency.

---

## Data Transformation
After validation, the relational data is transformed into an aggregated, analytics-ready dataset:
- Multiple tables are joined
- Invalid rows are removed based on quality rules
- Intermediate features are computed where required

The transformed dataset serves as the single source of truth for all analytics and modeling tasks.

---

## Exploratory Data Analysis
Descriptive analytics are applied to understand:
- Distribution of student marks
- Relationship between effort hours and performance
- Performance patterns across departments and semesters

Visualizations are used to identify trends, variability, and potential outliers.

---

## Predictive Modeling
A linear regression model is built to predict a student’s next assessment score based on historical effort (hours invested) and performance.

### Prediction Task
- Input: Historical effort vs. marks
- Assumption: The student invests 10 hours in the next paper
- Output: Predicted score (out of 100)

Predictions are generated for a predefined set of students, and results are exported for reporting.

---

## Outputs
- Cleaned and transformed dataset
- Data quality exception report
- Predicted scores for future assessments
- Visual analytics supporting model interpretation

---



