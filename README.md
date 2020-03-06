
# MLAT Client

Docker container using the mutability MLAT client for feeding any service

You can use this for RadarBox24 as well:

Just keep the items the same and add MLAT_SERVER mlat1.rb24.com with MLAT_SERVER_PORT 40900

This is part of a suite of applications that can be used if you have a dump1090 compatible device including:

* Any RTLSDR USB device
* Any network AVR or BEAST device
* Any serial AVR or BEAST device

## Container Requirements

This is a multi architecture build that supports arm (armhf/arm64) and amd64

You must first have a running setup for before using this container as it will not help you on initial setup

## Container Setup

Env variables must be passed to the container containing the required items

### User Configured

* DUMP1090_SERVER -- defaults to dump1090
* DUMP1090_PORT -- defaults to 30005
* DUMP1090_LAT - Decimal format latitude of your ADSB Antenna
* DUMP1090_LON - Decimal format longitude of your ADSB Antenna
* DUMP1090_ALT - Decimal format altitude (asl) of your ADSB Antenna
* MLAT_CLIENT_USER - Your username for your feed
* MLAT_SERVER - The feeder server (defaults to adsbexchange -- feed.adsbexchange.com)
* MLAT_SERVER_PORT - the feeder port  (defaults to adsbexchange port -- 31090)

#### Example docker run

```bash
docker run -d \
--restart unless-stopped \
--name='adsbexchange-mlat' \
-e DUMP1090_LAT="36.000" \
-e DUMP1090_LON="-115.000" \
-e DUMP1090_ALT="500.000" \
-e MLAT_CLIENT_USER="adsb-feeder55" \
shoginn/adsbexchange-mlat:latest
```

## Status

| branch | Status |
|--------|--------|
| master | [![Build Status](https://travis-ci.com/ShoGinn/adsbexchange-mlat.svg?branch=master)](https://travis-ci.com/ShoGinn/adsbexchange-mlat) |
