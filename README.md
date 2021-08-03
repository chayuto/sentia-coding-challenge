# README

You will be required to create a Ruby on Rails application with the following features below. The
sample CSV data required for the test can be found here
(https://docs.google.com/spreadsheets/d/10c7r-kjdWM4L8kWK0nfE6JgHskzqp7DTF8MkUIo7-_
o/edit?usp=sharing). This application can be built in 1 hour.
Below is a list of user stories and requirements for each section of this application

# Requirements

## part 1
1. As a user, I should be able to upload this sample CSV and import the data into
a database.

### IMPORTER REQUIREMENTS
1. The data needs to load into 3 tables. People, Locations and
Affiliations
2. A Person can belong to many Locations
3. A Person can belong to many Affiliations
4. A Person without an Affiliation should be skipped
5. A Person should have both a first_name and last_name. All fields
need to be validated except for last_name, weapon and vehicle
which are optional.
6. Names and Locations should all be titlecased

## part 2

1. As a user, I should be able to view these results from the importer in a table.
2. As a user, I should be able to paginate through the results so that I can see a
maximum of 10 results at a time.
3. As a user, I want to type in a search box so that I can filter the results I want to see.
4. As a user, I want to be able to click on a table column heading to reorder the visible
results


# Setup

* Ruby version

* System dependencies

* Configuration

* Database creation
Many-to-Many Relationship

* Database initialization

* How to run the test suite
Rspec

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
