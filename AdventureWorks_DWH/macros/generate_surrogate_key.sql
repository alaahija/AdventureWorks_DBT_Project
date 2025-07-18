{% macro generate_surrogate_key(fields) %}
    cast(
        convert(
            varchar(32),
            hashbytes('SHA1', concat({{ fields | join(" , ") }})),
            2
        ) as varchar(50)
    )
{% endmacro %}
