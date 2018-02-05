## Company Directory App ## 

**Technology Environment**
* Ubuntu 14.04
* Ruby 2.5.0
* Rails 5.1.4

### How to build and run the application

First fork and clone the repository then cd into the project directory

Install gems

`bundle install --without production`

Create Database

`bundle exec rake db:create`

Run the Migrations

`bundle exec rake db:migrate`

Now run the Test Suite
**Acceptance Tests, Controller Tests** and **Model Tests** are covered

`bundle exec rspec`

Got a GREEN signal? Start up your server now.

`rails server`



You can this app live also:

https://companydirapp.herokuapp.com/