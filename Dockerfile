FROM alpine:3.9
MAINTAINER Michael Martin <mmartin@fuelingbrands.com>

#----------------------------------------------------
# Base Alpine edge image w/s6 Overlay
#----------------------------------------------------
# @credit John Regan <john@jrjrtech.com>
# @original https://github.com/just-containers/s6-overlay

ENV S6_VERSION v1.17.2.0

##/
 # Install the s6 overlay
 #/
RUN apk add --no-cache sudo bash git curl gzip unzip wget openssh-client \
 && wget https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-amd64.tar.gz --no-check-certificate -O /tmp/s6-overlay.tar.gz \
 && tar xvfz /tmp/s6-overlay.tar.gz -C / \
 && rm -f /tmp/s6-overlay.tar.gz \
 && apk del wget

##/
 # Create the root file system
 #/
COPY rootfs /

##/
 # Run the system init on entry
 #/
ENTRYPOINT [ "/init" ]
