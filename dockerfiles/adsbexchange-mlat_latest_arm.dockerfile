FROM alpine as base

RUN apk add --no-cache python3 && \
    rm -rf /usr/share/terminfo

FROM --platform=$TARGETPLATFORM alpine as builder

RUN apk add --no-cache \
	curl \
	ca-certificates \
	python3 \
	python3-dev \
	gcc \
  libc-dev

ARG MLAT_CLIENT_VERSION=v0.2.10
ARG MLAT_CLIENT_HASH=8a570fd502bbba39b37175eff6dbab8372ed1a878266ff96fb33cd65f46eacef

RUN curl --output mlat-client.tar.gz -L "https://github.com/mutability/mlat-client/archive/${MLAT_CLIENT_VERSION}.tar.gz" && \
    sha256sum mlat-client.tar.gz && echo "${MLAT_CLIENT_HASH}  mlat-client.tar.gz" | sha256sum -c

RUN pip3 install mlat-client.tar.gz

FROM base

COPY rootfs /

COPY --from=builder /usr/bin/mlat-client /usr/bin/mlat-client
COPY --from=builder /usr/lib/python3.6/site-packages/mlat /usr/lib/python3.6/site-packages/mlat
COPY --from=builder /usr/lib/python3.6/site-packages/_modes.cpython* /usr/lib/python3.6/site-packages/

ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]