FROM ghcr.io/home-assistant/base:3.23 AS builder

ARG BUILD_VERSION="null"

WORKDIR /build

RUN apk add --no-cache python3 py3-pip py3-setuptools py3-wheel git

COPY requirements.txt /build/requirements.txt
RUN python3 -m venv /app/venv && \
    . /app/venv/bin/activate && \
    pip3 install --no-cache-dir git+https://github.com/ChristopheHD/enocean.git && \
    pip3 install --no-cache-dir -r /build/requirements.txt
# Download the embyt repo as a base since it has a setup.py that registers the enoceanmqtt command
# Then overwrite with the Turgon37 repo's updated enoceanmqtt package as was done in the original Dockerfile
RUN . /app/venv/bin/activate && \
    python3 -m pip install --upgrade pip && \
    git clone -b master --single-branch --depth 1 https://github.com/embyt/enocean-mqtt.git && \
    cd enocean-mqtt && pip install -e . && cd .. && \
    git clone -b develop --single-branch --depth 1 https://github.com/Turgon37/HA_enoceanmqtt.git && \
    cp -rf ./HA_enoceanmqtt/enoceanmqtt enocean-mqtt/ && \
    rm -rf ./HA_enoceanmqtt && \
    printf '%s\n' "$BUILD_VERSION" > enocean-mqtt/enoceanmqtt/VERSION

FROM ghcr.io/home-assistant/base:3.23

RUN apk add --no-cache python3

WORKDIR /app

COPY --from=builder /usr/local /usr/local
COPY --from=builder /app /app
COPY --from=builder /build/enocean-mqtt /app/enocean-mqtt
COPY rootfs /

STOPSIGNAL SIGINT

LABEL \
    org.opencontainers.image.title="Home Assistant EnOcean app" \
    org.opencontainers.image.description="Integrate EnOcean devices using MQTT integration" \
    org.opencontainers.image.source="https://github.com/ChristopheHD/HA_enoceanmqtt-addon" \
    org.opencontainers.image.licenses="GPL-3.0"
