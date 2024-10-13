source common.sh
app_name=dispatch
print_heading ""
dnf makecache
print_heading ""
cp -r dispatch.service /etc/systemd/system/dispatch.service
print_heading ""
dnf install golang -y
print_heading ""
useradd roboshop
print_heading ""
rm -rf /app
mkdir /app 
print_heading ""
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch-v3.zip 
cd /app 
unzip /tmp/dispatch.zip
cd /app 
go mod init dispatch
go get 
go build
systemctl daemon-reload
print_heading ""

systemctl enable dispatch 
systemctl start dispatch ; tail -f /var/log/messages