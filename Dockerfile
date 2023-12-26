FROM nginx:1.25.3
LABEL describe="test image"
RUN mkdir mkdir /root/project/nginx_config/cert/ -p
COPY cert/server.pem root/project/nginx_config/cert/server.pem 
COPY cert/private.key root/project/nginx_config/cert/private.key 
# COPY www /usr/share/nginx/html
# docker build -t ng:v4 .
# docker run -d -it -p 443:443 ng:v3 /bin/bash
# docker exec -it bb8 /bin/bash
COPY nginx.conf /etc/nginx/nginx.conf

# VOLUME nginx.conf /etc/nginx/nginx.conf
ENV NGINX_VERSION 1.25.3
# EXPOSE 80/tcp
# EXPOSE 80/udp
EXPOSE 443/tcp
EXPOSE 443/udp
EXPOSE 443

# RUN ["/bin/bash","-c","echo hello world"]
CMD ["nginx", "-g", "daemon off;"]