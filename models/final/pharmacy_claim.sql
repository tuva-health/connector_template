select {% if target.type == 'fabric' %} top 0 {% else %}{% endif %}
      cast(null as {{ dbt.type_string() }}) as claim_id
    , cast(null as {{ dbt.type_int() }}) as claim_line_number
    , cast(null as {{ dbt.type_string() }}) as person_id
    , cast(null as {{ dbt.type_string() }}) as member_id
    , cast(null as {{ dbt.type_string() }}) as payer
    , cast(null as {{ dbt.type_string() }}) as plan
    , cast(null as {{ dbt.type_string() }}) as prescribing_provider_npi
    , cast(null as {{ dbt.type_string() }}) as dispensing_provider_npi
    , cast(null as date) as dispensing_date
    , cast(null as {{ dbt.type_string() }}) as ndc_code
    , cast(null as {{ dbt.type_int() }}) as quantity
    , cast(null as {{ dbt.type_int() }}) as days_supply
    , cast(null as {{ dbt.type_int() }}) as refills
    , cast(null as date) as paid_date
    , cast(null as {{ dbt.type_float() }}) as paid_amount
    , cast(null as {{ dbt.type_float() }}) as allowed_amount
    , cast(null as {{ dbt.type_float() }}) as charge_amount
    , cast(null as {{ dbt.type_float() }}) as coinsurance_amount
    , cast(null as {{ dbt.type_float() }}) as copayment_amount
    , cast(null as {{ dbt.type_float() }}) as deductible_amount
    , cast(null as {{ dbt.type_int() }}) as in_network_flag
    , cast(null as {{ dbt.type_string() }}) as data_source
    , cast(null as {{ dbt.type_string() }}) as file_name
    , cast(null as date) as file_date
    , cast(null as {{ dbt.type_timestamp() }}) as ingest_datetime
{% if target.type == 'fabric' %} {% else %} limit 0 {% endif %}
