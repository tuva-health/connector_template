select 
    cast(coalesce(mpi.mpi_id, concat('practicefusion_', patient.patient_id)) as {{dbt.type_string()}}) as person_id,
    cast(patient.patient_id as {{dbt.type_string()}}) as patient_id,
    cast(patient.first_name as {{dbt.type_string()}}) as first_name,
    cast(patient.last_name as {{dbt.type_string()}}) as last_name,
    cast(patient.sex as {{dbt.type_string()}})  as sex,
    cast(patient.race  as {{dbt.type_string()}}) as race,
    CASE 
        WHEN LENGTH(TRIM(patient.birth_date)) = 8 AND TRIM(patient.birth_date) NOT LIKE '%-%' AND TRIM(patient.birth_date) NOT LIKE '%/%' THEN to_date(TRIM(patient.birth_date), 'yyyyMMdd')
        ELSE null 
    END as birth_date,
    CASE 
        WHEN LENGTH(TRIM(patient.death_date)) = 8 AND TRIM(patient.death_date) NOT LIKE '%-%' AND TRIM(patient.death_date) NOT LIKE '%/%' THEN to_date(TRIM(patient.death_date), 'yyyyMMdd')
        ELSE null 
    END as death_date,
    cast(patient.death_flag as {{dbt.type_string()}}) as death_flag,
    cast(patient.social_security_number as {{dbt.type_string()}}) as social_security_number,
    cast(patient.address as {{dbt.type_string()}}) as address,
    cast(initcap(patient.city) as {{dbt.type_string()}}) as city,
    cast(patient.state as {{dbt.type_string()}}) as state,
    cast(patient.zip_code as {{dbt.type_string()}}) as zip_code, 
    cast(patient.county as {{dbt.type_string()}}) as county,
    cast(null as {{dbt.type_string()}}) as latitude,  
    cast(null as {{dbt.type_string()}}) as longitude,
    cast(patient.phone_number as {{dbt.type_string()}}) as phone,
    cast(concat('practicefusion - ', patient.practice_name) as {{dbt.type_string()}}) as data_source,
    cast(patient._file_name as {{dbt.type_string()}}) AS file_name,
    patient._run_time AS ingest_datetime

FROM {{ ref('stg_practicefusion_patient') }} patient
left join {{ ref('stg_patient_mpi_map') }} mpi
    on patient.patient_id = mpi.patient_id
