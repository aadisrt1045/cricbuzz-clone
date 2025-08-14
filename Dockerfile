# 1. Use a lightweight Nginx image
FROM nginx:stable-alpine

# 2. Remove default Nginx static content
RUN rm -rf /usr/share/nginx/html/*

# 3. Copy built (or raw) site files into Nginx
COPY . /usr/share/nginx/html

# 4. Optionally, expose port 80
EXPOSE 80

# 5. Start Nginx
CMD ["nginx", "-g", "daemon off;"]
