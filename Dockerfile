FROM openresty/openresty:alpine

# Install lua-resty-http
RUN apk add --no-cache git make \
    && cd /tmp \
    && git clone https://github.com/ledgetech/lua-resty-http \
    && cd lua-resty-http \
    && make install \
    && rm -rf /tmp/lua-resty-http

# Create necessary directories
RUN mkdir -p /var/log/nginx

COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80