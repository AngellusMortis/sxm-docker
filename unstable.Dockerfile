FROM angellusmortis/sxm-player:latest

ARG SXM="git+https://github.com/AngellusMortis/sxm-client.git"
ARG SXM_PLAYER="git+https://github.com/AngellusMortis/sxm-player.git"
ARG SXM_PLAYER_PLUGINS="git+https://github.com/AngellusMortis/sxm-discord.git"

RUN apt-get update \
    && apt-get install -y git \
    # cleaning up unused files
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -U $SXM $SXM_PLAYER $SXM_PLAYER_PLUGINS
