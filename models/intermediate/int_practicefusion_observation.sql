
select 
	cast(vital_id as {{dbt.type_string()}}) as condition_id,
    cast(null as {{dbt.type_string()}}) as person_id,
	cast(patient_id as {{dbt.type_string()}}) as patient_id,
	cast(encounter_id as {{dbt.type_string()}}) as encounter_id,
    cast(panel_id as {{dbt.type_string()}}) as panel_id,
    case when trim(substring(observation_datetime, 1, 8)) not like '%-%' and trim(substring(observation_datetime, 1, 8)) not like '%/%' then to_date(trim(substring(observation_datetime, 1, 8)), 'yyyyMMdd')
 		 else null
    end as observation_date,
    cast(observation_type as {{dbt.type_string()}}) as observation_type,
    cast(source_code_type as {{dbt.type_string()}}) as source_code_type,
    cast(source_code as {{dbt.type_string()}}) as source_code,
    cast(source_description as {{dbt.type_string()}}) as source_description,
    cast(null as {{dbt.type_string()}}) as normalized_code_type,
    cast(null as {{dbt.type_string()}}) as normalized_code,
    cast(null as {{dbt.type_string()}}) as normalized_description,
    result as result,
    cast(result_units as {{dbt.type_string()}}) as source_units,
    cast(null as {{dbt.type_string()}}) as normalized_units,
    cast(reference_range_low as {{dbt.type_string()}}) as source_reference_range_low,
    cast(reference_range_high as {{dbt.type_string()}}) as source_reference_range_high,
    cast(null as {{dbt.type_string()}}) as normalized_reference_range_low,
    cast(null as {{dbt.type_string()}}) as normalized_reference_range_high,
    'practicefusion' as data_source,
    cast(_file_name as {{dbt.type_string()}}) as file_name,
    cast(_run_time as {{dbt.type_string()}}) as ingest_datetime
from {{ ref('stg_practicefusion_vitals') }}