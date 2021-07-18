# sxm-player

[![Documentation Status](https://readthedocs.org/projects/sxm-player/badge/?version=latest)](https://sxm-player.readthedocs.io/en/latest/?badge=latest)
[![CI Status](https://github.com/AngellusMortis/sxm-player/actions/workflows/ci.yml/badge.svg)](https://github.com/AngellusMortis/sxm-player/actions/workflows/ci.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/afffd386b11a760d80cc/maintainability)](https://codeclimate.com/github/AngellusMortis/sxm-player/maintainability)
[![Latest PyPI version](https://pypip.in/v/sxm-player/badge.png)](https://pypi.org/project/sxm-player/)

> **warning**
>
> Designed for PERSONAL USE ONLY
>
> `sxm-player` is a 100% unofficial project and you use it at your own
> risk. It is designed to be used for personal use with a small number
> of users listening to it at once. Similar to playing music over a
> speakers from the radio directly. Using `sxm-player` in any corporate
> setting, to attempt to pirate music, or to try to make a profit off
> your subscription may result in you getting in legal trouble.

A pluggable SXM music player written in Python

- Free software: MIT license
- Documentation: <https://sxm-player.readthedocs.io>.

## Features

- Provides a CLI SXM client
- Can easily provide any SXM client via an anonymous HLS stream that
  can be play on any compatible remote client
- Provides CLI interface to play SXM channel to a MP3 file on disk
- Can archive live streams from a channel and process any songs/shows
  from it
- Pluggable API to allow you to create your own SXM clients on top of
  it

## Player Classes

Here are a list of know pluggable player classes you can use to extend
sxm-player

- [sxm-discord](https://github.com/AngellusMortis/sxm-discord): A
  Discord bot that lets you play SXM content

If you have developed your own player class, make a PR to add it here!
Or make an issue for me to add it.

## Usage

**NOTE**: `-it` is required when running this from command line (and not
via systemd, Portainer, etc.). If you do not pass `-it`, you will not have
proper color support and `SIGINT` (CTRL+C) will not work.

### Anonymous HLS Proxy

This will create an anonymous HLS proxy you can connect to with any
compatible client (i.e. ffmpeg).

``` {.sourceCode .console}
docker run --rm -it \
    -e SXM_USERNAME=username \
    -e SXM_PASSWORD=password \
    -p 9999:9999 \
    sxm:latest
$ ffmpeg -y -i http://127.0.0.1:9999/octane.m3u8 -f mp2 output.mp3
```

### Channel Archiver

This will stream a given channel and automatically [archive and
process](https://sxm-player.readthedocs.io/en/latest/usage.html) the
stream.

``` {.sourceCode .console}
docker run --rm -it \
    -v /path/to/output:/output \  # volume mount for your archive
    -e SXM_USERNAME=username \
    -e SXM_PASSWORD=password \
    -e SXM_ARCHIVE=octane \
    sxm:latest
```

### Plugins

#### `sxm-discord`: Discord Bot

This will run a Discord bot using the [sxm-discord plugin
player](https://sxm-discord.readthedocs.io/en/latest/usage.html). Can be
combined with `SXM_ARCHIVE` env to also archive anything the bot plays.

```bash
docker run --rm -it \
    -e SXM_USERNAME=username \
    -e SXM_PASSWORD=password \
    -e SXM_DISCORD_TOKEN=token \
    sxm:latest
```
