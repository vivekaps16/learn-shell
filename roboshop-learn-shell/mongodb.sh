source common.sh
app_name=mongodb
print_heading ""
cp -r mongodb.repo /etc/yum.repos.d/ &>>$log_file
print_heading ""
dnf install mongodb-org -y  &>>$log_file
print_heading ""
print_heading ""
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>$log_file
print_heading ""
systemctl enable mongod  &>>$log_file
systemctl restart mongod &>>$log_file
systemctl status mongod ; tail -f /var/log/messages &>>$log_file
