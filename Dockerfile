# Use an official Ruby runtime as a parent image
FROM ruby:3.2.4-slim

# Install dependencies needed for building Ruby gems with native extensions
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy Gemfile and Gemfile.lock from your project root to the working directory
COPY Gemfile Gemfile.lock ./

# Install Ruby dependencies
RUN bundle install

# Copy the rest of your application code into the container
COPY . .

# Specify the command to run your application
CMD ["ruby", "app.rb"]
