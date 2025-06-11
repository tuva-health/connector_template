select
    patient_id
    , diagnosis_id
    , diagnosis_name
    , diagnosis_code
    , diagnosis_code_system
    , encounter_id
    , start_date
    , end_date
    , recorded_datetime
    , practitioner_npi
    , practitioner_id
    , _run_time
    , _file_name
from {{ source('practicefusion_raw', 'condition_problem_list_raw') }}