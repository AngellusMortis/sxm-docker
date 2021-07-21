FROM sxm-player:latest

ARG SXM="git+https://github.com/AngellusMortis/sxm-client.git"
ARG SXM_PLAYER="git+https://github.com/AngellusMortis/sxm-player.git"
ARG SXM_PLAYER_PLUGINS="git+https://github.com/AngellusMortis/sxm-discord.git"

RUN pip install --no-cache-dir -U $SXM $SXM_PLAYER $SXM_PLAYER_PLUGINS
