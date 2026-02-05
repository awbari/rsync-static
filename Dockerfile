FROM debian

RUN apt update && \
  apt install -y gcc wget libssl-dev libxxhash-dev libzstd-dev \
  liblz4-dev build-essential libpopt-dev zlib1g-dev jq curl

COPY build.sh /usr/local/bin

RUN useradd -m -d /build build

USER build
WORKDIR /build

CMD build.sh
