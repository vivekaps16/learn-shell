source common.sh
app_name=shipping
print_heading ""
dnf makecache &>>$log_file
print_heading ""
cp -r shipping.service /etc/systemd/system/shipping.service &>>$log_file
print_heading ""
dnf install maven -y &>>$log_file
print_heading ""
useradd roboshop &>>$log_file
print_heading ""
rm -rf /app &>>$log_file
mkdir /app  &>>$log_file
print_heading ""
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping-v3.zip  &>>$log_file
cd /app  &>>$log_file
unzip /tmp/shipping.zip &>>$log_file
print_heading ""
cd /app &>>$log_file
mvn clean package 
mv target/shipping-1.0.jar shipping.jar &>>$log_file
print_heading ""
systemctl daemon-reload &>>$log_file
print_heading ""
systemctl enable shipping &>>$log_file
systemctl start shipping &>>$log_file
print_heading ""
dnf install mysql -y  &>>$log_file
print_heading ""
mysql -h 172.31.26.41 -uroot -pRoboShop@1 < /app/db/schema.sql &>>$log_file
print_heading ""
mysql -h 172.31.26.41 -uroot -pRoboShop@1 < /app/db/app-user.sql  &>>$log_file
print_heading ""
mysql -h 172.31.26.41 -uroot -pRoboShop@1 < /app/db/master-data.sql &>>$log_file
print_heading ""
systemctl restart shipping &>>$log_file
print_heading ""
systemctl status shipping ; tail -f /var/log/messages &>>$log_file