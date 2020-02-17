FROM alpine:3.10

LABEL maintainer "Jeremy Garigliet <jeremy.garigliet@gmail.com>"

ENV SQLMAP_VER=1.4

RUN apk add --no-cache \
      python3 \
      tar

RUN mkdir /var/sqlmap && \
    wget -O /tmp/sqlmap.tar.gz https://github.com/sqlmapproject/sqlmap/archive/${SQLMAP_VER}.tar.gz && \
    tar xzf /tmp/sqlmap.tar.gz --strip-components=1 -C /var/sqlmap && \
    rm -f /tmp/sqlmap.tar.gz

ENTRYPOINT [ "python3", "/var/sqlmap/sqlmap.py" ]

CMD [ "-h" ]