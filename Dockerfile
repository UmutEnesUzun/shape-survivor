FROM nginx:alpine
# Install 'envsubst' which is needed to dynamically set the port
RUN apk add --no-cache gettext-base

# Copy the custom Nginx config file to be used as a template
COPY nginx.conf /etc/nginx/nginx.conf.template

# Copy the static content
COPY index.html /usr/share/nginx/html/index.html

# Copy and set permissions for the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint to the custom script
ENTRYPOINT ["/entrypoint.sh"]

# Cloud Run automatically handles the port, but this is kept for reference
EXPOSE 8080
