# 1: Use ruby 2.3.3 as base:
FROM ruby:2.4.1

# 2: Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# 3: Set up directory
RUN mkdir /app

# 4: set the application path as
WORKDIR /app

# 5: Add Gemfile & Gemfile.lock
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

# 6: Install ruby gem dependencies
RUN bundle install

# 7: Add the app's path
ADD . /app

CMD ["rails","server","-b","0.0.0.0"]