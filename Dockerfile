FROM golang:1.26-alpine AS build
WORKDIR /src
COPY main.go .
COPY go.mod .
RUN go build -o /pingpong

FROM alpine
RUN apk add --no-cache curl tcpdump iproute2
COPY --from=build /pingpong /pingpong
CMD ["/pingpong"]
