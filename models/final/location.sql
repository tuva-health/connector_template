{{ config(
     enabled = var('clinical_enabled', false) | as_bool
   )
}}

select *
from {{ ref('stg_location') }}
