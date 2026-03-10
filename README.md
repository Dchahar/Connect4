# Connect 4

A terminal-based Connect 4 game built in Swift, developed using **TDD**, **Object Calisthenics**, and **SOLID** principles.

## Features

- 6×7 board with emoji-based UI (🟡 🔴 ⚪)
- Two-player alternating turns
- Win detection: horizontal, vertical, and diagonal
- Draw detection when the board is full
- Play consecutive games with rematch prompt
- Game history tracking across sessions

## Requirements

- Swift 6.0+
- macOS or Linux

## Run Locally

```bash
swift build
swift run Connect4Game
```

## Run Tests

```bash
swift test
```

## Run with Docker

```bash
docker build -t connect4 .
docker run -it connect4
```

Or pull the pre-built image:

```bash
docker pull ghcr.io/dchahar/connect4:latest
docker run -it ghcr.io/dchahar/connect4:latest
```

## CI/CD

GitHub Actions runs on every push to `main`:

- **Build & Test** — compiles and runs all unit tests
- **SwiftLint** — enforces code style with strict mode
- **Docker Build & Push** — publishes image to GitHub Container Registry
