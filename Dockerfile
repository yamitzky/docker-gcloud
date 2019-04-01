FROM  google/cloud-sdk:alpine

RUN apk add --no-cache jq

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
