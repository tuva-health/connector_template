{{ config(
     enabled = var('claims_enabled', false) | as_bool
   )
}}

select *
from {{ ref('stg_medical_claim') }}
