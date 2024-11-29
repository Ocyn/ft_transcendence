# OS
FROM alpine:3.19.3

# Update apk, install nginx and openssl, then clear the cache
RUN apk update; apk upgrade; \
apk add --no-cache nginx openssl \
rm -rf /var/cache/apk/*

# Generate Self Signed Certificate
RUN openssl req -x509 -nodes -newkey rsa:2048 \
-keyout /etc/ssl/jcuzin.42.fr.key -out /etc/ssl/jcuzin.42.fr.crt \
-subj "/C=FR/L=Lyon/O=42/OU=42Lyon/CN=jcuzin"

COPY ./src/nginx.conf /etc/nginx/http.d/nginx.conf

EXPOSE 443

# Start Nginx service
CMD ["nginx", "-g", "daemon off;"]
