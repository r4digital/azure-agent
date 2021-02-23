FROM r4digital/ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get install -y --no-install-recommends \
        jq \
        iputils-ping \
        libcurl4 \
        libunwind8 \
        netcat \
        libssl1.0

WORKDIR /azp

COPY ./src/start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]
