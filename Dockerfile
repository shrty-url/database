FROM postgres:latest
ENV POSTGRES_USER main
ENV POSTGRES_PASSWORD hHMP8cd^N3SnzGRR
ENV POSTGRES_DB main
ADD scripts/00-users.sql /docker-entrypoint-initdb.d/