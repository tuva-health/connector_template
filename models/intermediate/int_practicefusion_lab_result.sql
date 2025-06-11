select  
    lab_result.lab_result_id as lab_result_id,
    cast(null as {{ dbt.type_string() }}) as person_id,
    lab_result.patient_id as patient_id,
    cast(lab_result.encounter_id as {{ dbt.type_string() }}) as encounter_id,
    lab_result.accession_number as accession_number,
    lab_result.source_code_type as source_code_type,
    lab_result.source_code as source_code,
    lab_result.source_description as source_description,
    cast(source_component as {{ dbt.type_string() }}) as source_component,
    cast(null as {{ dbt.type_string() }}) as normalized_code_type,
    cast(null as {{ dbt.type_string() }}) as normalized_code,
    cast(null as {{ dbt.type_string() }}) as normalized_description,
    cast(null as {{ dbt.type_string() }}) as normalized_component,
    lab_result.status as status,
    lab_result.result as result,
    CASE 
        WHEN LENGTH(TRIM(substring(lab_result.result_date, 1, 8))) = 8 
             AND TRIM(substring(lab_result.result_date, 1, 8)) NOT LIKE '%-%' 
             AND TRIM(substring(lab_result.result_date, 1, 8)) NOT LIKE '%/%' 
        THEN TO_DATE(TRIM(substring(lab_result.result_date, 1, 8)), 'yyyyMMdd')
        ELSE NULL
    END AS result_date,
    CASE 
        WHEN LENGTH(TRIM(substring(lab_result.collection_date, 1, 8))) = 8 
             AND TRIM(substring(lab_result.collection_date, 1, 8)) NOT LIKE '%-%' 
             AND TRIM(substring(lab_result.collection_date, 1, 8)) NOT LIKE '%/%'
             AND substring(lab_result.collection_date, 1, 8) != '00000000'
        THEN to_date(TRIM(substring(lab_result.collection_date, 1, 8)), 'yyyyMMdd')
        ELSE null
    END AS collection_date,
    lab_result.reference_range_low as source_reference_range_low,
    lab_result.reference_range_high as source_reference_range_high,
    lab_result.result_units as source_units,
    cast(null as {{ dbt.type_string() }}) as normalized_units,
    cast(null as {{ dbt.type_string() }}) as normalized_reference_range_low,
    cast(null as {{ dbt.type_string() }}) as normalized_reference_range_high,
    lab_result.abnormal_flag as source_abnormal_flag,
    cast(null as {{ dbt.type_string() }}) as normalized_abnormal_flag,
    cast(null as {{ dbt.type_string() }}) as specimen,
    cast(lab_result.practitioner_id as {{ dbt.type_string() }}) as ordering_practitioner_id,
    cast('practicefusion' as {{ dbt.type_string() }}) as data_source,
    cast(lab_result._file_name as {{ dbt.type_string() }}) as file_name,
    lab_result._run_time as ingest_datetime
from {{ ref('stg_practicefusion_lab_result') }} lab_result
