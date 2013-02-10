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
	ssl_session_timeout 10m;
	ssl_ciphers RC4:HIGH:!aNULL:!MD5;
	ssl_prefer_server_ciphers on;

	location / { proxy_pass http://127.0.0.1:10002; }
}
