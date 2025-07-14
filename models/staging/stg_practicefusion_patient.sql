select
    patient_id
    , first_name
    , last_name
    , sex
    , race
    , birth_date
    , death_date
    , death_flag
    , social_security_number
    , address
    , city
    , state
    , zip_code
    , county
    , phone_number
    , _run_time
    , _file_name
    , practice_name
from {{ source('practicefusion_raw', 'patient_raw') }}