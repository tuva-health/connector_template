{{ config(
     enabled = var('claims_enabled', false) | as_bool
   )
}}

-- If you need to cast columns, do it here. Staging should only handle casting.
select
    cast(person_id as {{ dbt.type_string() }}) as person_id
  , cast(member_id as {{ dbt.type_string() }}) as member_id
  , cast(subscriber_id as {{ dbt.type_string() }}) as subscriber_id
  , cast(gender as {{ dbt.type_string() }}) as gender
  , cast(race as {{ dbt.type_string() }}) as race
  , cast(birth_date as date) as birth_date
  , cast(death_date as date) as death_date
  , cast(death_flag as {{ dbt.type_int() }}) as death_flag
  , cast(enrollment_start_date as date) as enrollment_start_date
  , cast(enrollment_end_date as date) as enrollment_end_date
  , cast(payer as {{ dbt.type_string() }}) as payer
  , cast(payer_type as {{ dbt.type_string() }}) as payer_type
  , cast(plan as {{ dbt.type_string() }}) as plan
  , cast(original_reason_entitlement_code as {{ dbt.type_string() }}) as original_reason_entitlement_code
  , cast(dual_status_code as {{ dbt.type_string() }}) as dual_status_code
  , cast(medicare_status_code as {{ dbt.type_string() }}) as medicare_status_code
  , cast(enrollment_status as {{ dbt.type_string() }}) as enrollment_status
  , cast(hospice_flag as {{ dbt.type_int() }}) as hospice_flag
  , cast(case when snp_type = 'I-SNP' then 1 else 0 end as {{ dbt.type_int() }}) as institutional_snp_flag
  , cast(long_term_institutional_flag as {{ dbt.type_int() }}) as long_term_institutional_flag
  , cast(group_id as {{ dbt.type_string() }}) as group_id
  , cast(group_name as {{ dbt.type_string() }}) as group_name
  , cast(name_suffix as {{ dbt.type_string() }}) as name_suffix
  , cast(first_name as {{ dbt.type_string() }}) as first_name
  , cast(middle_name as {{ dbt.type_string() }}) as middle_name
  , cast(last_name as {{ dbt.type_string() }}) as last_name
  , cast(social_security_number as {{ dbt.type_string() }}) as social_security_number
  , cast(subscriber_relation as {{ dbt.type_string() }}) as subscriber_relation
  , cast(address as {{ dbt.type_string() }}) as address
  , cast(city as {{ dbt.type_string() }}) as city
  , cast(state as {{ dbt.type_string() }}) as state
  , cast(zip_code as {{ dbt.type_string() }}) as zip_code
  , cast(phone as {{ dbt.type_string() }}) as phone
  , cast(email as {{ dbt.type_string() }}) as email
  , cast(ethnicity as {{ dbt.type_string() }}) as ethnicity
  , cast(data_source as {{ dbt.type_string() }}) as data_source
  , cast(file_name as {{ dbt.type_string() }}) as file_name
  , cast(file_date as {{ dbt.type_timestamp() }}) as file_date
  , cast(ingest_datetime as {{ dbt.type_timestamp() }}) as ingest_datetime
from {{ source('source_input', 'eligibility') }}
