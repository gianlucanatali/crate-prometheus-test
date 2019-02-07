FROM golang:1.8.3 as builder
RUN go get github.com/crate/crate_adapter
WORKDIR /go/src/github.com/crate/crate_adapter
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o crate_adapter .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /go/src/github.com/crate/crate_adapter/crate_adapter .
COPY config.yml .
EXPOSE 9268
CMD ["./crate_adapter"]
