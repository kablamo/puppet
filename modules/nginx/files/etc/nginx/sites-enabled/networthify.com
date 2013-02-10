# HTTP
server {
	listen 80 default_server;
	server_name networthify.com www.networthify.com;
	location / { proxy_pass http://127.0.0.1:10002; }
}


# HTTPS
server {
	listen 443 ssl default_server;
	server_name networthify.com www.networthify.com;

	ssl on;
	ssl_certificate /home/eric/ssl/bundle.pem;
	ssl_certificate_key /home/eric/ssl/ssl.key;
    ssl_session_cache shared:SSL:15m;
	ssl_session_timeout 10m;
	ssl_protocols SSLv3 TLSv1;
	ssl_ciphers ALL:!ADH:!EXPORT56:RC4+RSA:+HIGH:+MEDIUM:+LOW:+SSLv3:+EXP;
	ssl_prefer_server_ciphers on;

	location / { proxy_pass http://127.0.0.1:10002; }
}
