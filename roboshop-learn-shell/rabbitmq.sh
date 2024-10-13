source common.sh
app_name=rabbitmq

print_heading ""
dnf makecache
print_heading ""
cp -r rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo
dnf install rabbitmq-server -y
print_heading ""
systemctl enable rabbitmq-server
print_heading ""
systemctl start rabbitmq-server
print_heading ""
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
systemctl status rabbitmq-servert ; tail -f /var/log/messages