# Stage 1: Build
FROM swift:6.0 AS builder

WORKDIR /app

COPY Package.swift .
COPY Sources/ Sources/
COPY Tests/ Tests/

RUN swift build -c release

# Stage 2: Run tests
FROM builder AS tester

RUN swift test

# Stage 3: Runtime
FROM swift:6.0-slim

WORKDIR /app

COPY --from=builder /app/.build/release/Connect4Game .

ENTRYPOINT ["./Connect4Game"]
