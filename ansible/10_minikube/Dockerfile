FROM golang:1.16.4
RUN mkdir /app
COPY main.go go.mod /app/
WORKDIR /app
RUN go build -o main . 
CMD ["/app/main"]