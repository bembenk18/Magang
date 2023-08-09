/etc/nginx/nginx.conf
events {
        worker_connections 1024;
}
http {
        upstream backend {
        random;
        server localhost:8081;
        server localhost:8082;
        server localhost:8083;
}
        server {
        listen 80;
        location / {
                proxy_pass http://backend;
        }
}
}

