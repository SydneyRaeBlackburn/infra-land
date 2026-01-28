FROM nginx:alpine

RUN mkdir -p /var/www/html
COPY index.html /var/www/html

COPY --chmod=0444 nginx.conf /etc/nginx/nginx.conf