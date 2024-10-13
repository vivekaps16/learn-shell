source common.sh
app_name=mysql
print_heading ""
dnf makecache
print_heading ""
dnf install mysql-server -y
print_heading ""
systemctl enable mysqld
systemctl start mysqld  
print_heading ""
mysql_secure_installation --set-root-pass RoboShop@1
print_heading ""
systemctl status mysqld ; tail -f /var/log/messages