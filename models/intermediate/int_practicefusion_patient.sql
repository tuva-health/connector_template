select 
    cast(null as {{dbt.type_string()}}) as person_id,
    cast(patient_id as {{dbt.type_string()}}) as patient_id,
    cast(first_name as {{dbt.type_string()}}) as first_name,
    cast(last_name as {{dbt.type_string()}}) as last_name,
    cast(sex as {{dbt.type_string()}})  as sex,
    cast(race  as {{dbt.type_string()}}) as race,
    CASE 
        WHEN LENGTH(TRIM(birth_date)) = 8 AND TRIM(birth_date) NOT LIKE '%-%' AND TRIM(birth_date) NOT LIKE '%/%' THEN to_date(TRIM(birth_date), 'yyyyMMdd')
        ELSE null 
    END as birth_date,
    CASE 
        WHEN LENGTH(TRIM(death_date)) = 8 AND TRIM(death_date) NOT LIKE '%-%' AND TRIM(death_date) NOT LIKE '%/%' THEN to_date(TRIM(death_date), 'yyyyMMdd')
        ELSE null 
    END as death_date,
    cast(death_flag as {{dbt.type_string()}}) as death_flag,
    cast(social_security_number as {{dbt.type_string()}}) as social_security_number,
    cast(address_line as {{dbt.type_string()}}) as address,
    cast(initcap(city) as {{dbt.type_string()}}) as city,
    cast(state as {{dbt.type_string()}}) as state,
    cast(zip_code as {{dbt.type_string()}}) as zip_code, 
    cast(county as {{dbt.type_string()}}) as county,
    cast(null as {{dbt.type_string()}}) as latitude,  
    cast(null as {{dbt.type_string()}}) as longitude,
    cast(phone_number as {{dbt.type_string()}}) as phone,
    cast('practicefusion' as {{dbt.type_string()}}) as data_source,
    cast(_file_name as {{dbt.type_string()}}) AS file_name,
    _run_time AS ingest_datetime

FROM {{ ref('stg_practicefusion_patient') }}
