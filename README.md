# adsbexchange-mlat
Docker container ADSBexchange.com Feeder using the mutability MLAT client

This is part of a suite of applications that can be used if you have a dump1090 compatible device including:
* Any RTLSDR USB device
* Any network AVR or BEAST device
* Any serial AVR or BEAST device

# Container Requirements

This is a multi architecture build that supports arm (armhf/arm64) and amd64

You must first have a running setup for before using this container as it will not help you on initial setup

# Container Setup

Env variables must be passed to the container containing the adsbexchange required items

### Defaults
* DUMP1090_SERVER=dump1090 -- make sure your dump1090 container is named this and on the same network
* DUMP1090_PORT=30005 -- default port
* Port 30104/tcp is exposed in case you need external inputs (but not a requirement)


### User Configured
* MLAT_CLIENT_LATITUDE - Decimal format latitude of your ADSB Antenna
* MLAT_CLIENT_LONGITUDE - Decimal format longitude of your ADSB Antenna
* MLAT_CLIENT_ALTITUDE - Decimal format altitude (asl) of your ADSB Antenna
* MLAT_CLIENT_USER - Your ADSBexchange.com username

#### Example docker run

```
docker run -d \
--restart unless-stopped \
--name='adsbexchange-mlat' \
-e MLAT_CLIENT_LATITUDE="36.000" \
-e MLAT_CLIENT_LONGITUDE="-115.000" \
-e MLAT_CLIENT_ALTITUDE="500.000" \
-e MLAT_CLIENT_USER="adsb-feeder55" \
shoginn/adsbexchange-mlat:latest-amd64

```
# Status
| branch | Status |
|--------|--------|
| master | [![Build Status](https://travis-ci.org/ShoGinn/adsbexchange-mlat.svg?branch=master)](https://travis-ci.org/ShoGinn/adsbexchange-mlat) |

| Arch | Size/Layers | Commit |
|------|-------------|--------|
[![](https://images.microbadger.com/badges/version/shoginn/adsbexchange-mlat:latest-arm.svg)](https://microbadger.com/images/shoginn/adsbexchange-mlat:latest-arm "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/shoginn/adsbexchange-mlat:latest-arm.svg)](https://microbadger.com/images/shoginn/adsbexchange-mlat:latest-arm "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/shoginn/adsbexchange-mlat:latest-arm.svg)](https://microbadger.com/images/shoginn/adsbexchange-mlat:latest-arm "Get your own commit badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/shoginn/adsbexchange-mlat:latest-arm64.svg)](https://microbadger.com/images/shoginn/adsbexchange-mlat:latest-arm64 "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/shoginn/adsbexchange-mlat:latest-arm64.svg)](https://microbadger.com/images/shoginn/adsbexchange-mlat:latest-arm64 "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/shoginn/adsbexchange-mlat:latest-arm64.svg)](https://microbadger.com/images/shoginn/adsbexchange-mlat:latest-arm64 "Get your own commit badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/shoginn/adsbexchange-mlat:latest-amd64.svg)](https://microbadger.com/images/shoginn/adsbexchange-mlat:latest-amd64 "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/shoginn/adsbexchange-mlat:latest-amd64.svg)](https://microbadger.com/images/shoginn/adsbexchange-mlat:latest-amd64 "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/shoginn/adsbexchange-mlat:latest-amd64.svg)](https://microbadger.com/images/shoginn/adsbexchange-mlat:latest-amd64 "Get your own commit badge on microbadger.com")

