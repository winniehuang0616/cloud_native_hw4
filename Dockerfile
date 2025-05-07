FROM nginx:alpine
LABEL maintainer="winniehuang"
COPY index.html /usr/share/nginx/html/
COPY ./photo/dinasour.png /usr/share/nginx/html/
COPY ./photo/snowman.jpg /usr/share/nginx/html/
COPY ./photo/xmas.jpg /usr/share/nginx/html/
