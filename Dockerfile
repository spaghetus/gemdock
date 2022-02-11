FROM rust as builder
RUN cargo install agate

FROM debian
COPY --from=builder /usr/local/cargo/bin/agate /usr/bin/agate
VOLUME [ "/certs", "/content" ]
CMD bash -c agate --content /content --certs /certs --hostname=localhost --lang=en-US
