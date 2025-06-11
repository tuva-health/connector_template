with unfiltered_data as (
    select practitioner_id,
       npi,
       first_name,
       last_name,
       practice_affiliation,
       specialty,
       sub_specialty,
       data_source,
       file_name,
       ingest_datetime,
       row_number() OVER(PARTITION BY practitioner_id ORDER BY file_name desc) as row_number
from {{ ref('int_practicefusion_practitioner') }}
)
select practitioner_id,
    npi,
    first_name,
    last_name,
    practice_affiliation,
    specialty,
    sub_specialty,
    data_source,
    file_name,
    ingest_datetime
from unfiltered_data
where row_number = 1