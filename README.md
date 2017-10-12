## Company App ## 

**A Companies Application built using Rails-4.2.1 with the following features:**

* CRUD operations for Companies
* Ability to create and view the Founders associated with the Companies
* Ability to tag Companies with categories and view the tags.

### Getting Started

Fork, clone, and cd into the project directory

Install the dependencies

`bundle install`

Create Database

`rake db:create`

Run Migrations

`rake db:migrate`

Seed your database with fake companies and founders

`rake db:seed`

Start up your server!

`rails server`

To see a live version, visit:

http://companiesandfounders.herokuapp.com/

### Testing

**Controller and Model Tests**
located in the spec directory

To run tests run 
`$ rspec`

### Database Relationships / Associations

##### Companies
Companies have relationships with the following models in the database. 
(*check schema.rb and the models to see associations.*)
* Founder 
* Location 
* Category 
* Tagging 
