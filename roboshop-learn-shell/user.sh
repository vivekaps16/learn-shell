source common.sh
app_name=user
print_heading ""
dnf makecache &>>$log_file
print_heading ""
cp -r user.service /etc/systemd/system/user.service &>>$log_file
dnf module disable nodejs -y &>>$log_file
dnf module enable nodejs:20 -y &>>$log_file
print_heading ""
dnf install nodejs -y &>>$log_file
print_heading ""
useradd roboshop &>>$log_file
rm -rf /app &>>$log_file
mkdir /app  &>>$log_file
print_heading ""
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user-v3.zip  &>>$log_file
cd /app  &>>$log_file
unzip /tmp/user.zip &>>$log_file
print_heading ""
cd /app &>>$log_file
npm install  &>>$log_file
print_heading ""
systemctl enable user  &>>$log_file
systemctl start user &>>$log_file
systemctl status user ; tail -f /var/log/messages &>>$log_file