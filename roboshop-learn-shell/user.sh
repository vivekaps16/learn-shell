dnf makecache

cp -r user.service /etc/systemd/system/user.service
dnf module disable nodejs -y
dnf module enable nodejs:20 -y

dnf install nodejs -y

useradd roboshop

mkdir /app 

curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user-v3.zip 
cd /app 
unzip /tmp/user.zip

cd /app 
npm install 

systemctl enable user 
systemctl start user
systemctl status user ; tail -f /var/log/messages