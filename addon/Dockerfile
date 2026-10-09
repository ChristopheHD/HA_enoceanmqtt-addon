FROM ghcr.io/home-assistant/base:3.23 AS builder

ARG BUILD_VERSION="null"

WORKDIR /build

RUN apk add --no-cache python3 py3-pip py3-setuptools py3-wheel git

COPY requirements.txt /build/requirements.txt
RUN python3 -m venv /app/venv && \
    . /app/venv/bin/activate && \
    pip3 install --no-cache-dir git+https://github.com/ChristopheHD/enocean.git && \
    pip3 install --no-cache-dir -r /build/requirements.txt
# Find the actual python version path to install enoceanmqtt correctly
RUN PYTHON_LIB_PATH=$(find /app/venv/lib -maxdepth 1 -name "python3.*" -type d | head -n 1) && \
    wget -qO- https://github.com/Turgon37/HA_enoceanmqtt/archive/refs/heads/develop.tar.gz | tar xz -C /tmp && \
    mv /tmp/HA_enoceanmqtt-develop/enoceanmqtt "$PYTHON_LIB_PATH/site-packages/" && \
    rm -rf /tmp/HA_enoceanmqtt-develop && \
    printf '%s\n' "$BUILD_VERSION" > "$PYTHON_LIB_PATH/site-packages/enoceanmqtt/VERSION" && \
    printf '#!/usr/bin/env sh\nexec python3 -m enoceanmqtt.enoceanmqtt "$@"\n' > /app/venv/bin/enoceanmqtt && \
    chmod +x /app/venv/bin/enoceanmqtt

FROM ghcr.io/home-assistant/base:3.23

RUN apk add --no-cache python3

WORKDIR /app

COPY --from=builder /usr/local /usr/local
COPY --from=builder /app /app
COPY rootfs /

STOPSIGNAL SIGINT

LABEL \
    org.opencontainers.image.title="Home Assistant EnOcean app" \
    org.opencontainers.image.description="Integrate EnOcean devices using MQTT integration" \
    org.opencontainers.image.source="https://github.com/ChristopheHD/HA_enoceanmqtt-addon" \
    org.opencontainers.image.licenses="GPL-3.0"
