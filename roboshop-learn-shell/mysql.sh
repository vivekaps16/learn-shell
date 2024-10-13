source common.sh
app_name=mysql

dnf makecache

dnf install mysql-server -y

systemctl enable mysqld
systemctl start mysqld  

mysql_secure_installation --set-root-pass RoboShop@1

systemctl status mysqld ; tail -f /var/log/messages