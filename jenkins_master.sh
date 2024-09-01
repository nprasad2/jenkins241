#! /bin/bash 

echo " Installing the jenkins on master sever" 

# checking the the login is in su mode or not 
USERID=$(id -u)

if [ $USERID -eq 0 ]
then 
    echo "you are in su mode ,Please rn the script"
else 
    echo " you need to run the script in su mode"
    exit 1
fi

validate(){

    if [ $1 -eq 0 ]
    then 
        echo "$2 executed successfully"
    else
        echo "$2 execution failed please check"
    fi
}


sudo wget -O /etc/yum.repos.d/jenkins.repo  https://pkg.jenkins.io/redhat-stable/jenkins.repo --secure-protocol tlsv1
validate $? "creating jenkins.repo"

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
validate $? "importing the jenkins key"

sudo yum upgrade -y 
validate $? " installing the deppendencies"
# Add required dependencies for the jenkins package

sudo yum install fontconfig java-17-openjdk
validate $? " installing the java dependencies"

sudo yum install jenkins
validate $? " installing the jenkins "

sudo systemctl daemon-reload
validate $? " enabling the daemon reload "

sudo systemctl enable jenkins
validate $? "enabling the jenkins service "

sudo systemctl start jenkins
validate $? "starting jenkins service"

sudo systemctl status jenkins
validate $? "checking the jenkins service status"