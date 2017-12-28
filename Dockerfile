FROM buildpack-deps:jessie-scm

MAINTAINER mozhuli "weidonglee27@gmail.com"  

RUN apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/*
COPY e2e.test /usr/local/bin/
COPY run_e2e.sh /run_e2e.sh
COPY kubectl /usr/local/bin/

WORKDIR /usr/local/bin

ENV RESULTS_DIR="/tmp/results"

CMD ["/bin/sh", "-c", "/run_e2e.sh"]
