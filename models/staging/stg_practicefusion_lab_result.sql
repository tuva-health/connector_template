select
    patient_id
    , lab_result_id
    , encounter_id
    , accession_number
    , source_code_type
    , source_code
    , source_description
    , source_component
    , result
    , result_units
    , result_date
    , status
    , collection_date
    , reference_range_low
    , reference_range_high
    , abnormal_flag
    , specimen
    , practitioner_id
    , practitioner_npi
    , _run_time
    , _file_name
from {{ source('practicefusion_raw', 'lab_result_raw') }}