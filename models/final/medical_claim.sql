select {% if target.type == 'fabric' %} top 0 {% else %}{% endif %}
      cast(null as {{ dbt.type_string() }}) as claim_id
    , cast(null as {{ dbt.type_int() }}) as claim_line_number
    , cast(null as {{ dbt.type_string() }}) as claim_type
    , cast(null as {{ dbt.type_string() }}) as person_id
    , cast(null as {{ dbt.type_string() }}) as member_id
    , cast(null as {{ dbt.type_string() }}) as payer
    , cast(null as {{ dbt.type_string() }}) as plan
    , cast(null as date) as claim_start_date
    , cast(null as date) as claim_end_date
    , cast(null as date) as claim_line_start_date
    , cast(null as date) as claim_line_end_date
    , cast(null as date) as admission_date
    , cast(null as date) as discharge_date
    , cast(null as {{ dbt.type_string() }}) as admit_source_code
    , cast(null as {{ dbt.type_string() }}) as admit_type_code
    , cast(null as {{ dbt.type_string() }}) as discharge_disposition_code
    , cast(null as {{ dbt.type_string() }}) as place_of_service_code
    , cast(null as {{ dbt.type_string() }}) as bill_type_code
    , cast(null as {{ dbt.type_string() }}) as drg_code_type
    , cast(null as {{ dbt.type_string() }}) as drg_code
    , cast(null as {{ dbt.type_string() }}) as revenue_center_code
    , cast(null as {{ dbt.type_numeric() }}) as service_unit_quantity
    , cast(null as {{ dbt.type_string() }}) as hcpcs_code
    , cast(null as {{ dbt.type_string() }}) as hcpcs_modifier_1
    , cast(null as {{ dbt.type_string() }}) as hcpcs_modifier_2
    , cast(null as {{ dbt.type_string() }}) as hcpcs_modifier_3
    , cast(null as {{ dbt.type_string() }}) as hcpcs_modifier_4
    , cast(null as {{ dbt.type_string() }}) as hcpcs_modifier_5
    , cast(null as {{ dbt.type_string() }}) as rendering_npi
    , cast(null as {{ dbt.type_string() }}) as rendering_tin
    , cast(null as {{ dbt.type_string() }}) as billing_npi
    , cast(null as {{ dbt.type_string() }}) as billing_tin
    , cast(null as {{ dbt.type_string() }}) as facility_npi
    , cast(null as date) as paid_date
    , cast(null as {{ dbt.type_numeric() }}) as paid_amount
    , cast(null as {{ dbt.type_numeric() }}) as allowed_amount
    , cast(null as {{ dbt.type_numeric() }}) as charge_amount
    , cast(null as {{ dbt.type_numeric() }}) as coinsurance_amount
    , cast(null as {{ dbt.type_numeric() }}) as copayment_amount
    , cast(null as {{ dbt.type_numeric() }}) as deductible_amount
    , cast(null as {{ dbt.type_numeric() }}) as total_cost_amount
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_type
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_1
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_2
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_3
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_4
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_5
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_6
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_7
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_8
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_9
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_10
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_11
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_12
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_13
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_14
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_15
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_16
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_17
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_18
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_19
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_20
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_21
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_22
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_23
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_24
    , cast(null as {{ dbt.type_string() }}) as diagnosis_code_25
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_1
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_2
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_3
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_4
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_5
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_6
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_7
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_8
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_9
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_10
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_11
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_12
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_13
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_14
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_15
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_16
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_17
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_18
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_19
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_20
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_21
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_22
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_23
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_24
    , cast(null as {{ dbt.type_string() }}) as diagnosis_poa_25
    , cast(null as {{ dbt.type_string() }}) as procedure_code_type
    , cast(null as {{ dbt.type_string() }}) as procedure_code_1
    , cast(null as {{ dbt.type_string() }}) as procedure_code_2
    , cast(null as {{ dbt.type_string() }}) as procedure_code_3
    , cast(null as {{ dbt.type_string() }}) as procedure_code_4
    , cast(null as {{ dbt.type_string() }}) as procedure_code_5
    , cast(null as {{ dbt.type_string() }}) as procedure_code_6
    , cast(null as {{ dbt.type_string() }}) as procedure_code_7
    , cast(null as {{ dbt.type_string() }}) as procedure_code_8
    , cast(null as {{ dbt.type_string() }}) as procedure_code_9
    , cast(null as {{ dbt.type_string() }}) as procedure_code_10
    , cast(null as {{ dbt.type_string() }}) as procedure_code_11
    , cast(null as {{ dbt.type_string() }}) as procedure_code_12
    , cast(null as {{ dbt.type_string() }}) as procedure_code_13
    , cast(null as {{ dbt.type_string() }}) as procedure_code_14
    , cast(null as {{ dbt.type_string() }}) as procedure_code_15
    , cast(null as {{ dbt.type_string() }}) as procedure_code_16
    , cast(null as {{ dbt.type_string() }}) as procedure_code_17
    , cast(null as {{ dbt.type_string() }}) as procedure_code_18
    , cast(null as {{ dbt.type_string() }}) as procedure_code_19
    , cast(null as {{ dbt.type_string() }}) as procedure_code_20
    , cast(null as {{ dbt.type_string() }}) as procedure_code_21
    , cast(null as {{ dbt.type_string() }}) as procedure_code_22
    , cast(null as {{ dbt.type_string() }}) as procedure_code_23
    , cast(null as {{ dbt.type_string() }}) as procedure_code_24
    , cast(null as {{ dbt.type_string() }}) as procedure_code_25
    , cast(null as date) as procedure_date_1
    , cast(null as date) as procedure_date_2
    , cast(null as date) as procedure_date_3
    , cast(null as date) as procedure_date_4
    , cast(null as date) as procedure_date_5
    , cast(null as date) as procedure_date_6
    , cast(null as date) as procedure_date_7
    , cast(null as date) as procedure_date_8
    , cast(null as date) as procedure_date_9
    , cast(null as date) as procedure_date_10
    , cast(null as date) as procedure_date_11
    , cast(null as date) as procedure_date_12
    , cast(null as date) as procedure_date_13
    , cast(null as date) as procedure_date_14
    , cast(null as date) as procedure_date_15
    , cast(null as date) as procedure_date_16
    , cast(null as date) as procedure_date_17
    , cast(null as date) as procedure_date_18
    , cast(null as date) as procedure_date_19
    , cast(null as date) as procedure_date_20
    , cast(null as date) as procedure_date_21
    , cast(null as date) as procedure_date_22
    , cast(null as date) as procedure_date_23
    , cast(null as date) as procedure_date_24
    , cast(null as date) as procedure_date_25
    , cast(null as {{ dbt.type_int() }}) as in_network_flag
    , cast(null as {{ dbt.type_string() }}) as data_source
    , cast(null as {{ dbt.type_string() }}) as file_name
    , cast(null as date) as file_date
    , cast(null as {{ dbt.type_timestamp() }}) as ingest_datetime
{% if target.type == 'fabric' %} {% else %} limit 0 {% endif %}
