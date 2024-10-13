source common.sh
app_name=dispatch
print_heading ""
dnf makecache &>>$log_file
print_heading ""
cp -r dispatch.service /etc/systemd/system/dispatch.service &>>$log_file
print_heading ""
dnf install golang -y &>>$log_file
print_heading ""
useradd roboshop &>>$log_file
print_heading ""
rm -rf /app &>>$log_file
mkdir /app  &>>$log_file
print_heading ""
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch-v3.zip  &>>$log_file
cd /app  &>>$log_file
unzip /tmp/dispatch.zip &>>$log_file
cd /app  &>>$log_file
go mod init dispatch 
go get 
go build
systemctl daemon-reload &>>$log_file
print_heading ""

systemctl enable dispatch &>>$log_file
systemctl start dispatch ; tail -f /var/log/messages &>>$log_file