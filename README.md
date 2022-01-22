# Thumbor

An inoffical thumbor docker image, made with ❤️

## What is Thumbor?

Thumbor is a smart imaging service. It enables on-demand
crop, resizing and flipping of images.

See: http://thumbor.org

## How to use this image

Simply run: `docker run -p 8888:8888 mvhirsch/thumbor:latest`
You're now ready to serve.

It will run with the local result-storage `/usr/local/thumbor/result`.

### Configuration

You can override anything by passing the ENV parameters to
your docker run command. Take a look at the configuration
file at [configuration template](./7/slim/thumbor.conf.tpl).

### Volumes

By default `thumbor` uses local file based storages, you could mount volumes to:

- /usr/local/thumbor/storage
- /usr/local/thumbor/result_storage

If you need another storage system, please check out [the docs](https://thumbor.readthedocs.io/en/latest/plugins.html#storages). If you need **AWS S3** support, check out `mvhirsch/thumbor-fundamentals:7-slim` image.

### Securing thumbor

On production systems please consider the following options:

- `ALLOW_UNSAFE_URL` (default `False`): Disallow "unsafe" (non HMAC-signed) URLs [Docs](https://thumbor.readthedocs.io/en/latest/configuration.html#allow-unsafe-url)
- `SECURITY_KEY` (default `MY_SECURE_KEY`): a shared secret for HMAC-signing URLs

Please check out [HMAC signing](https://thumbor.readthedocs.io/en/latest/security.html) in the docs for more information.

### Healthcheck

On production you should enable a healthcheck to make sure, your service is up and running. Luckily `thumbor` comes with a simple [healthcheck API built-in](https://thumbor.readthedocs.io/en/latest/configuration.html#healthcheck).

By default, it's `localhost:8888/healthcheck/?`. You can change it with the `HEALTHCHECK_ROUTE` environment variable.

## Image Variants

Currently this image comes only with basic packages needed
to run thumbor.

### `mvhirsch/thumbor:7-slim`

The defacto image. This is build upon `python:3-slim`.

### `mvhirsch/thumbor:7-alpine`

An alpine version for smaller image size.

### `mvhirsch/thumbor-fundamentals:7-slim`

I love the word "fundamentals" in here.
The main idea of this image, is to provide a current
recommended solution (2018) based on
[Google's Web Fundamentals](https://developers.google.com/web/fundamentals/).

For now, this comes with `mozjpeg` (lossy) and `pngquant`
(lossy) to optimize images by default.

It also supports **AWS S3**, you just need to add some configuration:

```yaml
# if you use unsafe (non HMAC) URLs and want to store results, too - you need to activate them. If you always use HMAC signed URLs, you can simply skip this setting
RESULT_STORAGE_STORES_UNSAFE: True

# configure Result Storage
RESULT_STORAGE: thumbor_aws.result_storage
AWS_RESULT_STORAGE_BUCKET_NAME: thumbor
AWS_RESULT_STORAGE_ROOT_PATH: /thumbs
AWS_RESULT_STORAGE_S3_ACCESS_KEY_ID: <access key>
AWS_RESULT_STORAGE_S3_SECRET_ACCESS_KEY: <secret>

# configure storage (cache)
STORAGE: thumbor_aws.storage
AWS_STORAGE_ROOT_PATH: /storage
AWS_STORAGE_BUCKET_NAME: thumbor
AWS_STORAGE_S3_ACCESS_KEY_ID: <access key>
AWS_STORAGE_S3_SECRET_ACCESS_KEY: <secret>
```
