FROM golang:1.23-bullseye AS builder
WORKDIR /workspace
COPY . .
RUN go mod download
RUN apt-get update && apt-get install -y build-essential
RUN make install
RUN cp ~/go/bin/polycli /usr/bin/polycli

USER 65532:65532
ENTRYPOINT ["polycli"]
CMD ["--help"]

