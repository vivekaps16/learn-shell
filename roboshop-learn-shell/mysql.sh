source common.sh
app_name=mysql
print_heading ""
dnf makecache &>>$log_file
print_heading ""
dnf install mysql-server -y &>>$log_file
print_heading ""
systemctl enable mysqld &>>$log_file
systemctl start mysqld   &>>$log_file
print_heading ""
mysql_secure_installation --set-root-pass RoboShop@1 &>>$log_file
print_heading ""
systemctl status mysqld ; tail -f /var/log/messages &>>$log_file