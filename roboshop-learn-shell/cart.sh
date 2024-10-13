source common.sh
app_name=cart
print_heading ""
dnf makecache &>>$log_file
print_heading ""
cp -r cart.service /etc/systemd/system/cart.service &>>$log_file
print_heading ""
dnf module disable nodejs -y &>>$log_file
dnf module enable nodejs:20 -y &>>$log_file
print_heading ""
dnf install nodejs -y &>>$log_file
print_heading ""
useradd roboshop &>>$log_file
print_heading ""
rm -rf /app &>>$log_file
mkdir /app  &>>$log_file
print_heading ""
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart-v3.zip &>>$log_file
cd /app  &>>$log_file
unzip /tmp/cart.zip &>>$log_file
print_heading ""
cd /app &>>$log_file
npm install &>>$log_file
print_heading ""
systemctl daemon-reload &>>$log_file
systemctl enable cart  &>>$log_file
systemctl start cart ; tail -f /var/log/messages &>>$log_file


