echo ">>>>>>>>>>> create Catalogue service <<<<<<<<"


cp catalogue.service /etc/systemd/system/catalogue.service >/tmp/roboshop.log
 echo ">>>>>>>>>>> create Mongodb Repo <<<<<<<<"

cp mongo.repo /etc/yum.repos.d/mongo.repo >/tmp/roboshop.lo
echo ">>>>>>>>>>> Install NodeJs <<<<<<<<"

curl -sL https://rpm.nodesource.com/setup_lts.x | bash >/tmp/roboshop.lo
 echo ">>>>>>>>>>> Install NodeJs <<<<<<<<"

yum install nodejs -y >/tmp/roboshop.lo
 echo ">>>>>>>>>>> Create Application User <<<<<<<<"

useradd roboshop >/tmp/roboshop.lo
 echo ">>>>>>>>>>>  Create Application Director <<<<<<<<"

mkdir /app >/tmp/roboshop.lo
 echo ">>>>>>>>>>> Download Application Directory <<<<<<<<"

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip >/tmp/roboshop.lo
 echo ">>>>>>>>>>> Extract Application Content <<<<<<<<"


cd /app >/tmp/roboshop.lo
unzip /tmp/catalogue.zip


cd /app >/tmp/roboshop.lo
 echo ">>>>>>>>>>> Download Nodes Js <<<<<<<<"

npm install >/tmp/roboshop.lo
 echo ">>>>>>>>>>> Install Mongo Client <<<<<<<<"

yum install mongodb-org-shell -y >/tmp/roboshop.lo
 echo ">>>>>>>>>>> Load Catalogue Schema <<<<<<<<"


mongo --host mongodb.devopsb17.online </app/schema/catalogue.js >/tmp/roboshop.lo

 echo ">>>>>>>>>>> start Catalogue Service <<<<<<<<"
systemctl daemon-reload >/tmp/roboshop.lo
systemctl enable catalogue >/tmp/roboshop.lo
systemctl restart catalogue >/tmp/roboshop.lo


