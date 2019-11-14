# README

## Getting started

1. Set `IPSTACK_API_KEY` inside `docker-compose.yml`
2. Build docker container:
```docker-compose build```
3. Run migrations:
```docker-compose run web rails db:create db:setup```
4. Start up the server:
```docker-compose up```
