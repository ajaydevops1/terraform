#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo service httpd start  
sudo systemctl enable httpd
echo "<h1>hi this ajay from naresh it ! and searching for onions</h1>" > /var/www/html/index.html
