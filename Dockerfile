FROM ubuntu:16.04
LABEL maintainer="N-Squared Software <support@nsquared.nz>"


################################
### Config:
###
# set version for s6 overlay
ARG OVERLAY_VERSION="v1.21.2.2"
ARG OVERLAY_ARCH="amd64"


################################
### Build Image:
###
RUN \
    echo "**** install packages ****" \
        && apt-get update \
        && apt-get install -y \
            bash-completion \
            ca-certificates \
            coreutils \
            curl \
            nano \
            tar \
            tzdata \
            unzip \
            xz-utils \
            vim \
    && \
    echo "**** add s6 overlay ****" \
        && curl -o \
            /tmp/s6-overlay.tar.gz -L \
            "https://github.com/just-containers/s6-overlay/releases/download/${OVERLAY_VERSION}/s6-overlay-${OVERLAY_ARCH}.tar.gz" \
        && tar xfz \
            /tmp/s6-overlay.tar.gz -C / \
    && \
    echo "**** create docker user and make our folders ****" \
        && groupmod -g 1000 users \
        && useradd -u 1000 -U -d /config -s /bin/false docker \
        && usermod -G users docker \
        && mkdir -p \
            /app \
            /config \
            /defaults \
    && \
    echo "**** cleanup ****" \
        && apt-get clean \
        && rm -rf \
            /tmp/* \
            /var/lib/apt/lists/* \
            /var/tmp/*

# add local files
COPY root/ /

ENTRYPOINT ["/init"]
