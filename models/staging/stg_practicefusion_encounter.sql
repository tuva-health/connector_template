select
    encounter_id
    , patient_id
    , encounter_type
    , start_date
    , end_date
    , admit_source_code
    , admit_source_description
    , admit_type_code
    , admit_type_description
    , discharge_disposition_code
    , discharge_disposition_description
    , attending_practitioner_id
    , attending_practitioner_npi
    , attending_practitioner_name
    , facility_id
    , facility_name
    , primary_diagnosis_code
    , primary_diagnosis_code_type
    , primary_diagnosis_description
    , _run_time
    , _file_name
from {{ source('practicefusion_raw', 'encounter') }}