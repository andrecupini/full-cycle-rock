FROM golang:alpine as alpine
WORKDIR /usr/src/app
COPY ./full-cycle-rocks.go .
RUN CGO_ENABLED=0 go build -o /app full-cycle-rocks.go

FROM scratch
COPY --from=alpine /app /app
CMD ["/app"]