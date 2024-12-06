FROM openresty/openresty:alpine

# Install lua-resty-http with proper paths
RUN apk add --no-cache git make \
    && cd /tmp \
    && git clone https://github.com/ledgetech/lua-resty-http \
    && cd lua-resty-http \
    && cp -r lib/resty/http* /usr/local/openresty/lualib/resty/ \
    && rm -rf /tmp/lua-resty-http

# Create necessary directories
RUN mkdir -p /var/log/nginx

COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

EXPOSE 80