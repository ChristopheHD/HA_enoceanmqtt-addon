ARG BUILD_FROM
FROM $BUILD_FROM

# Create Working Directory
WORKDIR /app

# Install enoceanmqtt and requirements
COPY requirements.txt .
RUN apk add --no-cache python3 py3-pip git && \
    python3 -m venv /app/venv && \
    . /app/venv/bin/activate && \
    python3 -m pip install --upgrade pip && \
    pip3 install -r requirements.txt && \
    pip3 install git+https://github.com/ChristopheHD/enocean.git@add-msc-telegram-support  && \
    git clone -b master --single-branch --depth 1 https://github.com/embyt/enocean-mqtt.git && \
    cd enocean-mqtt && pip install -e . && cd .. && \
    echo "Installing from repository head" && \
    git clone -b develop --single-branch --depth 1 https://github.com/ChristopheHD/HA_enoceanmqtt.git ; \
    cp -rf ./HA_enoceanmqtt/enoceanmqtt enocean-mqtt && \
    rm -rf ./HA_enoceanmqtt

# Copy data for add-on
COPY run.sh .
RUN chmod a+x run.sh

CMD [ "/app/run.sh" ]
