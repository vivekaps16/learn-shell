source common.sh
app_name=cart
print_heading ""
dnf makecache
print_heading ""
cp -r cart.service /etc/systemd/system/cart.service
print_heading ""
dnf module disable nodejs -y
dnf module enable nodejs:20 -y
print_heading ""
dnf install nodejs -y
print_heading ""
useradd roboshop
print_heading ""
rm -rf /app
mkdir /app 
print_heading ""
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart-v3.zip
cd /app 
unzip /tmp/cart.zip
print_heading ""
cd /app 
npm install
print_heading ""
systemctl daemon-reload
systemctl enable cart 
systemctl start cart ; tail -f /var/log/messages


