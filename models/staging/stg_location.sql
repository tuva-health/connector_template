{{ config(
     enabled = var('clinical_enabled', false) | as_bool
   )
}}

-- If you need to cast columns, do it here. Staging should only handle casting.
select *
from {{ source('source_input', 'location') }}
