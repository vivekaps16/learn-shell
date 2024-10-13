
cp -r mongodb.repo /etc/yum.repos.d/
dnf install mongodb-org -y 
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
systemctl enable mongod 
systemctl restart mongod
systemctl status mongod ; tail -f /var/log/messages
