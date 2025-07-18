SELECT
    e.BusinessEntityID AS employee_id,
    e.NationalIDNumber AS national_id,
    e.JobTitle         AS job_title,
    e.HireDate         AS hire_date,
    e.Gender           AS gender,
    e.ModifiedDate     AS employee_modified_date,
    e.MaritalStatus    AS marital_status
FROM {{ source('raw', 'employee') }} AS e
