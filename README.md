# Data Engineering Project: End-to-End Capstone ELT Pipeline with Brazilian E-Commerce Dataset


- [Project Overview](#project-overview)
- [Data Architecture](#data-architecture)
- [Tools and Technologies](#tools-and-technologies)
- [Project Setup](#project-setup)
- [Project Steps](#project-steps)
  - [1. Data Ingestion into PostgreSQL](#1-data-ingestion-into-postgresql)
  - [2. Setting Up Apache Airflow](#2-setting-up-apache-airflow)
  - [3. Loading Data from PostgreSQL to BigQuery](#3-loading-data-from-postgresql-to-bigquery)
  - [4. Transforming and Modeling Data with dbt](#4-transforming-and-modeling-data-with-dbt)
  - [5. Answering Analytical Questions](#5-answering-analytical-questions)
- [Project Deliverables](#project-deliverables)
- [Conclusion](#conclusion)


## Project Overview

This project involves developing an end-to-end ELT (Extract, Load, Transform) process using the [Brazilian E-Commerce dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) from Kaggle. The aim is to help data end-users answer analytical questions by implementing a comprehensive data pipeline. The project demonstrates the use of key data engineering tools, including PostgreSQL, Docker, Docker Compose, Apache Airflow, dbt, and Google BigQuery.

## Data architecture
<p align="center">
  <img src="https://github.com/user-attachments/assets/52f03ca9-8cd2-4f72-ad9c-ea215d541c77" alt="Data architecture" width="600"/>
</p>


## Tools and Technologies

- 🐘 **PostgreSQL**: Relational database management system used for storing and managing the source data.
- 🐳 **Docker & Docker Compose**: Containerization tools for setting up a consistent and portable environment.
- 🔄 **Apache Airflow**: Workflow orchestration tool used to automate and manage the ETL process.
- 🛠️ **dbt (Data Build Tool)**: Data transformation tool for modeling and structuring data.
- ☁️ **Google BigQuery**: Cloud-based data warehouse for storing and querying large datasets.
- 🐍 **Python**: Programming language used for scripting and automating various parts of the ETL pipeline.
- 💾 **SQL**: Query language used for interacting with relational databases, specifically PostgreSQL and BigQuery, for data extraction, transformation, and loading.
☁️ **Google BigQuery**: Cloud-based data warehouse for storing and querying large datasets.

## Project Setup

To get started, clone the repository and ensure you have Docker, Docker Compose, and Python installed on your machine. Follow the instructions below to set up each component of the project.

## Project Steps

### 1. Data Ingestion into PostgreSQL

#### Download the Dataset
- Download the [Brazilian E-Commerce dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) from Kaggle.

#### Setup PostgreSQL Database
- Use Docker and Docker Compose to set up a PostgreSQL instance.

version: '3.1'
# Postgres service
```
services:
  postgresdb:
    image: postgres:latest
    environment:
      POSTGRES_USER: ecommerce_user
      POSTGRES_PASSWORD: ********
      POSTGRES_DB: ecommerce
```
- Create a new database named `ecommerce`.

#### Create Tables
- Design and create tables in the PostgreSQL database corresponding to each CSV file in the dataset.

#### Ingest Data
- Ingest the data into the PostgreSQL tables using either custom Python ELT scripts or an `init.sql` script during Docker setup.
```
CREATE SCHEMA IF NOT EXISTS ecommerce;


-- create and populate tables
create table if not exists ecommerce.customers
(
    customer_id varchar,
    customer_unique_id varchar,
    customer_zip_code_prefix varchar,
    customer_city varchar,
    customer_state varchar
);
```

### 2. Setting Up Apache Airflow

#### Install Airflow
- Integrate Apache Airflow into your Docker Compose setup.

#### Create Airflow DAG
- Design a Directed Acyclic Graph (DAG) in Airflow to orchestrate the ETL process. The DAG should include tasks for:
  - Extracting data from PostgreSQL.
  - Loading data into Google BigQuery.

<p align="center">
  <img src="/Users/micahonyedikachitobias/Desktop/Capstone_Project/include/gcs/airflow.png" alt="airflow Orchestration" width="600"/>
</p>

### 3. Loading Data from PostgreSQL to BigQuery

#### Setup Google BigQuery
- Create a new project in Google Cloud Platform (GCP) and enable the BigQuery API.
- Create a dataset in BigQuery to store the e-commerce data.

#### Load Data Using Airflow
- Use Airflow operators to extract data from PostgreSQL, optionally transform it, and load it into GCP bucket and the BigQuery dataset.
<p align="center">
  <img src="/Users/micahonyedikachitobias/Desktop/Capstone_Project/include/gcs/gcs.png" alt="gcs bucket" width="600"/>
</p>

### 4. Transforming and Modeling Data with dbt

#### Setup dbt
- Install dbt and initialize a new dbt project.

#### Configure dbt
- Connect dbt to your BigQuery dataset.

#### Create Models
- Develop dbt models to transform the raw data into a clean and structured format. The models should include:
  - **Staging Models**: Preliminary models to prepare raw data.
  - **Intermediate Models**: Aggregated and processed data ready for analysis.
  - **Final Models**: Final output models used to answer analytical questions.

### 5. Answering Analytical Questions

Using the transformed data, answer the following analytical questions:

1. **Which product categories have the highest sales?**
   - Create a model to aggregate sales by product category.

2. **What is the average delivery time for orders?**
   - Model the data to calculate the time difference between order purchase and delivery.

3. **Which states have the highest number of orders?**
   - Model the data to count the number of orders per state.

## Project Deliverables

- **PostgreSQL Scripts**: Scripts to create tables and ingest data into PostgreSQL.
- **Airflow DAG**: A DAG file to orchestrate the ETL process.
- **dbt Project**: dbt models to transform and model the data.
- **Analysis**: SQL queries or dashboards to answer the three analytical questions.
- **Docker Compose File**: A YAML manifest for setting up project resources, including PostgreSQL, Airflow, and any other dependencies.


## Conclusion

This project demonstrates a complete data engineering workflow, from data ingestion to analysis. By completing this project, you'll gain hands-on experience with essential tools and techniques in data engineering, preparing you for real-world challenges.


