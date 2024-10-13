source common.sh
app_name=rabbitmq

print_heading ""
dnf makecache &>>$log_file
print_heading ""
cp -r rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo &>>$log_file
dnf install rabbitmq-server -y &>>$log_file
print_heading ""
systemctl enable rabbitmq-server &>>$log_file
print_heading ""
systemctl start rabbitmq-server &>>$log_file
print_heading ""
rabbitmqctl add_user roboshop roboshop123 &>>$log_file
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>$log_file
systemctl status rabbitmq-servert ; tail -f /var/log/messages &>>$log_file