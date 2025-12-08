FROM nginx:alpine

# Copy the static content
COPY index.html /usr/share/nginx/html/index.html

# Copy the custom Nginx config file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Start Nginx using the default CMD (which is 'nginx -g daemon off;')
# The base image already has the correct command to run Nginx in the foreground.
EXPOSE 8080