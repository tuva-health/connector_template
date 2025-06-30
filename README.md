This is a template to create connectors for The Tuva Project on version `0.14.x`. 

This template includes a general project structure for connectors for The Tuva Project, including the data models that The Tuva Project Package expects as inputs, some data tests and column-level documentation, and some notes on how to build on this connector in structuring your own projects.

### What is a connector?
Running a correctly-built connector prepares data to run through The Tuva Project dbt package. In effect, connectors help map raw data sources to the Tuva Data Model.

### Connector Project Structure
As a general pattern, connectors are roughly 1:1 with raw data sources, because each raw data source often has its own unique challenges. The typical workflow and project structure for mapping raw data to the Tuva Data Model within a connector is:
* `staging` layer: `source()` raw data and map it to the Tuva Data Model
* `int` layer: handle any consequential transformations, including Adjustments, Denials, and Reversals (ADR) for claims and deduplication.
* `final` layer: data is ready to run through The Tuva Project—the models in this layer are expected by The Tuva Project Package.

### Running a connector
When you've completed mapping, and you're ready to run the connector without running the whole Tuva Project, you can build and test all models by running:
```console
dbt build --full-refresh -s tag:input_layer
```

### Tuva Resources:
- The Tuva Project [docs](https://thetuvaproject.com/)
- The Tuva Project [dbt docs](https://tuva-health.github.io/tuva/#!/overview/)
- The Tuva Project [package](https://hub.getdbt.com/tuva-health/the_tuva_project/latest/)

### dbt Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

### Running SQLFluff
1. Create a virtual environment: `python3 -m venv .venv`
2. Activate the virtual environment: `source .venv/bin/activate`
3. Install the required packages: `pip install -r requirements.txt`
4. Create a profiles.yml file in `~/.dbt`. The profiles.yml.tmpl file is there as a reference.
5. Run SQLFluff on your target file (e.g. medical claims): `sqlfluff fix models/final/medical_claim.sql`
