# Этап 1: Сборка приложения на C
FROM gcc:10 AS build_c
WORKDIR /app
COPY hello.c .
RUN gcc -o hello_c hello.c

# Этап 2: Сборка приложения на Go
FROM golang:1.20 AS build_go
WORKDIR /app
COPY hello.go .
RUN go build -o hello_go hello.go

# Этап 3: Финальный этап
FROM ubuntu:22.04
WORKDIR /app
COPY --from=build_c /app/hello_c .
COPY --from=build_go /app/hello_go .

# По умолчанию запуск приложения на C
ENTRYPOINT ["/app/hello_c"]

# Возможность переключения на приложение на Go
CMD ["/app/hello_go"]