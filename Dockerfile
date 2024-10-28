# Use the official Nginx image as the base image
FROM nginx:alpine

# Copy all files from the local 'public' folder to Nginx's default static files location
COPY public /usr/share/nginx/html

# Expose the default Nginx port (80) for web traffic
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
