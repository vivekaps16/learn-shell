source common.sh
app_name=mongodb
print_heading ""
cp -r mongodb.repo /etc/yum.repos.d/
print_heading ""
dnf install mongodb-org -y 
print_heading ""
print_heading ""
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
print_heading ""
systemctl enable mongod 
systemctl restart mongod
systemctl status mongod ; tail -f /var/log/messages
