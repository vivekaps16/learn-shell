source common.sh
app_name=payment
print_heading ""
dnf makecache

print_heading ""
cp -r payment.service /etc/systemd/system/payment.service
print_heading ""
dnf install python3 gcc python3-devel -y
print_heading ""
useradd roboshop
print_heading ""
rm -rf /app
mkdir /app 
print_heading ""
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment-v3.zip 
cd /app 
unzip /tmp/payment.zip
print_heading ""
cd /app 
pip3 install -r requirements.txt
print_heading ""

systemctl daemon-reload
print_heading ""
systemctl enable payment 
systemctl start payment ; tail -f /var/log/messages



