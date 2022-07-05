FROM alpine:3.15
MAINTAINER raptor<raptor.zh@gmail.com>
EXPOSE 9000
COPY leanote /opt/leanote
WORKDIR /opt/leanote
CMD ["sh", "/opt/leanote/bin/run.sh"]
