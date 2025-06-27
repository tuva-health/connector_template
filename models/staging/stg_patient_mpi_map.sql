select distinct patient.patient_id, mpi.mpi_id
from {{ ref('stg_practicefusion_patient') }} patient
join {{ source('core', 'mpi_v0') }} mpi
on patient.first_name = mpi.member_first_name
and patient.last_name = mpi.member_last_name
and to_date(patient.birth_date, 'yyyyMMdd') = mpi.member_dob