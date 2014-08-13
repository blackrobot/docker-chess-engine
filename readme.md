# Docker Chess Engine
This docker image runs the Stockfish engine, and exposes it on port
8080.

To run, just expose the port on your host, and connect to it as you
would a normal remote UCI engine:
```bash
$ docker run -d -p 8080:8080 damon/chess-engine
```
