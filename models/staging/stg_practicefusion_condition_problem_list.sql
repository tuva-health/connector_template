select
    patient_id
    , condition_id
    , condition_name
    , condition_code
    , condition_code_system
    , encounter_id
    , start_date
    , stop_date
    , recorded_datetime
    , practitioner_npi
    , practitioner_id
    , _run_time
    , _file_name
from {{ source('practicefusion_raw', 'condition_problem_list_raw') }}