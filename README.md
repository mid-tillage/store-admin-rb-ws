# store-admin-rb-ws

## Table of Contents
- [Description](#description)
- [Installation](#installation)
- [Running the App](#running-the-app)
- [Test](#test)
- [Docker](#docker)
  - [Image Resource Usage Metrics](#image-resource-usage-metrics)

## Description

Store's Admin Web Service example using [Ruby](https://www.ruby-lang.org/es/).

## Installation

```bash
$ bundle install
```

## Running the app
The following commands allow you to run the application

```bash
$ ruby app.rb
```

## Docker

```bash
# Build Docker image
docker build -t store-admin-rb-ws:latest -f Dockerfile .

# Run Docker container (with example port mappings and environment variables)
docker run -p 3040:3040 -p 5432:5432 -e SERVER_PORT="3040" -e DB_HOST="host.docker.internal" -e DB_PORT="5432" -e DB_USERNAME="postgres" -e DB_PASSWORD="1234" -e DB_NAME="sale-management-system" -e DB_POOL_SIZE="5" -e DB_TIMEOUT="5" -e STORE_ENGINE_ORCHESTRATOR_PROTOCOL="http" -e  STORE_ENGINE_ORCHESTRATOR_IP="localhost" -e STORE_ENGINE_ORCHESTRATOR_PORT="2500" store-admin-rb-ws
```

### Image resource usage metrics

The table below shows resource usage metrics for the `store-admin-rb-ws` Docker container.

| REPOSITORY           | TAG    | IMAGE ID      | CREATED      | SIZE    |
|----------------------|--------|---------------|--------------|---------|
| store-admin-rb-ws    | latest | 70527f9a295b  | 2 hours ago  | 336.5MB |
