FROM rust:1.82 AS builder
WORKDIR /usr/src
RUN apt-get update -y && apt-get install -y \
    git \
    build-essential \
    clang \
    curl \
    libssl-dev \
    protobuf-compiler \
    libprotobuf-dev \
    mold \
 && rm -rf /var/lib/apt/lists/*
RUN rustup component add rustfmt clippy \
    && rustup target add wasm32-unknown-unknown \
    && cargo install wasm-tools