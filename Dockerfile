FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends ca-certificates gnupg wget

RUN wget --no-check-certificate https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
RUN dpkg -i erlang-solutions_1.0_all.deb

RUN echo "Europe/Dublin" > /etc/timezone

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends erlang libncurses5-dev libssl-dev unixodbc-dev g++ git erlang-base-hipe make

WORKDIR /workspace

RUN git clone https://github.com/tarrencev/amoveo.git . && \
    git checkout graphql && \
    git checkout f91c5809c1a2741ab9229b2310e6738dc6bc4dbe

RUN make prod-build
RUN ls
RUN chmod +x ./docker-entrypoint.sh

# Expose ports
EXPOSE 8080

CMD ["./docker-entrypoint.sh"]
