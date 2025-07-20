# 📊 AdventureWorks DBT Project

![DBT](https://img.shields.io/badge/DBT-%F0%9F%92%BE%20Data%20Build%20Tool-orange?logo=dbt&logoColor=white)
![SQL Server](https://img.shields.io/badge/SQL%20Server-%F0%9F%93%9D-red?logo=microsoftsqlserver&logoColor=white)
![Microsoft Fabric](https://img.shields.io/badge/Microsoft%20Fabric-%F0%9F%93%88-blue?logo=microsoft&logoColor=white)

> A complete **Data Warehouse** built using the [AdventureWorks2022](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure) dataset, modeled and transformed using **dbt**, deployed on **Microsoft Fabric**, and following **Data Vault 2.0** and **Dimensional Modeling** best practices.

---

## 🧩 Project Structure

```text
AdventureWorks_DWH/
│
├── dbt_project.yml
├── packages.yml
├── models/
│   ├── staging/
│   │   ├── stg_customer.sql
│   │   ├── stg_product.sql
│   │   └── ...
│   │
│   ├── intermediate/
│   │   ├── int_sales_orders.sql
│   │   └── ...
│   │
│   ├── marts/
│   │   ├── dimensions/
│   │   │   ├── dim_customer.sql
│   │   │   ├── dim_product.sql
│   │   │   └── ...
│   │   │
│   │   └── facts/
│   │       └── fact_sales_order.sql
│   │
│   └── snapshots/
│       └── snap_employee.sql
│
├── macros/
│   └── generate_surrogate_key.sql
│
├── seeds/
│   └── CSV_Files
│
├── tests/
  └── ...
```
---

## 📄 Configuration Examples

### `dbt_project.yml`

```yaml
name: 'adventureworks_dwh'
version: '1.0.0'
config-version: 2

profile: 'fabric'

model-paths: ['models']
snapshot-paths: ['snapshots']
seed-paths: ['seeds']
test-paths: ['tests']
macro-paths: ['macros']

models:
  adventureworks_dwh:
    staging:
      materialized: view
    intermediate:
      materialized: view
    marts:
      dimensions:
        materialized: table
      facts:
        materialized: table
 ```
---
### `schema.yml` 
```
version: 2

models:
  - name: fact_sales_order
    description: "Fact table for sales orders with links to customer, product, and store dimensions"
    columns:
      - name: sales_order_id
        tests:
          - not_null
          - unique
      - name: customer_id
        tests:
          - relationships:
              to: ref('dim_customer')
              field: customer_id
      - name: product_id
        tests:
          - relationships:
              to: ref('dim_product')
              field: product_id
```
---
### `macros`
```sql
{% macro generate_surrogate_key(field_list) -%}
    {{
        return(
            "md5(concat("
            + field_list|join(", ")
            + "))"
        )
    }}
{%- endmacro %}
```
### 🔍 Example: Surrogate Key Macro

```sql
SELECT
    {{ generate_surrogate_key(['customer_id', 'order_date']) }} as sales_key,
    *
FROM {{ ref('stg_orders') }}
```
```sql
SELECT {{ generate_surrogate_key(['customer_id', 'order_date']) }} AS sk_customer_order
```

---

## 🏗️ Features

- 🔄 **ELT Pipelines** using dbt models (staging ➝ intermediate ➝ marts)
- 📦 Fact & Dimension Models
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
## 🗺️ Roadmap

- ✔ Build staging and intermediate layers  
- ✔ Create facts and dimensions  
- ✔ Add documentation and tests  
- ✔ Add more snapshots (e.g., slowly changing dimensions)  
- ☐ Deploy and schedule in Fabric / ADF  
- ☐ Add CI/CD pipeline via GitHub Actions  
---
## 🛠️ Installation & Usage

### Clone repository
git clone https://github.com/your-repo/AdventureWorks_DWH.git
cd AdventureWorks_DWH

### Create virtual environment
 python -m venv venv
 venv\Scripts\activate  # Windows

### Install dependencies
 pip install dbt-core dbt-fabric 

### Run all models
 dbt run 

### Run specific models
 dbt run --select stg_customers+ 

### Run tests
 dbt test 

### Generate documentation
dbt docs generate
dbt docs serve 
