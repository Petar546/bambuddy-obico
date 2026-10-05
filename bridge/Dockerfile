# syntax=docker/dockerfile:1
FROM docker.io/alexxit/go2rtc:master

# OPTIMIZATION: Write config using single-line string formatting
RUN echo -e 'streams:\n  p1s: ffmpeg:rtsps://bblp:${BAMBU_ACCESS_CODE}@${BAMBU_PRINTER_IP}:8883/ams/stream.amv?bambu_tunnel#video=h264#raw=-vf scale=640:480,fps=5\napi:\n  listen: ":1984"' > /go2rtc.yaml

EXPOSE 1984

# FIX: Point to the correct binary location at the root level
CMD ["/go2rtc", "-config", "/go2rtc.yaml"]
