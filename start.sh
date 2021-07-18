#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

export SXM_HOST=0.0.0.0
SXM_EXTRA_ARGS=""

if [[ -n ${SXM_ARCHIVE+x} ]]; then
    export SXM_OUTPUT_FOLDER=/output
fi

if [[ -n ${SXM_DISCORD_TOKEN+x} ]]; then
    export SXM_PLAYER_CLASS=sxm_discord.DiscordPlayer

    echo "Running Discord bot..."
elif [[ -n ${SXM_ARCHIVE+x} ]]; then
    SXM_PLAYER_CLASS=CLIPlayer
    SXM_EXTRA_ARGS="$SXM_PLAYER_CLASS --channel-id $SXM_ARCHIVE"

    echo "Running archiver..."
else
    echo "Running HLS proxy..."
fi

sxm-player $SXM_EXTRA_ARGS
