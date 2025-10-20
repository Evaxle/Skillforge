This is a set of all my designed tools for developers and users with downloads and browser the number at the top on each page is the age i made the program/tool i hope you find these useful enjoy!

## Quick start

Preview locally with the included lightweight static server (requires Node.js):

```bash
# install dev deps (optional) and run a preview server on port 8000
npm ci
npm run dev
# then open http://localhost:8000/editor.html
```

Build and run the provided Docker image (serves files via Nginx on port 8000):

```bash
# Build the image
docker build -t skillforge:latest .

# Run the container and map port 8000
docker run --rm -p 8000:8000 skillforge:latest

# Open http://localhost:8000/editor.html
```

Notes:
- `package-lock.json` is included to pin development tooling versions (http-server, prettier). If you want a fully accurate lockfile please run `npm install` locally; npm will generate a complete file with verified integrity hashes.
- The Dockerfile exposes a build-time ARG `PORT` (default 8000). You can override it when building: `docker build --build-arg PORT=8080 -t skillforge:latest .`
