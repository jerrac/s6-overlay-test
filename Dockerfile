FROM ubuntu:20.04
ARG S6_OVERLAY_VERSION=3.1.0.1
RUN apt-get update && apt-get install -y xz-utils \
    && rm -rf /var/lib/apt/lists/*
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz
COPY dash.sh /usr/local/bin
COPY dot.sh /usr/local/bin
COPY prep.sh /usr/local/bin
COPY opt-config /opt/config
RUN chmod +x /usr/local/bin/dash.sh
RUN chmod +x /usr/local/bin/dot.sh
RUN chmod +x /usr/local/bin/prep.sh
COPY etc-s6-overlay-s6-rc.d-config /etc/s6-overlay/s6-rc.d/config
COPY etc-s6-overlay-s6-rc.d-dash /etc/s6-overlay/s6-rc.d/dash
COPY etc-s6-overlay-s6-rc.d-dot /etc/s6-overlay/s6-rc.d/dot
RUN mkdir -p /etc/s6-overlay/s6-rc.d/user/contents.d
RUN touch /etc/s6-overlay/s6-rc.d/user/contents.d/config
RUN touch /etc/s6-overlay/s6-rc.d/user/contents.d/dash
RUN touch /etc/s6-overlay/s6-rc.d/user/contents.d/dot
COPY opt-config /opt/config
ENTRYPOINT ["/init"]