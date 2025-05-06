FROM nginx:alpine
LABEL maintainer="winniehuang"
COPY index.html /usr/share/nginx/html/
COPY dinasour.png /usr/share/nginx/html/
COPY snowman.jpg /usr/share/nginx/html/
