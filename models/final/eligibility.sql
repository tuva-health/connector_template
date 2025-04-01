select {% if target.type == 'fabric' %} top 0 {% else %}{% endif %}
      cast(null as {{ dbt.type_string() }}) as person_id
    , cast(null as {{ dbt.type_string() }}) as member_id
    , cast(null as {{ dbt.type_string() }}) as subscriber_id
    , cast(null as {{ dbt.type_string() }}) as gender
    , cast(null as {{ dbt.type_string() }}) as race
    , cast(null as {{ dbt.type_string() }}) as birth_date
    , cast(null as {{ dbt.type_string() }}) as death_date
    , cast(null as {{ dbt.type_string() }}) as death_flag
    , cast(null as {{ dbt.type_string() }}) as enrollment_start_date
    , cast(null as {{ dbt.type_string() }}) as enrollment_end_date
    , cast(null as {{ dbt.type_string() }}) as payer
    , cast(null as {{ dbt.type_string() }}) as payer_type
    , cast(null as {{ dbt.type_string() }}) as plan
    , cast(null as {{ dbt.type_string() }}) as original_reason_entitlement_code
    , cast(null as {{ dbt.type_string() }}) as dual_status_code
    , cast(null as {{ dbt.type_string() }}) as medicare_status_code
    , cast(null as {{ dbt.type_string() }}) as group_id
    , cast(null as {{ dbt.type_string() }}) as group_name
    , cast(null as {{ dbt.type_string() }}) as first_name
    , cast(null as {{ dbt.type_string() }}) as last_name
    , cast(null as {{ dbt.type_string() }}) as social_security_number
    , cast(null as {{ dbt.type_string() }}) as subscriber_relation
    , cast(null as {{ dbt.type_string() }}) as address
    , cast(null as {{ dbt.type_string() }}) as city
    , cast(null as {{ dbt.type_string() }}) as state
    , cast(null as {{ dbt.type_string() }}) as zip_code
    , cast(null as {{ dbt.type_string() }}) as phone
    , cast(null as {{ dbt.type_string() }}) as data_source
    , cast(null as {{ dbt.type_string() }}) as file_name
    , cast(null as {{ dbt.type_string() }}) as file_date
    , cast(null as {{ dbt.type_string() }}) as ingest_datetime
{% if target.type == 'fabric' %} {% else %} limit 0 {% endif %}
