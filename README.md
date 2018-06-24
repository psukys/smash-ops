# smash-ops
Configuration for deploying [smash quote archive](https://github.com/nukeop/smash).

## Running
Everything set up for [*Docker*](https://docs.docker.com/), with the help of [*docker-compose*](https://docs.docker.com/compose/).

Running:
```
docker-compose up -d
```

Introduces 3 services:

1. [NGINX](https://www.nginx.com/) web server
2. [PostgreSQL](https://www.postgresql.org/) database server
3. Smash application service (has [gunicorn](http://gunicorn.org/) as WSGI HTTP server.

## Usage in development

To adjust `docker-compose.yml` for development, just add volume that points your local version to `/opt/smash`:
```YAML
app:
    build: .
    depends_on:
      - db
    networks:
      - db
      - web
    env_file:
      - env
    volumes:
      - ./path/to/local/version:/opt/smash
```
