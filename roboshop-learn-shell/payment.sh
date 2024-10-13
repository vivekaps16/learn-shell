source common.sh
app_name=payment
print_heading ""
dnf makecache &>>$log_file

print_heading ""
cp -r payment.service /etc/systemd/system/payment.service &>>$log_file
print_heading ""
dnf install python3 gcc python3-devel -y &>>$log_file
print_heading ""
useradd roboshop &>>$log_file
print_heading ""
rm -rf /app &>>$log_file
mkdir /app  &>>$log_file
print_heading ""
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment-v3.zip  &>>$log_file
cd /app  &>>$log_file
unzip /tmp/payment.zip &>>$log_file
print_heading ""
cd /app  &>>$log_file
pip3 install -r requirements.txt &>>$log_file
print_heading ""

systemctl daemon-reload &>>$log_file
print_heading ""
systemctl enable payment &>>$log_file
systemctl start payment ; tail -f /var/log/messages &>>$log_file



