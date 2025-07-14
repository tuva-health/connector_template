select 
    coalesce(procedure.procedure_id, uuid()) as procedure_id, 
    cast(coalesce(mpi.mpi_id, concat('practicefusion_', procedure.patient_id)) as {{dbt.type_string()}}) as person_id,
    cast(procedure.patient_id as {{ dbt.type_string() }}) as patient_id,
    cast(procedure.encounter_id as {{ dbt.type_string() }}) as encounter_id,
    cast(null as {{ dbt.type_string() }}) as claim_id,
    CASE 
        WHEN LENGTH(TRIM(substring(procedure.procedure_date, 1, 8))) = 8 AND TRIM(substring(procedure.procedure_date, 1, 8)) NOT LIKE '%-%' AND TRIM(substring(procedure.procedure_date, 1, 8)) NOT LIKE '%/%' 
        THEN to_date(TRIM(substring(procedure.procedure_date, 1, 8)), 'yyyyMMdd') 
    END AS procedure_date,
    cast(procedure.source_code_type as {{ dbt.type_string() }}) as source_code_type, 
    cast(procedure.source_code as {{ dbt.type_string() }}) as source_code,
    cast(procedure.source_description as {{ dbt.type_string() }}) as source_description,
    cast(null as {{ dbt.type_string() }}) as normalized_code_type,
    cast(null as {{ dbt.type_string() }}) as normalized_code,
    cast(null as {{ dbt.type_string() }}) as normalized_description,
    cast(null as {{ dbt.type_string() }}) as modifier_1,
    cast(null as {{ dbt.type_string() }}) as modifier_2,
    cast(null as {{ dbt.type_string() }}) as modifier_3,
    cast(null as {{ dbt.type_string() }}) as modifier_4,
    cast(null as {{ dbt.type_string() }}) as modifier_5,
    cast(procedure.practitioner_id as {{ dbt.type_string() }}) as practitioner_id,
    cast(concat('practicefusion - ', procedure.practice_name) as {{dbt.type_string()}}) as data_source,
    cast(procedure._file_name as {{ dbt.type_string() }}) as file_name,
    procedure._run_time as ingest_datetime
    from {{ ref('stg_practicefusion_procedure') }} procedure
    left join {{ ref('stg_patient_mpi_map') }} mpi
        on procedure.patient_id = mpi.patient_id
