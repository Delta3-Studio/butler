FROM alpine:3.23

ENV GLIBC_VERSION=2.34-r0
ENV BUTLER_VERSION=15.24.0

RUN apk add --no-cache curl
RUN curl -L -o /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN curl -L -o glibc-${GLIBC_VERSION}.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk
RUN apk add --force-overwrite glibc-${GLIBC_VERSION}.apk
RUN rm glibc-${GLIBC_VERSION}.apk

RUN curl -L -o butler-${BUTLER_VERSION}.zip https://broth.itch.zone/butler/linux-amd64/${BUTLER_VERSION}/archive/default
RUN unzip -d /usr/local/bin/ butler-${BUTLER_VERSION}.zip
RUN rm butler-${BUTLER_VERSION}.zip

ENTRYPOINT [ "butler" ]
CMD [ "help" ]
