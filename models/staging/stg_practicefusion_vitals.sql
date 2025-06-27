select
    patient_id
    , vital_id
    , encounter_id
    , panel_id
    , observation_datetime
    , observation_type
    , source_code
    , source_code_type
    , source_description
    , result
    , result_units
    , result_datetime
    , reference_range_low
    , reference_range_high
    , _run_time
    , _file_name
from {{ source('practicefusion_raw', 'vitals') }}
