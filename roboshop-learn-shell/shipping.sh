source common.sh
app_name=shipping
print_heading ""
dnf makecache
print_heading ""
cp -r shipping.service /etc/systemd/system/shipping.service
print_heading ""
dnf install maven -y
print_heading ""
useradd roboshop
print_heading ""
rm -rf /app
mkdir /app 
print_heading ""
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping-v3.zip 
cd /app 
unzip /tmp/shipping.zip
print_heading ""
cd /app 
mvn clean package 
mv target/shipping-1.0.jar shipping.jar 
print_heading ""
systemctl daemon-reload
print_heading ""
systemctl enable shipping 
systemctl start shipping
print_heading ""
dnf install mysql -y 
print_heading ""
mysql -h 172.31.26.41 -uroot -pRoboShop@1 < /app/db/schema.sql
print_heading ""
mysql -h 172.31.26.41 -uroot -pRoboShop@1 < /app/db/app-user.sql 
print_heading ""
mysql -h 172.31.26.41 -uroot -pRoboShop@1 < /app/db/master-data.sql
print_heading ""
systemctl restart shipping
print_heading ""
systemctl status shipping ; tail -f /var/log/messages