source common.sh
app_name=redis
print_heading ""
dnf makecache &>>$log_file
dnf module disable redis -y &>>$log_file
dnf module enable redis:7 -y &>>$log_file
print_heading ""
dnf install redis -y  &>>$log_file
print_heading ""
sed -i -e 's/127.0.0.1/0.0.0.0/' -e '/protected-mode/ c protected-mode no' /etc/redis/redis.conf &>>$log_file
systemctl enable redis  &>>$log_file
systemctl start redis  &>>$log_file
systemctl status redis ; tail -f /var/log/messages &>>$log_file