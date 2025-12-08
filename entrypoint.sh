#!/bin/sh
# Use 'envsubst' to replace the ${PORT} variable in nginx.conf 
# with the actual value of the environment variable $PORT (usually 8080 in Cloud Run)
# and output the result to the main Nginx config location.
envsubst '$PORT' < /etc/nginx/nginx.conf.template > /etc/nginx/conf.d/default.conf

# Start Nginx in the foreground
exec nginx -g 'daemon off;'
