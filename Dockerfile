FROM golang:alpine3.17 as builder

WORKDIR /app
COPY . .
RUN go build -o /main main.go

FROM scratch

WORKDIR /app
COPY --from=builder /main /main

ENTRYPOINT [ "/main" ]