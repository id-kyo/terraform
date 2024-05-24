#!/bin/bash

yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable https
echo "<html><body><h1>WEB TIER SUCCESS"</html></body></h1>" > /var/www/html/index.html