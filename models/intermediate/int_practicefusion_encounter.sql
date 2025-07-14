SELECT
    CAST(encounter.encounter_id AS {{ dbt.type_string() }}) AS encounter_id,
    cast(coalesce(mpi.mpi_id, concat('practicefusion_', encounter.patient_id)) as {{dbt.type_string()}}) as person_id,
    CAST(encounter.patient_id AS {{ dbt.type_string() }}) AS patient_id,
    CAST(encounter.encounter_type AS {{ dbt.type_string() }}) AS encounter_type,
    CASE 
        WHEN LENGTH(TRIM(substring(encounter.start_date, 1, 8))) = 8 
             AND TRIM(substring(encounter.start_date, 1, 8)) NOT LIKE '%-%' 
             AND TRIM(substring(encounter.start_date, 1, 8)) NOT LIKE '%/%' 
        THEN TO_DATE(TRIM(substring(encounter.start_date, 1, 8)), 'yyyyMMdd')
        ELSE NULL
    END AS encounter_start_date,
    CASE 
        WHEN LENGTH(TRIM(substring(encounter.end_date, 1, 8))) = 8 
             AND TRIM(substring(encounter.end_date, 1, 8)) NOT LIKE '%-%' 
             AND TRIM(substring(encounter.end_date, 1, 8)) NOT LIKE '%/%' 
        THEN TO_DATE(TRIM(substring(encounter.end_date, 1, 8)), 'yyyyMMdd')
        ELSE NULL
    END AS encounter_end_date,
	CAST(extract(day from (TO_DATE(TRIM(substring(encounter.end_date, 1, 8)), 'yyyyMMdd') - TO_DATE(TRIM(substring(encounter.start_date, 1, 8)), 'yyyyMMdd'))) AS INT) AS length_of_stay,
    CAST(encounter.admit_source_code AS {{ dbt.type_string() }}) AS admit_source_code,
    CAST(encounter.admit_source_description AS {{ dbt.type_string() }}) AS admit_source_description,
    CAST(encounter.admit_type_code AS {{ dbt.type_string() }}) AS admit_type_code,
    CAST(encounter.admit_type_description AS {{ dbt.type_string() }}) AS admit_type_description,
    CAST(encounter.discharge_disposition_code AS {{ dbt.type_string() }}) AS discharge_disposition_code,
    CAST(encounter.discharge_disposition_description AS {{ dbt.type_string() }}) AS discharge_disposition_description,
    CAST(encounter.attending_practitioner_id AS {{ dbt.type_string() }}) AS attending_provider_id,
    CAST(encounter.attending_practitioner_name AS {{ dbt.type_string() }}) AS attending_provider_name,
    CAST(encounter.facility_id AS {{ dbt.type_string() }}) AS facility_id,
    CAST(encounter.facility_name AS {{ dbt.type_string() }}) AS facility_name,
    CAST(encounter.primary_diagnosis_code AS {{ dbt.type_string() }}) AS primary_diagnosis_code_type,
    CAST(encounter.primary_diagnosis_code_type AS {{ dbt.type_string() }}) AS primary_diagnosis_code,
    CAST(encounter.primary_diagnosis_description AS {{ dbt.type_string() }}) AS primary_diagnosis_description,
    CAST(NULL AS {{ dbt.type_string() }}) AS drg_code_type,
    CAST(NULL AS {{ dbt.type_string() }}) AS drg_code,
    CAST(NULL AS {{ dbt.type_string() }}) AS drg_description,
    CAST(NULL AS NUMERIC) paid_amount,
    TRY_CAST(null AS NUMERIC) AS allowed_amount,
    TRY_CAST(null AS NUMERIC) AS charge_amount,
    cast(concat('practicefusion - ', encounter.practice_name) as {{dbt.type_string()}}) as data_source,
    CAST(encounter._file_name AS {{ dbt.type_string() }}) AS file_name,
    encounter._run_time AS ingest_datetime
FROM {{ ref('stg_practicefusion_encounter') }} encounter
left join {{ ref('stg_patient_mpi_map') }} mpi
    on encounter.patient_id = mpi.patient_id
