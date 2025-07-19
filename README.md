# 📊 AdventureWorks dbt Project

![DBT](https://img.shields.io/badge/DBT-%F0%9F%92%BE%20Data%20Build%20Tool-orange?logo=dbt&logoColor=white)
![SQL Server](https://img.shields.io/badge/SQL%20Server-%F0%9F%93%9D-red?logo=microsoftsqlserver&logoColor=white)
![Microsoft Fabric](https://img.shields.io/badge/Microsoft%20Fabric-%F0%9F%93%88-blue?logo=microsoft&logoColor=white)

> A complete **Data Warehouse** built using the [AdventureWorks2022](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure) dataset, modeled and transformed using **dbt**, deployed on **Microsoft Fabric**, and following **Data Vault 2.0** and **Dimensional Modeling** best practices.

---

## 🧩 Project Structure

├── models/
│ ├── staging/
│ │ └── stg_.sql
│ ├── intermediate/
│ │ └── int_.sql
│ ├── marts/
│ │ ├── dimensions/
│ │ │ └── dim_*.sql
│ │ └── facts/
│ │ └── fact_sales_order.sql
│ └── snapshots/
│ └── ...
├── macros/
│ └── generate_surrogate_key.sql
├── seeds/
├── dbt_project.yml
└── README.md

---

## 🏗️ Features

- 🔄 **ETL Pipelines** using dbt models (staging ➝ intermediate ➝ marts)
- 📦 Fact & Dimension Models (Kimball)
- 🧠 Surrogate key generation using custom macros
- 📈 Sales Orders Fact Table with links to Customer, Product, Date, and Store dimensions
- 🧪 Automated Data Testing with dbt `schema.yml`
- 🗂️ Source freshness and documentation
- 🕒 Snapshots for slowly changing dimensions (SCD)

---

## 📁 Key Models

| Layer         | Models                                                                 |
|---------------|------------------------------------------------------------------------|
| 🧽 Staging     | `stg_customer`, `stg_product`, `stg_salesorderheader`, `stg_store`, etc. |
| 🧠 Intermediate | `int_customer_hub`, `int_sales_orders`                                 |
| 🧱 Dimensions  | `dim_customer`, `dim_product`, `dim_date`, `dim_store`                 |
| 📊 Facts       | `fact_sales_order`                                                    |

---

## 🛠️ Technologies Used

- ⚙️ **dbt-core 1.10.4**
- 🗄️ **SQL Server 2022**
- 🧱 **Microsoft Fabric / OneLake**
- 🧪 **dbt Tests (not_null, unique, relationships)**
- 📚 **dbt Documentation Site**

---

## 🔍 Example: Surrogate Key Macro

```sql
{{ generate_surrogate_key(['customer_id', 'order_date']) }} AS sk_customer_order

