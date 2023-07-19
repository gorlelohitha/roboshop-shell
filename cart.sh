cp cart.service /etc/systemd/system/user.service


curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd roboshop
mkdir /app
curl -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
unzip /tmp/cart.zip
cd /app
npm installsystemctl

systemctl daemon-reload
systemctl enable cart
systemctl restart cart
