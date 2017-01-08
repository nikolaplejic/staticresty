# StaticResty

Abusing nginx to convert & serve Markdown files as HTML on-the-fly.

## Dependencies 

StaticResty runs on OpenResty, the nginx bundle which includes loads of useful
modules.

Additionally, you'll need to install the `lua-discount` module either by using
LuaRocks or by building it manually.

## How?

For sample nginx configuration that uses StaticResty, check out `nginx.conf` in
this repository.

StaticResty piggybacks on the `ngx_http_autoindex_module`. It outputs the
directory listing as JSON, and then uses header & body filters from
`lua-nginx-module` to filter out non-Markdown files and render the listing as
HTML.

Markdown rendering happens on-the-fly using the `lua-discount` module.

## Why?

It's fun, and OpenResty is freaking amazing.
