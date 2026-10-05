# syntax=docker/dockerfile:1
FROM docker.io/library/alpine:3.18 AS builder
RUN apk add --no-cache build-base git go ffmpeg-dev
WORKDIR /src
RUN git clone https://github.com . && \
    GOOS=linux go build -ldflags "-s -w" -o go2rtc

FROM docker.io/library/alpine:3.18
RUN apk add --no-cache ffmpeg ca-certificates tzdata
WORKDIR /app
COPY --from=builder /src/go2rtc /app/go2rtc
RUN echo ' \
streams: \
  p1s: ffmpeg:rtsps://bblp:${BAMBU_ACCESS_CODE}@${BAMBU_PRINTER_IP}:8883/ams/stream.amv?bambu_tunnel \
api: \
  listen: ":1984" \
' > /app/go2rtc.yaml
EXPOSE 1984
CMD ["/app/go2rtc", "-config", "/app/go2rtc.yaml"]
