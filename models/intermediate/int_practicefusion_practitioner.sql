select 
    cast(practitioner_id as {{dbt.type_string()}}) as practitioner_id,
    cast(npi as {{dbt.type_string()}}) as npi,
    cast(first_name as {{dbt.type_string()}}) as first_name,
    cast(last_name as {{dbt.type_string()}}) as last_name, 
    cast(practice_affiliation as {{dbt.type_string()}}) as practice_affiliation, 
    cast(specialty as {{dbt.type_string()}}) as specialty, 
    cast(subspecialty as {{dbt.type_string()}}) as sub_specialty, 
    cast('practicefusion' as {{dbt.type_string()}}) as data_source, 
    cast(_file_name as {{ dbt.type_string() }}) as filename,
    _run_time as ingest_datetime

    FROM {{ ref('stg_practicefusion_practitioner') }}
