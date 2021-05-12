FROM ruby:3.0-slim-buster

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev git

RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

# even though we're linking the directory as a volume in docker-compose.yml, we still need to add the files to the container
ADD . /app
