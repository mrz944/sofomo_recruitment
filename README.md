# README

## Getting started

1. Set `IPSTACK_API_KEY` inside `docker-compose.yml`

2. Build docker container:

        $ docker-compose build

3. Run migrations:

        $ docker-compose run web rails db:create db:setup

4. Start up the server:

        $ docker-compose up

## Usage exapmples

1. Add new or update existing record

        $ curl -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"name":"8.8.8.8"}' $(docker-machine ip):3000/geolocations

2. Display record

        $ curl -H "Accept: application/json" -H "Content-type: application/json" $(docker-machine ip):3000/geolocations/8.8.8.8

2. Delete record

        $ curl -H "Accept: application/json" -H "Content-type: application/json" -X DELETE $(docker-machine ip):3000/geolocations/8.8.8.8
