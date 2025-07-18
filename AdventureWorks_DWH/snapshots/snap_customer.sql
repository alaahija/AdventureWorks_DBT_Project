{% snapshot snap_customer %}
{{
  config(
    target_schema='snapshots',
    unique_key='employee_id',
    strategy='check',
    check_cols=[ 'marital_status', 'job_title']
  )
}}

select * from {{ ref('stg_employee') }}

{% endsnapshot %}
