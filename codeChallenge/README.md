## Company App ## 

**A Companies Application built using Rails-4.2.1 with the following features:**

* CRUD operations for Companies
* Founders associated with the Companies
* Categories associated with the Companies


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

### Database Relationships / Associations

##### Companies
Companies have relationships with the following models in the database. 
(*check schema.rb and the models to see associations.*)
* Founder 
* Location 
* Category 
* Tagging 