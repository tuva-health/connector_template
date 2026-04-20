{{ config(
     enabled = (var('provider_attribution_enabled', false) and var('claims_enabled', false)) | as_bool
   )
}}

select *
from {{ ref('stg_provider_attribution') }}
