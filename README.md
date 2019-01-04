# Thumbor

An inoffical thumbor docker image, made with love.

## What is Thumbor? 

Thumbor is a smart imaging service. It enables on-demand 
crop, resizing and flipping of images.

See: http://thumbor.org

## How to use this image

Simply run: `docker run -p 8888:8888 mvhirsch/thumbor:latest`
You're now ready to serve.

It will run with the local result-storage 
`/usr/local/thumbor/result`.

### Configuration

You can override anything by passing the ENV parameters to
your docker run command. Take a look at the configuration
file at [configuration template](./6/slim/thumbor.conf.tpl).

## Image Variants

Currently this image comes only with basic packages needed
to run thumbor.

### `mvhirsch/thumbor:slim`

The defacto image. This is build upon `python:2-slim`.

### `mvhirsch/thumbor:alpine`

Still, there is not an alpine version available, but I'll
build one in future. Please feel free to contribute: 
https://github.com/mvhirsch/thumbor-docker/issues

### `mvhirsch/thumbor-fundamentals:slim`

I love the word "fundamentals" in here.
The main idea of this image, is to provide a current 
recommended solution (2018) based on 
[Google's Web Fundamentals](https://developers.google.com/web/fundamentals/).

For now, this comes with `mozjpeg` (lossy) and `pngquant`
(lossy) to optimize images.

### `mvhirsch/thumbor-opencv:latest`

Currently _not supported_. Please feel free to contribute:
https://github.com/mvhirsch/thumbor-docker/issues

## Why another Docker Image?

I've create this one because I wanted a small footprint
on my images. This image adds _only_ 455 MB, instead of 
nearly 1700 MB amongst similar images out there.


Many thanks go to: 

- [APSL/docker-thumbor](https://github.com/APSL/docker-thumbor)
- [MinimalCompact/docker-thumbor](https://github.com/MinimalCompact/thumbor)
