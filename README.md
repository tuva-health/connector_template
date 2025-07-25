[![Apache License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) ![dbt logo and version](https://img.shields.io/static/v1?logo=dbt&label=dbt-version&message=1.x&color=orange)

## Background
This is a template to create connectors for The Tuva Project on version `0.14.x`. 

This template includes a general project structure for connectors for The Tuva Project, including the data models that The Tuva Project Package expects as inputs, some data tests and column-level documentation, and some notes on how to build on this connector in structuring your own projects.

### What is a connector?
In simple terms, we view a connector as an on-ramp to the Tuva Data Model for a single data source.
In practice, that means a connector maps raw data for a single source to the Tuva Input layer, bridging the gap between the incoming raw data schema and the schema that the Tuva Data Model expects.

### Why one connector per data source?
Folding multiple different data sources (and multiple raw data schemas) into a single connector can get ugly pretty quickly. When data quality problems arise across two sources, pinpointing the source of the issue(s) can become a lot more difficult when data source-specific logic is not cleanly separated.

The way we have handled this in the past is by mapping all of our data sources in separate connectors, and then unioning data once it has been mapped to the Tuva Project Input Layer. That allows for source-specific logic to handle the mapping piece, and then the data can be unioned when all sources are aligned with the Tuva Data Model.

### High-level project structure
* `staging` layer: `source()` raw data and map it to the Tuva Data Model.
* `intermediate` layer: handle any consequential transformations, including Adjustments, Denials, and Reversals (ADR) for claims and deduplication.
* `final` layer: data is ready to run through The Tuva Project—the models in this layer are expected by The Tuva Project Package.

## Getting started building your own connector
This guide assumes:
1. that you have at least one raw data source loaded into a data warehouse.
2. that you have access to your data warehouse and you've [configured](https://docs.getdbt.com/docs/core/connect-data-platform/profiles.yml) a `profiles.yml` file.

#### Step 1: Create a Git repository for your connector.
[Create a repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template#creating-a-repository-from-a-template) based on this template
and name it appropriately. Let's say you named it `my_connector`.

#### Step 2: Clone the Git repo you just created
[Clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository#cloning-a-repository) the `my_connector` repository you just created using our template repo. If you used the template, you should have all of the files we ship with the connector template
with their own Git history.

Set your directory:
```bash
cd my_connector
```

#### Step 3: Virtual Environment and requirements.txt
1. Inside the project folder, create the virtual environment:
```bash
# use python3 if python defaults to Python 2
python -m venv venv
```
This will create a venv directory.

2. Activate the virtual environment:
* macOS / Linux (bash/zsh): `source venv/bin/activate`
* Windows (Command Prompt): `venv\Scripts\activate.bat`
* Windows (PowerShell): `.\venv\Scripts\Activate.ps1`
* Windows (Git Bash): `source venv/Scripts/activate`

3. Install the requirements:
```bash
pip install --upgrade pip
pip install -r requirements.txt
```
This will install the Python dependencies that ship with this connector template, including `dbt-core`,
`sqlfluff` for linting, and the `dbt-snowflake` adapter. You may need to slightly modify these requirements
depending on your setup.

#### Step 4: Claims or clinical?
Depending on the connector you're building, you can clean up your project by getting rid of some models
that are not relevant to your use case.

If you are creating a connector for a claims data source, you can delete all models from the `models/final/` directory except for `medical_claim.sql`, `pharmacy_claim.sql`, and `eligibility.sql`.

If you are creatiung a connector for a clinical data source, you can delete `medical_claim.sql`, `pharmacy_claim.sql`, and `eligibility.sql` from `models/final/`.

#### Step 5: Add your raw data tables to your project
The first step in mapping your data is making sure that your dbt project can find your raw data tables that
you've loaded in your data warehouse.

Raw data enters the project at the `staging` layer, which relies on `source()` calls to your data warehouse to retrive the raw data.

In order for `source()` calls to work correctly, you must update your [_sources.yml](./models/_sources.yml) file to add the raw tables you'll be mapping to the input layer.

#### Step 6: Create your staging models
In the `models/staging/` directory, create your staging models. Typically, these models are very simple
and only handle light data typing. If you were building a claims connector and had eligibility, medical claims, and pharmacy claims data, you might create three models: `stg_eligibility.sql`, `stg_medical_claim.sql`, and `stg_pharmacy_claim.sql`.

#### Step 7: Intermediate models and the mapping process
The bulk of mapping happens in the `intermediate` layer. Mapping involves:
1. making sure that source data column names are mapped to the Tuva Data Model
2. making sure that data types are what the Tuva Data Model expects
3. making sure that source data is deduplicated, and Adjustments, Denials and Reversals are applied (if applicable)

If, for example, you're building a claims connector and you have eligibility, medical claims, and pharmacy claims data, you'll want to create models named something along the lines of `int_eligibility`, `int_medical_claim`, and `int_pharmacy_claim`; these models will make dbt `ref()` calls to the staging
models you created before.

Depending on the complexity of your medical claim or pharmacy claims data sources, you might want to have multiple intermediate models (e.g. not just `int_medical_claim` but maybe one model where you map column names and handle Adjustments, Denials and Reversals, and one model where you deduplicate). We've done versions of this in different connectors, including one for [Medicare CCLF](https://github.com/tuva-health/medicare_cclf_connector/tree/main/models/intermediate) and another for [Medicare LDS](https://github.com/tuva-health/medicare_lds_connector/tree/main/models/intermediate).

We've written a [Claims Mapping Guide](https://thetuvaproject.com/getting-started/mapping-guide) that we hope is helpful in bridging the gap between your raw data and the Tuva Data Model. 

And as you apply ADR logic to your claims data, we've written about [some of the different ways to handle ADR](https://thetuvaproject.com/knowledge/claims-data/adjustments-denials-reversals).

#### Step 8: Creating your final models
This template has already taken care of creating the models for you in `models/final/`. Once your `intermediate` models are ready, add `ref()` calls to your final models——for a claims connector, this would be `eligibility`, `medical_claim` and `pharmacy_claim` models. Replace the `null` values with column names to which you've mapped your source data.

#### Step 9: Running your project and evaluating Data Quality Intelligence (DQI)
Once you have your final models ready, you are ready to run your dbt project! The first run of a connector through the Tuva Project will tell you how well you've mapped your data and highlight any remaining data quality
problems, correctable or not.

Tuva's [Data Quality Intelligence](https://thetuvaproject.com/data-quality) (DQI) contains over 600 tests built into the project. As you run your final models, tests may warn, or error, with varying levels of severity. Based on these warnings and errors, you may need to correct your mappings and re-run some (or all) of your project.

If you were correcting your mapping in `int_medical_claim` and you wanted to re-run the models and tests corresponding to only that part of the project, you could run:
```console
dbt build --select int_medical_claim medical_claim+1
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
