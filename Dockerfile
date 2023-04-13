FROM postgres:latest
ENV POSTGRES_USER main
ENV POSTGRES_PASSWORD "jz@K5HWe%WMKJVhS"
ENV POSTGRES_DB main

COPY scripts /docker-entrypoint-initdb.d/