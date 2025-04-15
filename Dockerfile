FROM gcc:4.9 AS builder
WORKDIR /app
COPY main.c .
RUN gcc -o myapp main.c

FROM fedora:latest
WORKDIR /app
COPY --from=builder /app/myapp .
CMD ["./myapp"]
