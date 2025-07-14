select
    patient_id
    , medication_id
    , encounter_id
    , source_code
    , source_code_type
    , med_display_name
    , dose
    , route
    , start_date
    , stop_date
    , practitioner_npi
    , practitioner_id
    , _run_time
    , _file_name
    , practice_name
from {{ source('practicefusion_raw', 'medication_raw') }}