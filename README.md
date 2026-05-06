## installation Linux

```
 wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

```

### installtion aws


```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

```



## initialise projects

## terraform command reference

### project setup

```
terraform init
terraform init -upgrade
terraform init -reconfigure
```

### formatting and validation

```
terraform fmt
terraform fmt -recursive
terraform validate
```

### planning and apply

```
terraform plan
terraform plan -out=plan.tfplan
terraform apply
terraform apply plan.tfplan
```


## autoaprove

terraform apply -auto-approve

### destroy

```
terraform destroy
```

### inspect state and outputs

```
terraform show
terraform output
terraform output -json
terraform state list
terraform state show <ADDRESS>
```

### providers and versions

```
terraform providers
terraform version
```

### workspaces

```
terraform workspace list
terraform workspace new <NAME>
terraform workspace select <NAME>
```

### state operations

```
terraform state mv <SOURCE> <DESTINATION>
terraform state rm <ADDRESS>
terraform import <ADDRESS> <ID>
```



