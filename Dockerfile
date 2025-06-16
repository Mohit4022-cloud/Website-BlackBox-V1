FROM nginx:alpine

# Add build argument for cache busting
ARG CACHE_BUST=1

# Copy static files directly
COPY user-workspace/ /usr/share/nginx/html/

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Add cache bust environment variable
ENV CACHE_BUST=${CACHE_BUST}

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
