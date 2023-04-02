FROM postgres:latest
ENV POSTGRES_USER main
ENV POSTGRES_PASSWORD hHMP8cd^N3SnzGRR
ENV POSTGRES_DB main

COPY scripts /docker-entrypoint-initdb.d/