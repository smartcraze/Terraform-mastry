Terraform Modules Examples

This folder demonstrates two simple reusable Terraform modules:

- `modules/ec2` — creates an EC2 instance with configurable AMI, instance type, key pair, security groups, and tags.
- `modules/s3` — creates an S3 bucket with optional versioning and tags.

How to try the example:

1. Change to the examples folder:

```bash
cd terraform-modules-examples/examples
```

2. Initialize and plan:

```bash
terraform init
terraform plan
```

3. Apply (be careful — this will create real AWS resources):

```bash
terraform apply
```

Notes:
- Edit `variables.tf` in the `examples` folder to change the AWS region.
- Provide a key pair name in `module.ec2_demo` if you want SSH access.
- The modules are intentionally small to demonstrate inputs/outputs and reusability.
