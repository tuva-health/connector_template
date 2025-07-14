select
    procedure_id
    , patient_id
    , encounter_id
    , procedure_date
    , source_code
    , source_code_type
    , source_description
    , modifiers
    , practitioner_id
    , practitioner_npi
    , _run_time
    , _file_name
    , practice_name
from {{ source('practicefusion_raw', 'procedure_raw') }}