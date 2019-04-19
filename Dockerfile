ARG BASE=alpine
FROM $BASE as base

ARG arch=none
ENV ARCH=$arch

COPY qemu/qemu-$ARCH-static* /usr/bin/

RUN apk add --no-cache python3 && \
    rm -rf /usr/share/terminfo

FROM base as builder

RUN apk add --no-cache curl ca-certificates python3-dev gcc libc-dev
RUN pip3 install --upgrade shiv importlib-resources==0.8

ARG MLAT_CLIENT_VERSION
ARG MLAT_CLIENT_HASH

RUN curl --output mlat-client.tar.gz -L "https://github.com/ShoGinn/mlat-client/archive/${MLAT_CLIENT_VERSION}.tar.gz" && \
    sha256sum mlat-client.tar.gz && echo "${MLAT_CLIENT_HASH}  mlat-client.tar.gz" | sha256sum -c
run shiv -c mlat-client -o /usr/local/bin/mlat-client /mlat-client.tar.gz

FROM base

COPY --from=builder /usr/local/bin/mlat-client /usr/local/bin/mlat-client
COPY mlat-client-runner.sh /usr/bin/mlat-client-runner

EXPOSE 30104/tcp

ENTRYPOINT ["mlat-client-runner"]

# Metadata
ARG VCS_REF="Unknown"
LABEL maintainer="ginnserv@gmail.com" \
      org.label-schema.name="Docker ADS-B - adsbexchange-mlat" \
      org.label-schema.description="Docker container for ADS-B - This is the adsbexchange.com (MLAT) component" \
      org.label-schema.url="https://github.com/ShoGinn/adsbexchange-mlat" \
      org.label-schema.vcs-ref="${VCS_REF}" \
      org.label-schema.vcs-url="https://github.com/ShoGinn/adsbexchange-mlat" \
      org.label-schema.schema-version="1.0"
