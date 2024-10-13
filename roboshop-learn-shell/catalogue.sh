source common.sh
app_name=catalogue
print_heading ""
dnf makecache
print_heading ""
cp -r catalogue.service /etc/systemd/system/catalogue.service
dnf module disable nodejs -y
dnf module enable nodejs:20 -y
print_heading ""
Iprint_heading ""nstall NodeJS

dnf install nodejs -y
print_heading ""
useradd roboshop
print_heading ""
rm -rf /app
mkdir /app 
print_heading ""
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip 
cd /app 
unzip /tmp/catalogue.zip
print_heading ""
cd /app 
npm install 
print_heading ""
systemctl daemon-reload
systemctl enable catalogue 
systemctl start catalogue
dnf install mongodb-mongosh -y
print_heading ""
mongosh --host 172.31.30.239 </app/db/master-data.js
print_heading ""
systemctl status catalogue ; tail -f /var/log/messages