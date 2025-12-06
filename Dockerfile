FROM klakegg/hugo:0.152.2-ext-alpine AS builder
WORKDIR /src
COPY . .
ARG BASE_URL=/
RUN hugo --gc --minify -b $BASE_URL

FROM caddy:alpine
COPY --from=builder /src/public /usr/share/caddy
EXPOSE 80
