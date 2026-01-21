# Terraform Learning Journey - AWS Infrastructure

## 📋 Project Overview
This project demonstrates the deployment of an EC2 instance on AWS using Terraform Infrastructure as Code (IaC). It includes networking, security, and compute resources configuration.

## 🎯 What We've Learned

### 1. **Terraform Basics**

#### Project Structure
Organized Terraform configuration into multiple files for better maintainability:
- `terraform.tf` - Terraform and provider version requirements
- `provider.tf` - AWS provider configuration
- `variables.tf` - Input variables for reusable configuration
- `data.tf` - Data sources for fetching existing AWS resources
- `ec2.tf` - EC2 instance and related resources
- `outputs.tf` - Output values to display after deployment
- `main.tf` - Additional resources (currently commented out)

#### Terraform Configuration Block
```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.28.0"
    }
  }
}
```
**Learned:** How to specify provider requirements and version constraints

### 2. **AWS Provider Configuration**

```hcl
provider "aws" {
  region = var.region
}
```
**Learned:** 
- How to configure AWS provider
- Using variables for dynamic configuration
- Default region: `ap-south-1` (Mumbai)

### 3. **Variables in Terraform**

Created reusable variables for flexible infrastructure:

| Variable | Type | Default Value | Purpose |
|----------|------|---------------|---------|
| `region` | string | ap-south-1 | AWS region |
| `ec2_name` | string | WebServerInstance | EC2 instance name tag |
| `aws_ami_id` | string | ami-019715e0d74f695be | AMI for instance |
| `instance_type` | string | t2.micro | EC2 instance type |
| `instance_root_size` | number | 8 | Root volume size in GB |

**Learned:**
- Variable declaration with type constraints
- Setting default values
- Using variables with `var.variable_name` syntax

### 4. **Data Sources**

```hcl
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
  owners = ["099720109477"] # Canonical
}
```

**Learned:**
- Querying existing AWS resources dynamically
- Using filters to find specific AMIs
- Accessing data source values with `data.resource_type.name.attribute`
- Finding the most recent Ubuntu 24.04 AMI

### 5. **Networking Resources**

#### Default VPC
```hcl
resource "aws_default_vpc" "default" {
  tags = {
    Name = "default-vpc"
  }
}
```
**Learned:** 
- How to reference the default VPC in AWS
- Tagging resources for organization

#### Security Groups
Created comprehensive security group with:

**Ingress Rules (Inbound):**
- Port 443 (HTTPS) - Secure web traffic
- Port 22 (SSH) - Remote server access
- Port 80 (HTTP) - Web traffic

**Egress Rules (Outbound):**
- Port 8000 - Specific application traffic
- All protocols/ports - Complete outbound access

**Learned:**
- Security group creation and configuration
- Ingress vs egress rules
- CIDR notation (`0.0.0.0/0` for all IPs)
- Protocol specifications (tcp, -1 for all)
- Port ranges with `from_port` and `to_port`
- Security best practices with descriptions

### 6. **SSH Key Pair Management**

```hcl
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("terra-ec2-key.pub")
}
```

**Learned:**
- Creating AWS key pairs for SSH access
- Using `file()` function to read local files
- Public/private key infrastructure
- Key files: `terra-ec2-key` (private), `terra-ec2-key.pub` (public)

### 7. **EC2 Instance Creation**

```hcl
resource "aws_instance" "web_server" {
  key_name        = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.my_security_group.name]
  instance_type   = var.instance_type
  ami             = var.aws_ami_id
  
  root_block_device {
    volume_size = var.instance_root_size
    volume_type = "gp3"
  }
  
  tags = {
    Name = var.ec2_name
  }
}
```

**Learned:**
- EC2 instance configuration
- Attaching key pairs for SSH access
- Associating security groups
- Configuring storage volumes (EBS)
- Volume types (gp3 - latest general purpose SSD)
- Resource dependencies and references
- Using tags for resource identification

### 8. **Output Values**

Defined outputs to retrieve important information:

```hcl
output "instance_id"        # EC2 instance ID
output "instance_ip"        # Private IP address
output "instance_public_ip" # Public IP address
```

**Learned:**
- Exposing resource attributes after deployment
- Using outputs for automation and reference
- Accessing nested resource attributes

### 9. **Resource Dependencies**

**Learned implicit dependencies:**
- EC2 instance depends on security group
- EC2 instance depends on key pair
- Security group depends on VPC
- Terraform automatically determines the correct order

### 10. **Infrastructure as Code Best Practices**

**Learned:**
- Organizing code into logical files
- Using variables for reusability
- Adding descriptive comments
- Tagging all resources
- Using meaningful resource names
- Version pinning for providers

## 🚀 Terraform Workflow Commands

```bash
# Initialize Terraform (download providers)
terraform init

# Format code to canonical style
terraform fmt

# Validate configuration
terraform validate

# Preview changes
terraform plan

# Apply changes
terraform apply

# Destroy infrastructure
terraform destroy

# Show current state
terraform show
```

## 📁 Project Files Generated

- `terraform.tfstate` - Current state of infrastructure
- `terraform.tfstate.backup` - Backup of previous state
- `terra-ec2-key` - Private SSH key
- `terra-ec2-key.pub` - Public SSH key

## 🔑 Key Concepts Mastered

1. **Infrastructure as Code (IaC)** - Managing infrastructure through code
2. **Declarative Configuration** - Defining desired state, not steps
3. **State Management** - Tracking infrastructure state
4. **Resource Dependencies** - Understanding resource relationships
5. **Idempotency** - Same config produces same result
6. **Provider Plugins** - Extending Terraform for different platforms
7. **Variable Interpolation** - Dynamic configuration
8. **Resource Attributes** - Accessing properties of created resources

## 🛡️ Security Considerations Learned

- Never commit private keys to version control
- Use security groups to restrict access
- Follow principle of least privilege
- Keep provider versions updated
- Use specific CIDR blocks when possible (not just `0.0.0.0/0`)

## 📚 AWS Services Used

1. **EC2** - Elastic Compute Cloud (virtual servers)
2. **VPC** - Virtual Private Cloud (network isolation)
3. **Security Groups** - Virtual firewalls
4. **Key Pairs** - SSH authentication
5. **EBS** - Elastic Block Store (storage volumes)
6. **AMI** - Amazon Machine Images (server templates)

## 🎓 Next Steps to Explore

- Remote state management (S3 backend)
- Terraform modules for reusability
- Multiple environments (dev, staging, prod)
- Provisioners for post-creation configuration
- Terraform workspaces
- Sensitive variable management
- Load balancers and auto-scaling
- Database resources (RDS)
- CI/CD integration

## 📝 Notes

- Using t2.micro instances (AWS free tier eligible)
- Region: ap-south-1 (Mumbai)
- AMI: Ubuntu 24.04 LTS
- Storage: 8GB gp3 SSD
- Some resources in `main.tf` are commented out for reference

---

**Created:** January 2026  
**Terraform Version:** 6.28.0 (AWS Provider)  
**Purpose:** Learning and demonstration