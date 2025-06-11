with all_data as (
select 
	cast(coalesce(medication_id, uuid()) as {{dbt.type_string()}}) as medication_id,
	cast(null as {{dbt.type_string()}}) as person_id,
	cast(patient_id as {{dbt.type_string()}}) as patient_id,
	cast(encounter_id as {{dbt.type_string()}}) as encounter_id,
	cast(null as {{ dbt.type_string()}}) as dispensing_date,
    case
      when trim(substring(start_date, 1, 8)) not like '%-%' 
		    and trim(substring(start_date, 1, 8)) not like '%/%' 
	  then to_date(trim(substring(start_date, 1, 8)), 'yyyyMMdd')
      else null
    end as prescribing_date,
	cast(lower(source_code_type) as {{ dbt.type_string() }}) as source_code_type,
	cast(source_code as {{ dbt.type_string() }}) as source_code,
	cast(med_display_name as {{ dbt.type_string() }}) as source_description,
	cast(case
            when source_code_type = 'ndc' then source_code
            else null
        end as {{dbt.type_string()}}) as ndc_code,
	cast(case
            when source_code_type = 'ndc' then med_display_name
            else null
        end as {{dbt.type_string()}}) as ndc_description,
	cast(case
            when lower(source_code_type) = 'rxnorm' then source_code
            else null
        end as {{dbt.type_string()}}) as rxnorm_code,
	cast(case
            when lower(source_code_type) = 'rxnorm' then med_display_name
            else null
        end as {{dbt.type_string()}}) as rxnorm_description,
	cast(null as {{dbt.type_string()}}) as atc_code,
	cast(null as {{dbt.type_string()}}) as atc_description,
	cast(route as {{dbt.type_string()}}) as route,
	cast(dose as {{dbt.type_string()}}) as strength,
	cast(quantity as {{ dbt.type_string() }}) as quantity,
	cast(quantity_unit as {{ dbt.type_string() }}) as quantity_unit,
	cast(null as {{dbt.type_string()}}) as days_supply,
	cast(practitioner_id as {{dbt.type_string()}}) as practitioner_id,
    cast('practicefusion' as {{dbt.type_string()}}) as data_source,
    cast(_file_name as {{dbt.type_string()}}) as file_name,
    _run_time as ingest_datetime
    from {{ ref('stg_practicefusion_medication') }}
)
-- sometimes the same medication row is ingested more than once, just on different dates, so only pull the most recent one.
select medication_id,
       person_id,
       patient_id,
       encounter_id,
       dispensing_date,
       prescribing_date,
       source_code_type,
       source_code,
       source_description,
       ndc_code,
       ndc_description,
       rxnorm_code,
       rxnorm_description,
       atc_code,
       atc_description,
       route,
       strength,
       quantity,
       quantity_unit,
       days_supply,
       practitioner_id,
       data_source,
       file_name,
       ingest_datetime,
       row_number() OVER(PARTITION BY medication_id ORDER BY ingest_datetime desc) as row_number
       from all_data
