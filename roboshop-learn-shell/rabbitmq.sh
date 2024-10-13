source common.sh
app_name=rabbitmq


dnf makecache

cp -r rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo
dnf install rabbitmq-server -y

systemctl enable rabbitmq-server

systemctl start rabbitmq-server

rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
systemctl status rabbitmq-servert ; tail -f /var/log/messages