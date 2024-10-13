source common.sh
app_name=catalogue
print_heading ""
dnf makecache &>>$log_file
print_heading ""
cp -r catalogue.service /etc/systemd/system/catalogue.service &>>$log_file
dnf module disable nodejs -y &>>$log_file
dnf module enable nodejs:20 -y &>>$log_file
print_heading ""
Iprint_heading ""nstall NodeJS &>>$log_file

dnf install nodejs -y &>>$log_file
print_heading ""
useradd roboshop &>>$log_file
print_heading ""
rm -rf /app  &>>$log_file
mkdir /app  &>>$log_file
print_heading ""
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip  &>>$log_file
cd /app  &>>$log_file
unzip /tmp/catalogue.zip &>>$log_file
print_heading ""
cd /app  &>>$log_file
npm install  &>>$log_file
print_heading ""
systemctl daemon-reload &>>$log_file
systemctl enable catalogue  &>>$log_file
systemctl start catalogue &>>$log_file
dnf install mongodb-mongosh -y &>>$log_file
print_heading ""
mongosh --host 172.31.30.239 </app/db/master-data.js &>>$log_file
print_heading ""
systemctl status catalogue ; tail -f /var/log/messages &>>$log_file