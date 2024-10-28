FROM nginx:alpine

# Copy your static files to Nginx's default location
COPY public /usr/share/nginx/html

# Change the default port in the Nginx configuration
RUN sed -i 's/listen 80;/listen 8000;/' /etc/nginx/conf.d/default.conf

# Expose the new port
EXPOSE 8000

CMD ["nginx", "-g", "daemon off;"]
