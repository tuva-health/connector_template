select 
    coalesce(procedure_id, uuid()) as procedure_id, 
    cast(null as {{ dbt.type_string() }}) as person_id,
    cast(patient_id as {{ dbt.type_string() }}) as patient_id,
    cast(encounter_id as {{ dbt.type_string() }}) as encounter_id,
    cast(null as {{ dbt.type_string() }}) as claim_id,
    CASE 
        WHEN LENGTH(TRIM(substring(procedure_date, 1, 8))) = 8 AND TRIM(substring(procedure_date, 1, 8)) NOT LIKE '%-%' AND TRIM(substring(procedure_date, 1, 8)) NOT LIKE '%/%' 
        THEN to_date(TRIM(substring(procedure_date, 1, 8)), 'yyyyMMdd') 
    END AS procedure_date,
    cast(source_code_type as {{ dbt.type_string() }}) as source_code_type, 
    source_code as source_code,
    cast(source_description as {{ dbt.type_string() }}) as source_description,
    cast(null as {{ dbt.type_string() }}) as normalized_code_type,
    cast(null as {{ dbt.type_string() }}) as normalized_code,
    cast(null as {{ dbt.type_string() }}) as normalized_description,
    cast(null as {{ dbt.type_string() }}) as modifier_1,
    cast(null as {{ dbt.type_string() }}) as modifier_2,
    cast(null as {{ dbt.type_string() }}) as modifier_3,
    cast(null as {{ dbt.type_string() }}) as modifier_4,
    cast(null as {{ dbt.type_string() }}) as modifier_5,
    cast(practitioner_id as {{ dbt.type_string() }}) as practitioner_id,
    cast('practicefusion' as {{ dbt.type_string() }}) as data_source,
    cast(_file_name as {{ dbt.type_string() }}) as file_name,
    _run_time as ingest_datetime
    from {{ ref('stg_practicefusion_procedure') }}
