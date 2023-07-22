echo ">>>>>>>>>>> create Catalogue service <<<<<<<<"


cp catalogue.service /etc/systemd/system/catalogue.service
 echo ">>>>>>>>>>> create Mongodb Repo <<<<<<<<"

cp mongo.repo /etc/yum.repos.d/mongo.repo
echo ">>>>>>>>>>> Install NodeJs <<<<<<<<"

curl -sL https://rpm.nodesource.com/setup_lts.x | bash
 echo ">>>>>>>>>>> Install NodeJs <<<<<<<<"

yum install nodejs -y
 echo ">>>>>>>>>>> Create Application User <<<<<<<<"

useradd roboshop
 echo ">>>>>>>>>>>  Create Application Director <<<<<<<<"

mkdir /app
 echo ">>>>>>>>>>> Download Application Directory <<<<<<<<"

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
 echo ">>>>>>>>>>> Extract Application Content <<<<<<<<"


cd /app
unzip /tmp/catalogue.zip


cd /app
 echo ">>>>>>>>>>> Download Nodes Js <<<<<<<<"

npm install
 echo ">>>>>>>>>>> Install Mongo Client <<<<<<<<"

yum install mongodb-org-shell -y
 echo ">>>>>>>>>>> Load Catalogue Schema <<<<<<<<"


mongo --host mongodb.devopsb17.online </app/schema/catalogue.js

 echo ">>>>>>>>>>> start Catalogue Service <<<<<<<<"
systemctl daemon-reload
systemctl enable catalogue
systemctl restart catalogue


