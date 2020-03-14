FROM alpine as base

RUN apk add --no-cache python3 && \
    rm -rf /usr/share/terminfo

FROM --platform=$TARGETPLATFORM python as builder

WORKDIR /mlat-client

RUN pip3 install --upgrade shiv importlib-resources lastversion

RUN \
    lastversion mutability/mlat-client --download mlat-client.tar.gz && \
    tar -xvf mlat-client.tar.gz --strip-components=1 && \
    mv mlat-client mlat/client/cli.py && \
    mv fa-mlat-client flightaware/client/cli.py

COPY patch /mlat-client

RUN patch setup.py shiv.patch

RUN shiv --python='/usr/bin/env python3' -c mlat-client -o /usr/bin/mlat-client .

FROM base

COPY rootfs /

COPY --from=builder /usr/bin/mlat-client /usr/bin/mlat-client

ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]
