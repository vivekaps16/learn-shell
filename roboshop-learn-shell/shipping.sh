source common.sh
app_name=shipping

dnf makecache

cp -r shipping.service /etc/systemd/system/shipping.service

dnf install maven -y

useradd roboshop

rm -rf /app
mkdir /app 

curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping-v3.zip 
cd /app 
unzip /tmp/shipping.zip

cd /app 
mvn clean package 
mv target/shipping-1.0.jar shipping.jar 

systemctl daemon-reload

systemctl enable shipping 
systemctl start shipping

dnf install mysql -y 

mysql -h 172.31.26.41 -uroot -pRoboShop@1 < /app/db/schema.sql

mysql -h 172.31.26.41 -uroot -pRoboShop@1 < /app/db/app-user.sql 

mysql -h 172.31.26.41 -uroot -pRoboShop@1 < /app/db/master-data.sql

systemctl restart shipping

systemctl status shipping ; tail -f /var/log/messages