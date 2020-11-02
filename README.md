# Source of https://returnco.de

## Overview
This is a super simple service for generating different HTTP codes.

It's useful for testing how your own scripts deal with varying responses.

## How does it work?

1. Deploy to a small Linux system
2. Builds on top of [lighttpd](https://www.lighttpd.net/) web-server
3. Uses a couple of lines of [LUA](http://www.lua.org/) scripting
4. The scripts rely on lighttpd making available the request content (request line, host, port) via "lighty.env" dict

## Caveats

This repo is *not* intended as a 1:1 deployable image or overlay. The intention is to expose the source code, not provide a ready-to-run image.

I _may_ add a [Dockerfile](https://docs.docker.com/engine/reference/builder/) eventually, time permitting.

## Tips, Improvements, Security Issues

You're welcome to clone, deploy, improve &amp; share!

