FROM bluedata/centos7:latest
LABEL maintainer="dietrich.zinsou@hpe.com"

RUN useradd minio
RUN mkdir /opt/minio
RUN mkdir /opt/minio/data

RUN curl -o /opt/minio/minio https://dl.min.io/server/minio/release/linux-amd64/minio
RUN chmod +x /opt/minio/minio
RUN chown -R minio:minio /opt/minio

ENV MINIO_DATA_DIR="/opt/minio/data"
ENV MINIO_ACCESS_KEY="admin"
ENV MINIO_SECRET_KEY="admin123"

WORKDIR /opt/minio/
USER minio

EXPOSE 9000

ENTRYPOINT ["/opt/minio/minio", "server", "$MINIO_DATA_DIR"]
