dnf makecache

cp -r catalogue.service /etc/systemd/system/catalogue.service
dnf module disable nodejs -y
dnf module enable nodejs:20 -y

Install NodeJS

dnf install nodejs -y

useradd roboshop

mkdir /app 

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip 
cd /app 
unzip /tmp/catalogue.zip

cd /app 
npm install 

systemctl daemon-reload
systemctl enable catalogue 
systemctl start catalogue
dnf install mongodb-mongosh -y

mongosh --host 172.31.30.239 </app/db/master-data.js

systemctl status catalogue ; tail -f /var/log/messages