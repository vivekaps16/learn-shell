source common.sh
app_name=redis
print_heading ""
dnf makecache
dnf module disable redis -y
dnf module enable redis:7 -y
print_heading ""
dnf install redis -y 
print_heading ""
sed -i -e 's/127.0.0.1/0.0.0.0/' -e '/protected-mode/ c protected-mode no' /etc/redis/redis.conf
systemctl enable redis 
systemctl start redis 
systemctl status redis ; tail -f /var/log/messages