FROM alpine:latest 
LABEL maintainer="Luis G. More <lg_more@yahoo.com.ar>" 
LABEL description="This example Dockerfile installs NGINX." 
RUN apk add --update nginx && \
        rm -rf /var/cache/apk/* && \
        mkdir -p /tmp/nginx/ 
COPY files/nginx.conf /etc/nginx/nginx.conf 
COPY files/default.conf /etc/nginx/conf.d/default.conf 
ADD files/html.tar.gz /usr/share/nginx/ 
EXPOSE 80/tcp 
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
