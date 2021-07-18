==========
sxm-player
==========

.. image:: https://readthedocs.org/projects/sxm-player/badge/?version=latest
    :target: https://sxm-player.readthedocs.io/en/latest/?badge=latest
    :alt: Documentation Status

.. image:: https://github.com/AngellusMortis/sxm-player/actions/workflows/ci.yml/badge.svg
    :target: https://github.com/AngellusMortis/sxm-player/actions/workflows/ci.yml
    :alt: CI Status

.. image:: https://api.codeclimate.com/v1/badges/afffd386b11a760d80cc/maintainability
   :target: https://codeclimate.com/github/AngellusMortis/sxm-player/maintainability
   :alt: Maintainability

.. image:: https://pypip.in/v/sxm-player/badge.png
    :target: https://pypi.org/project/sxm-player/
    :alt: Latest PyPI version

.. warning:: Designed for PERSONAL USE ONLY

    `sxm-player` is a 100% unofficial project and you use it at your own risk.
    It is designed to be used for personal use with a small number of users
    listening to it at once. Similar to playing music over a speakers from the
    radio directly. Using `sxm-player` in any corporate setting, to
    attempt to priate music, or to try to make a profit off your subscription
    may result in you getting in legal trouble.


A pluggable SXM music player written in Python


* Free software: MIT license
* Documentation: https://sxm-player.readthedocs.io.


Features
--------

* Provides a CLI SXM client
* Can easily provide any SXM client via an anonymous HLS stream that can
  be play on any compatible remote client
* Provides CLI interface to play SXM channel to a MP3 file on disk
* Can archive live streams from a channel and process any songs/shows from it
* Pluggable API to allow you to create your own SXM clients on top of it

Player Classes
--------------

Here are a list of know pluggable player classes you can use to extend
`sxm-player`

* `sxm-discord`_: A Discord bot that lets you play SXM content

If you have developed your own player class, make a PR to add it here! Or
make an issue for me to add it.

.. _sxm-discord: https://github.com/AngellusMortis/sxm-discord

Usage
-----

**NOTE**: `-it` is required when running this from command line (and not via systemd, Portainer, etc.). If you do
not pass `-it`, you will not have proper color support and `SIGINT` (CTRL+C) will not work.

Anonymous HLS Proxy
+++++++++++++++++++

This will create an anonymous HLS proxy you can connect to with any compatible client (i.e. `ffmpeg`).

.. code-block:: console

    $ docker run --rm -it \
        -e SXM_USERNAME=username \
        -e SXM_PASSWORD=password \
        -p 9999:9999 \
        sxm:latest
    $ ffmpeg -y -i http://127.0.0.1:9999/octane.m3u8 -f mp2 output.mp3

Channel Archiver
++++++++++++++++

This will stream a given channel and automatically `archive and process`_ the stream.

.. code-block:: console

    $ docker run --rm -it \
        -v /path/to/output:/output \  # volume mount for your archive
        -e SXM_USERNAME=username \
        -e SXM_PASSWORD=password \
        -e SXM_ARCHIVE=octane \
        sxm:latest

.. _archive and process: https://sxm-player.readthedocs.io/en/latest/usage.html

Plugins
+++++++

`sxm-discord`: Discord Bot
--------------------------

This will run a Discord bot using the `sxm-discord plugin player`_. Can be combined with `SXM_ARCHIVE` env to also archive
anything the bot plays.

.. code-block:: console

    $ docker run --rm -it \
        -e SXM_USERNAME=username \
        -e SXM_PASSWORD=password \
        -e SXM_DISCORD_TOKEN=token \
        sxm:latest

.. _sxm-discord plugin player: https://sxm-discord.readthedocs.io/en/latest/usage.html
