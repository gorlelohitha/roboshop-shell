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







