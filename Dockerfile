FROM python:3.9.6-slim-buster

LABEL org.opencontainers.image.authors="cbailey@mort.is"
LABEL org.opencontainers.image.title=sxm-player
LABEL org.opencontainers.image.description=
LABEL org.opencontainers.image.url=https://github.com/AngellusMortis/sxm-player
LABEL org.opencontainers.image.source=https://github.com/AngellusMortis/sxm-docker
LABEL org.opencontainers.image.licenses=MIT

RUN apt-get update \
    && apt-get install -y ffmpeg procps curl \
    # cleaning up unused files
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    && rm -rf /var/lib/apt/lists/*

ARG SXM="sxm==0.2.8"
ARG SXM_PLAYER="sxm-player==0.2.5"
ARG SXM_PLAYER_PLUGINS="sxm-discord==0.2.5"

RUN pip install --no-cache-dir -U pip \
    && pip install --no-cache-dir $SXM $SXM_PLAYER $SXM_PLAYER_PLUGINS

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

VOLUME ["/output"]

EXPOSE 9999/tcp

CMD /start.sh
