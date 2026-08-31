# Connector Template

Use this repository as a starting point for a Tuva connector. A connector is a
dbt project that translates raw claims, clinical, or provider-attribution data
into Tuva Core's Input Layer.

After creating a repository from this template:

1. Rename `connector_template` in both `name:` and the key under `models:` in
   `dbt_project.yml`.
2. Set `claims_enabled`, `clinical_enabled`, and
   `provider_attribution_enabled` for the domains your connector maps.
3. Update `models/_sources.yml`, then implement the staging and final Input
   Layer models.
4. Run `dbt deps`, then build the connector and Tuva Core Input Layer Wrappers
   with `dbt build --select tag:input_layer`.

The template installs the compatible Tuva Core 1.x line and tags every
connector model with `input_layer` so the focused build includes both staging
and final mappings. Structural and Logical Data Quality are opt-in through
`data_quality_enabled`.

Extension columns use the explicit defaults `prefix: "x_"` and `strip: false`.
Expose prefixed columns only through a supported final Input Layer model, keep the
prefix in connector SQL, and run a full refresh when adding, removing, or
renaming an extension column.

See [Building a Connector](https://thetuvaproject.com/guides/building-a-connector)
for the complete workflow and [Column Extensions](https://thetuvaproject.com/guides/column-extensions)
for supported table pairs, configuration, and validation.
