FROM ghcr.io/home-assistant/base:3.23 AS builder

ARG BUILD_VERSION="null"

WORKDIR /build

RUN apk add --no-cache python3 py3-pip py3-setuptools py3-wheel git

COPY requirements.txt /build/requirements.txt
RUN python3 -m venv /app/venv && \
    . /app/venv/bin/activate && \
    pip3 install --no-cache-dir git+https://github.com/ChristopheHD/enocean.git && \
    pip3 install --no-cache-dir -r /build/requirements.txt
ADD --keep-git-dir=false https://github.com/Turgon37/HA_enoceanmqtt.git#develop:enoceanmqtt /app/venv/lib/python3.14/site-packages/enoceanmqtt
RUN printf '%s\n' "$BUILD_VERSION" > /app/venv/lib/python3.14/site-packages/enoceanmqtt/VERSION
# Create the executable symlink or script manually since we are directly adding the module
RUN printf '#!/usr/bin/env sh\nexec python3 -m enoceanmqtt "$@"\n' > /app/venv/bin/enoceanmqtt && chmod +x /app/venv/bin/enoceanmqtt

FROM ghcr.io/home-assistant/base:3.23

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
