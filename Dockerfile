# Use the lightweight, stable Nginx Alpine image as the runtime image.
# This container simply serves the static files located in the repository's
# `public/` directory using Nginx.
FROM nginx:stable-alpine

# Optional build-time argument to change the listen port. Defaults to 8000
# (you can override with `--build-arg PORT=XXXX` when building the image).
ARG PORT=8000

LABEL org.opencontainers.image.source="https://github.com/Evaxle/Skillforge"
LABEL maintainer="Evaxle <noreply@example.com>"

# Copy the static site into the location where Nginx serves files.
# Using a single COPY keeps the image layer small and predictable.
COPY public /usr/share/nginx/html

# Update the default Nginx site config to listen on the chosen PORT.
# This substitutes the build-time ARG into the config file.
RUN sed -i "s/listen 80;/listen ${PORT};/" /etc/nginx/conf.d/default.conf || true

# Expose the same PORT so it's clearer for anyone running the container.
EXPOSE ${PORT}

# Use the default Nginx foreground command so containers keep running.
CMD ["nginx", "-g", "daemon off;"]
