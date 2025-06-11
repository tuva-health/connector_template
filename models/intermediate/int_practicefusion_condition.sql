select
	cast(diagnosis.diagnosis_id as {{dbt.type_string()}}) as condition_id,
    cast(null as {{dbt.type_string()}}) as person_id,
	cast(diagnosis.patient_id as {{dbt.type_string()}}) as patient_id,
	cast(diagnosis.encounter_id as {{dbt.type_string()}}) as encounter_id,
	cast(null as {{dbt.type_string()}}) as claim_id,
	CASE WHEN LENGTH(TRIM(substring(diagnosis.recorded_datetime, 1, 8))) = 8 AND TRIM(substring(diagnosis.recorded_datetime, 1, 8)) NOT LIKE '%-%' AND TRIM(substring(diagnosis.recorded_datetime, 1, 8)) NOT LIKE '%/%' THEN to_date(substring(diagnosis.recorded_datetime, 1, 8), 'yyyyMMdd')
		ELSE NULL
    END AS recorded_date,
	CASE WHEN LENGTH(TRIM(diagnosis.start_date)) = 8 AND TRIM(diagnosis.start_date) NOT LIKE '%-%' AND TRIM(diagnosis.start_date) NOT LIKE '%/%' THEN to_date(TRIM(diagnosis.start_date), 'yyyyMMdd')
	     WHEN TRIM(diagnosis.start_date) rlike '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN to_date(TRIM(diagnosis.start_date), 'yyyy-MM-dd')
 	     WHEN TRIM(diagnosis.start_date) rlike '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN to_date(TRIM(diagnosis.start_date), 'MM/dd/yyyy')
 		 ELSE NULL
	END AS onset_date,
	CASE WHEN LENGTH(TRIM(diagnosis.end_date)) = 8 AND TRIM(diagnosis.end_date) NOT LIKE '%-%' AND TRIM(diagnosis.end_date) NOT LIKE '%/%' THEN to_date(TRIM(diagnosis.end_date), 'yyyyMMdd')
		 WHEN TRIM(diagnosis.end_date) rlike '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN to_date(TRIM(diagnosis.end_date), 'yyyy-MM-dd')
 	     WHEN TRIM(diagnosis.end_date) rlike '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN to_date(TRIM(diagnosis.end_date), 'MM/dd/yyyy')
 		 ELSE NULL
	END AS resolved_date,
	cast(null as {{dbt.type_string()}}) as status,
	cast('diagnosis'  as {{dbt.type_string()}}) as condition_type,
	cast(diagnosis.diagnosis_code_system as {{dbt.type_string()}}) as source_code_type,
	diagnosis.diagnosis_code as source_code,
	cast(diagnosis.diagnosis_name as {{dbt.type_string()}}) as source_description,
	cast(null as {{dbt.type_string()}}) as normalized_code_type,
	cast(null as {{dbt.type_string()}}) as normalized_code,
	cast(null as {{dbt.type_string()}}) as normalized_description,
	cast(null as int) as condition_rank,
	cast(null as {{dbt.type_string()}}) as present_on_admit_code,
	cast(null as {{dbt.type_string()}}) as present_on_admit_description,
    cast('practicefusion' as {{dbt.type_string()}}) as data_source,
    cast(null as {{dbt.type_string()}}) AS file_name,
    diagnosis._run_time AS ingest_datetime	 
from {{ ref('stg_practicefusion_condition_diagnoses') }} diagnosis 

union all

select
	cast(problem_list.condition_id as {{dbt.type_string()}}) as condition_id,
    cast(null as {{dbt.type_string()}}) as person_id,
	cast(problem_list.patient_id as {{dbt.type_string()}}) as patient_id,
	cast(problem_list.encounter_id as {{dbt.type_string()}}) as encounter_id,
	cast(null as {{dbt.type_string()}}) as claim_id,
	CASE WHEN LENGTH(TRIM(substring(problem_list.recorded_datetime, 1, 8))) = 8 AND TRIM(substring(problem_list.recorded_datetime, 1, 8)) NOT LIKE '%-%' AND TRIM(substring(problem_list.recorded_datetime, 1, 8)) NOT LIKE '%/%' THEN to_date(substring(problem_list.recorded_datetime, 1, 8), 'yyyyMMdd')
 		ELSE NULL
    END AS recorded_date,
	CASE WHEN LENGTH(TRIM(substring(problem_list.start_date, 1, 8))) = 8 AND TRIM(substring(problem_list.start_date, 1, 8)) NOT LIKE '%-%' AND TRIM(substring(problem_list.start_date, 1, 8)) NOT LIKE '%/%' THEN to_date(TRIM(substring(problem_list.start_date, 1, 8)), 'yyyyMMdd')
		ELSE NULL
	END AS onset_date,
	CASE WHEN LENGTH(TRIM(substring(problem_list.stop_date, 1, 8))) = 8 AND TRIM(substring(problem_list.stop_date, 1, 8)) NOT LIKE '%-%' AND TRIM(substring(problem_list.stop_date, 1, 8)) NOT LIKE '%/%' THEN to_date(TRIM(substring(problem_list.stop_date, 1, 8)), 'yyyyMMdd')
		ELSE NULL
	END AS resolved_date,
	cast(null as {{dbt.type_string()}}) as status,
	cast('problem_list'  as {{dbt.type_string()}}) as condition_type,
	cast(problem_list.condition_code_system as {{dbt.type_string()}}) as source_code_type,
	problem_list.condition_code as source_code,
	cast(problem_list.condition_name as {{dbt.type_string()}}) as source_description,
	cast(null as {{dbt.type_string()}}) as normalized_code_type,
	cast(null as {{dbt.type_string()}}) as normalized_code,
	cast(null as {{dbt.type_string()}}) as normalized_description,
	cast(null as int) as condition_rank,
	cast(null as {{dbt.type_string()}}) as present_on_admit_code,
	cast(null as {{dbt.type_string()}}) as present_on_admit_description,
    cast('practicefusion' as {{dbt.type_string()}}) as data_source,
    cast(null as {{dbt.type_string()}}) AS file_name,
    problem_list._run_time AS ingest_datetime	 
from {{ ref('stg_practicefusion_condition_problem_list') }} problem_list
