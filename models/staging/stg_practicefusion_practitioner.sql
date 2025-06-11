select
    practitioner_id
    , npi
    , first_name
    , last_name
    , practice_affiliation
    , specialty
    , subspecialty
    , _run_time
    , _file_name
from {{ source('practicefusion_raw', 'practitioner_raw') }}