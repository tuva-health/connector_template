
select 
	cast(vitals.vital_id as {{dbt.type_string()}}) as observation_id,
    cast(coalesce(mpi.mpi_id, concat('practicefusion_', vitals.patient_id)) as {{dbt.type_string()}}) as person_id,
	cast(vitals.patient_id as {{dbt.type_string()}}) as patient_id,
	cast(vitals.encounter_id as {{dbt.type_string()}}) as encounter_id,
    cast(vitals.panel_id as {{dbt.type_string()}}) as panel_id,
    case when trim(substring(vitals.observation_datetime, 1, 8)) not like '%-%' and trim(substring(vitals.observation_datetime, 1, 8)) not like '%/%' then to_date(trim(substring(vitals.observation_datetime, 1, 8)), 'yyyyMMdd')
 		 else null
    end as observation_date,
    cast(vitals.observation_type as {{dbt.type_string()}}) as observation_type,
    cast(vitals.source_code_type as {{dbt.type_string()}}) as source_code_type,
    cast(vitals.source_code as {{dbt.type_string()}}) as source_code,
    cast(vitals.source_description as {{dbt.type_string()}}) as source_description,
    cast(null as {{dbt.type_string()}}) as normalized_code_type,
    cast(null as {{dbt.type_string()}}) as normalized_code,
    cast(null as {{dbt.type_string()}}) as normalized_description,
    result as result,
    cast(vitals.result_units as {{dbt.type_string()}}) as source_units,
    cast(null as {{dbt.type_string()}}) as normalized_units,
    cast(vitals.reference_range_low as {{dbt.type_string()}}) as source_reference_range_low,
    cast(vitals.reference_range_high as {{dbt.type_string()}}) as source_reference_range_high,
    cast(null as {{dbt.type_string()}}) as normalized_reference_range_low,
    cast(null as {{dbt.type_string()}}) as normalized_reference_range_high,
    'practicefusion' as data_source,
    cast(vitals._file_name as {{dbt.type_string()}}) as file_name,
    cast(vitals._run_time as {{dbt.type_string()}}) as ingest_datetime
from {{ ref('stg_practicefusion_vitals') }} vitals
left join {{ ref('stg_patient_mpi_map') }} mpi
    on vitals.patient_id = mpi.patient_id