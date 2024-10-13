source common.sh
app_name=user
print_heading ""
dnf makecache
print_heading ""
cp -r user.service /etc/systemd/system/user.service
dnf module disable nodejs -y
dnf module enable nodejs:20 -y
print_heading ""
dnf install nodejs -y
print_heading ""
useradd roboshop
rm -rf /app
mkdir /app 
print_heading ""
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user-v3.zip 
cd /app 
unzip /tmp/user.zip
print_heading ""
cd /app 
npm install 
print_heading ""
systemctl enable user 
systemctl start user
systemctl status user ; tail -f /var/log/messages