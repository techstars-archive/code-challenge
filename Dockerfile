FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /companies-app
WORKDIR /companies-app
ADD companies/Gemfile /companies-app/Gemfile
ADD companies/Gemfile.lock /companies-app/Gemfile.lock
RUN bundle install
ADD companies/ /companies-app/
RUN rm -rf /companies-app/tmp
