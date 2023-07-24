func_nodejs()
{
log=/tmp/roboshop.log
echo ">>>>>>>>>>> create ${component} service <<<<<<<<"
cp ${component}.service /etc/systemd/system/${component}.service &>>${log}
 echo ">>>>>>>>>>> create Mongodb Repo <<<<<<<<"

cp mongo.repo /etc/yum.repos.d/mongo.repo &>>${log}
echo ">>>>>>>>>>> Install NodeJs <<<<<<<<"

curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>${log}
 echo ">>>>>>>>>>> Install NodeJs <<<<<<<<"

yum install nodejs -y &>>${log}
 echo ">>>>>>>>>>> Create Application User <<<<<<<<"

useradd roboshop &>>${log}
 echo ">>>>>>>>>>>  Create Application Director <<<<<<<<"

mkdir /app &>>${log}
 echo ">>>>>>>>>>> Download Application Directory <<<<<<<<"

curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip &>>${log}
 echo ">>>>>>>>>>> Extract Application Content <<<<<<<<"


cd /app
unzip /tmp/${component}.zip$>>{log}


cd /app
 echo ">>>>>>>>>>> Download Nodes Js <<<<<<<<"

npm install &>>${log}
echo ">>>>>>>>>>> Install Mongo Client <<<<<<<<"

yum install mongodb-org-shell -y &>>${log}

echo ">>>>>>>>>>> Load User Schema <<<<<<<<"


mongo --host MONGODB-SERVER-IPADDRESS </app/schema/${component}.js &>>${log}

echo ">>>>>>>>>>> Start User Service <<<<<<<<"
systemctl daemon-reload &>>${log}
systemctl enable ${component} &>>${log}
systemctl restart ${component} &>>${log}
}





func_maven()
{
  echo ">>>>>>>>>>> create ${component} service <<<<<<<<"

cp ${component}.service /etc/systemd/system/${component}.service
echo ">>>>>>>>>>> create ${component} service <<<<<<<<"

yum install maven -y

echo ">>>>>>>>>>> create ${component} service <<<<<<<<"

useradd roboshop
echo ">>>>>>>>>>> create ${component} service <<<<<<<<"

echo ">>>>>>>>>>> delete${component} service <<<<<<<<"
rm -rf  /app

mkdir /app
echo ">>>>>>>>>>> create ${component} service <<<<<<<<"

curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip
echo ">>>>>>>>>>> create ${component} service <<<<<<<<"

cd /app
echo ">>>>>>>>>>> create ${component} service <<<<<<<<"

unzip /tmp/${component}.zip
echo ">>>>>>>>>>> create ${component} service <<<<<<<<"

cd /app
echo ">>>>>>>>>>> create ${component} service <<<<<<<<"

mvn clean package
echo ">>>>>>>>>>> create ${component} service <<<<<<<<"

mv target/${component}-1.0.jar ${component}.jar
echo ">>>>>>>>>>> create ${component} service <<<<<<<<"

yum install mysql -y
echo ">>>>>>>>>>> create ${component} service <<<<<<<<"

mysql -h mysql.devopsb17.online -uroot -pRoboShop@1 < /app/schema/${component}.sql
echo ">>>>>>>>>>> create ${component} service <<<<<<<<"

systemctl enable ${component}
systemctl restart ${component}
}







