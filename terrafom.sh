wget https://releases.hashicorp.com/terraform/1.9.2/terraform_1.9.2_linux_amd64.zip

echo $PATH

sudo unzip terraform_1.9.2_linux_amd64.zip -d /usr/local/bin

ls -l /usr/local/bin

terraform -version