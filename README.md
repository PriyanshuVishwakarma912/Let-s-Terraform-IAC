# Let's Terraform IaC 🚀

<div align="center">

![Terraform](https://img.shields.io/badge/Terraform-%235835CC?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900?style=for-the-badge&logo=amazon-aws&logoColor=white)
![HCL](https://img.shields.io/badge/HCL-%23844FBA?style=for-the-badge)

**A comprehensive repository for Infrastructure as Code (IaC) using Terraform**

*Documenting the journey from HCL basics to advanced multi-cloud deployments and CI/CD integration*

---

</div>

## 📋 Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Configuration Files](#configuration-files)
- [Key Components](#key-components)
- [Usage Examples](#usage-examples)
- [Learning Objectives](#learning-objectives)
- [Best Practices](#best-practices)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [Resources](#resources)

---

## 📖 Overview

This repository demonstrates **Infrastructure as Code (IaC)** principles using **Terraform** and **AWS**. It covers the fundamental concepts of provisioning and managing cloud infrastructure through code, starting from basic HCL syntax to more complex multi-resource deployments.

### Key Features

✅ **AWS EC2 Instance Management** - Deploy and configure EC2 instances  
✅ **S3 Bucket Configuration** - Create and manage S3 storage buckets  
✅ **Security Groups & Networking** - Configure VPC security groups and ingress/egress rules  
✅ **Variable Management** - Parameterized configurations for reusability  
✅ **SSH Key Management** - EC2 key pair provisioning  
✅ **Remote Backend Support** - State file management (foundation for team collaboration)  

---

## 🏗️ Architecture

### Infrastructure Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                         AWS Account                             │
│                     (ap-south-1 Region)                         │
│                                                                 │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │                    Default VPC                           │  │
│  │         (CIDR: varies by AWS account)                    │  │
│  │                                                          │  │
│  │  ┌────────────────────────────────────────────────────┐ │  │
│  │  │          Security Group                            │ │  │
│  │  │    (my_security_group)                             │ │  │
│  │  │                                                    │ │  │
│  │  │  Ingress Rules:                                   │ │  │
│  │  │  ├─ Port 80 (HTTP) from VPC CIDR               │ │  │
│  │  │                                                    │ │  │
│  │  │  Egress Rules:                                    │ │  │
│  │  │  ├─ All Traffic to 0.0.0.0/0                    │ │  │
│  │  │                                                    │ │  │
│  │  │  ┌──────────────────────────────────────────┐    │ │  │
│  │  │  │    EC2 Instance                          │    │ │  │
│  │  │  │  (iac-terraform-server)                  │    │ │  │
│  │  │  │                                          │    │ │  │
│  │  │  │  Instance Type: t3.micro                │    │ │  │
│  │  │  │  AMI: ami-05d2d839d4f73aafb            │    │ │  │
│  │  │  │  Storage: 10GB (gp3)                   │    │ │  │
│  │  │  │  SSH Key: demo-iac-key                 │    │ │  │
│  │  │  └──────────────────────────────────────────┘    │ │  │
│  │  └────────────────────────────────────────────────────┘ │  │
│  └──────────────────────────────────────────────────────────┘  │
│                                                                 │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │        S3 Bucket                                         │  │
│  │    (sallu-bhai-s3-bucket)                               │  │
│  │    Region: us-west-2                                    │  │
│  └──────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
```

### Deployment Flow

```
┌──────────────────┐
│  Terraform Code  │
│  (HCL Files)     │
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│   terraform      │
│    init          │
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│   terraform      │
│    plan          │ ◄─── Review Changes
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│   terraform      │
│    apply         │
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│  AWS Resources   │
│  Provisioned     │
└──────────────────┘
```

---

## 📁 Project Structure

```
Let-s-Terraform-IAC/
├── README.md                 # Project documentation (this file)
├── EC2.tf                    # EC2 instance and networking configuration
├── s3.tf                     # S3 bucket configuration
├── variables.tf              # Variable definitions
├── Terraform-notes.md        # Learning notes and references
├── syntax.txt                # Quick HCL syntax reference
└── remote-backend/           # Remote backend configuration (team collaboration)
    └── [backend configs]
```

---

## 📦 Prerequisites

Before you begin, ensure you have the following installed:

### Required Software
- **Terraform** v1.0 or higher
  - [Download Terraform](https://www.terraform.io/downloads.html)
- **AWS CLI** v2.x
  - [Install AWS CLI](https://aws.amazon.com/cli/)
- **SSH Client** (for key management)
  - Included on macOS/Linux, or Git Bash on Windows

### AWS Credentials
Configure AWS credentials using one of these methods:

```bash
# Method 1: AWS CLI Configuration (Recommended)
aws configure

# Method 2: Environment Variables
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_DEFAULT_REGION="ap-south-1"

# Method 3: AWS Credentials File (~/.aws/credentials)
[default]
aws_access_key_id = your-access-key
aws_secret_access_key = your-secret-key
```

### Prerequisites Verification

```bash
# Check Terraform version
terraform --version

# Check AWS CLI configuration
aws sts get-caller-identity

# Verify SSH key exists
ssh-keygen -l -f ~/.ssh/id_ed25519
```

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/PriyanshuVishwakarma912/Let-s-Terraform-IAC.git
cd Let-s-Terraform-IAC
```

### 2. Initialize Terraform

```bash
terraform init
```

This command:
- Creates a `.terraform` directory
- Downloads required provider plugins (AWS)
- Initializes the backend (local by default)

### 3. Validate Configuration

```bash
terraform validate
```

Ensures all HCL files are syntactically correct.

### 4. Format Code (Optional)

```bash
terraform fmt -recursive
```

Auto-formats all HCL files to follow Terraform conventions.

### 5. Plan Deployment

```bash
terraform plan -out=tfplan
```

Shows what resources will be created/modified without applying changes.

### 6. Apply Configuration

```bash
terraform apply tfplan
```

Provisions AWS resources as defined in the Terraform files.

### 7. View Outputs

```bash
terraform output
```

Displays created resource information (IPs, IDs, etc.).

### 8. Destroy Resources (When Done)

```bash
terraform destroy
```

⚠️ **WARNING**: This will delete all AWS resources created by Terraform.

---

## ⚙️ Configuration Files

### `EC2.tf`
Provisions an EC2 instance with networking infrastructure.

**Components:**
- **AWS Provider**: Configures AWS region (ap-south-1)
- **SSH Key Pair**: Creates ED25519 key for EC2 access
- **Default VPC**: References the default AWS VPC
- **Security Group**: Controls inbound/outbound traffic
- **Security Group Rules**:
  - **Ingress**: Allows HTTP (port 80) from VPC CIDR
  - **Egress**: Allows all outbound traffic (0.0.0.0/0)
- **EC2 Instance**:
  - Instance Type: t3.micro
  - AMI: Ubuntu 22.04 LTS (ap-south-1)
  - Storage: 10GB gp3 volume
  - Tags for identification

```hcl
# Key Configuration Examples:

# Create SSH key pair
resource "aws_key_pair" "ec2" {
  key_name   = "demo-iac-key"
  public_key = "ssh-ed25519 AAAA..." # Your public key here
}

# Create security group
resource "aws_security_group" "security_group" {
  name   = "my_security_group"
  vpc_id = aws_default_vpc.default.id  # Interpolation example
}
```

### `s3.tf`
Creates an S3 bucket for object storage.

**Components:**
- **AWS Provider**: Configured for us-west-2 region
- **S3 Bucket**: Simple object storage bucket

```hcl
# S3 Bucket Configuration
resource "aws_s3_bucket" "my_bucket" {
  bucket = "sallu-bhai-s3-bucket"  # Globally unique bucket name
}
```

⚠️ **Note**: S3 bucket names must be globally unique. Modify the `bucket` parameter.

### `variables.tf`
Defines reusable input variables for your infrastructure.

```hcl
variable "ec2_instance_name" {
  description = "EC2 instance name"
  default     = "terra-iac-server"
  type        = string
}

variable "ec2_volume_size" {
  description = "Root volume size in GB"
  default     = 1
  type        = number
}

variable "ec2_instance_state" {
  description = "Desired instance state"
  default     = "running"
  type        = string
}
```

**Usage in Terraform files:**
```hcl
instance_type = var.ec2_instance_name
```

---

## 🔧 Key Components

### 1. Terraform Blocks

```hcl
# Provider Block - Authenticates with AWS
provider "aws" {
  region = "ap-south-1"
}

# Resource Block - Declares infrastructure
resource "aws_instance" "my_instance" {
  ami           = "ami-05d2d839d4f73aafb"
  instance_type = "t3.micro"
}

# Variable Block - Input parameters
variable "instance_type" {
  type = string
  default = "t3.micro"
}

# Output Block - Return values
output "instance_id" {
  value = aws_instance.my_instance.id
}
```

### 2. Terraform State

Terraform maintains a `terraform.tfstate` file tracking:
- Resource IDs
- Configuration
- Metadata

**Important**: Never commit `terraform.tfstate` to version control (add to `.gitignore`).

### 3. Resource Interpolation

Reference other resources using:
```hcl
aws_default_vpc.default.id              # Access resource attribute
aws_security_group.security_group.id    # Used in security group rules
aws_key_pair.ec2.key_name               # Reference key pair name
```

---

## 💡 Usage Examples

### Example 1: Deploy EC2 Instance Only

```bash
# Create a separate directory
mkdir deploy-ec2
cd deploy-ec2

# Copy only EC2 configuration
cp ../EC2.tf .
cp ../variables.tf .

# Deploy
terraform init
terraform plan
terraform apply
```

### Example 2: Connect to EC2 Instance

```bash
# Get instance public IP
INSTANCE_IP=$(terraform output -raw instance_public_ip)

# SSH into instance (requires private key)
ssh -i ~/.ssh/demo-iac-key ubuntu@$INSTANCE_IP
```

### Example 3: Use Custom Variable Values

```bash
# Override default values
terraform apply -var="ec2_volume_size=20" -var="ec2_instance_name=custom-server"

# Or use a tfvars file
cat > terraform.tfvars <<EOF
ec2_instance_name  = "production-server"
ec2_volume_size    = 50
EC2_instance_state = "running"
EOF

terraform apply
```

### Example 4: Modify S3 Bucket Name

Edit `s3.tf`:
```hcl
resource "aws_s3_bucket" "my_bucket" {
  bucket = "your-unique-bucket-name-123"  # Must be globally unique
}
```

Then apply:
```bash
terraform apply
```

---

## 🎓 Learning Objectives

This repository helps you master:

✅ **HCL Fundamentals**
- Resource blocks
- Provider configuration
- Variable definitions
- Interpolation and references

✅ **Terraform Workflow**
- `terraform init` - Initialize working directory
- `terraform plan` - Preview infrastructure changes
- `terraform apply` - Execute infrastructure changes
- `terraform destroy` - Remove infrastructure

✅ **AWS Resource Management**
- EC2 instance provisioning
- Security groups and network rules
- S3 bucket creation
- VPC and subnet concepts
- SSH key pair management

✅ **IaC Best Practices**
- Code organization
- Variable parameterization
- State management
- Documentation

✅ **Multi-Cloud Concepts** (Foundation)
- Provider abstraction
- Reusable modules
- Environment separation

---

## 🌟 Best Practices

### 1. **Version Control**

```bash
# .gitignore - Never commit state files
.terraform/
terraform.tfstate
terraform.tfstate.*
.terraform.lock.hcl
crash.log
override.tf
override.tf.json
*_override.tf
*_override.tf.json
*.tfvars
*.tfvars.json
```

### 2. **Naming Conventions**

```hcl
# Use descriptive names
resource "aws_security_group" "web_server_sg" { }

# Avoid generic names
resource "aws_security_group" "sg" { }  # ❌ Bad
```

### 3. **Use Variables for Configuration**

```hcl
# ✅ Good - Reusable
variable "instance_type" {
  default = "t3.micro"
}
resource "aws_instance" "server" {
  instance_type = var.instance_type
}

# ❌ Bad - Hardcoded
resource "aws_instance" "server" {
  instance_type = "t3.micro"
}
```

### 4. **Add Descriptions**

```hcl
variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}
```

### 5. **Use Output Blocks**

```hcl
output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.my_instance.id
}

output "instance_public_ip" {
  description = "EC2 instance public IP"
  value       = aws_instance.my_instance.public_ip
}
```

### 6. **Enable Remote State** (For Teams)

Configure remote backend in `backend.tf`:
```hcl
terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
```

### 7. **Use Terraform Lock Files**

`.terraform.lock.hcl` ensures consistent provider versions across team members.

---

## 🔍 Troubleshooting

### Issue: "Error: Invalid provider version constraint"

**Solution**: Run `terraform init -upgrade`

### Issue: "Error: creating aws_instance: UnauthorizedOperation"

**Solution**: Verify AWS credentials are configured correctly:
```bash
aws sts get-caller-identity
```

### Issue: "Error: S3 bucket name already exists"

**Solution**: S3 bucket names are globally unique. Change the bucket name in `s3.tf`:
```hcl
bucket = "your-unique-name-${formatdate("YYYY-MM-DD-hhmm", timestamp())}"
```

### Issue: "terraform plan" shows no changes but `apply` fails

**Solution**: Run `terraform refresh` to sync state with AWS:
```bash
terraform refresh
terraform plan
```

### Issue: "No valid credential sources found"

**Solution**: Configure AWS credentials:
```bash
aws configure
# Or set environment variables
export AWS_ACCESS_KEY_ID="xxx"
export AWS_SECRET_ACCESS_KEY="xxx"
```

### Issue: "Error: acquiring the state lock"

**Solution**: Check if another operation is in progress. Wait or manually remove lock:
```bash
rm .terraform.tfstate.lock.info
```

---

## 📚 Additional Resources

### Documentation
- [Terraform Official Documentation](https://www.terraform.io/docs)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [HCL Syntax Reference](https://www.terraform.io/language)
- [Terraform Best Practices](https://www.terraform.io/cloud-docs/recommended-practices)

### Learning Materials
- [Terraform Learning Path](https://learn.hashicorp.com/terraform)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)
- [Infrastructure as Code Best Practices](https://www.terraform.io/docs/cloud/run/index.html)

### Tools & Extensions
- **Terraform CLI**: [Installation Guide](https://www.terraform.io/downloads)
- **VS Code Extension**: Terraform by HashiCorp
- **Pre-commit Hooks**: [terraform-pre-commit](https://github.com/antonbabenko/pre-commit-terraform)

### Community
- [HashiCorp Discuss](https://discuss.hashicorp.com/)
- [Terraform GitHub Issues](https://github.com/hashicorp/terraform)
- [AWS Community](https://repost.aws/)

---

## 🤝 Contributing

Contributions are welcome! To contribute:

1. **Fork** the repository
2. **Create** a feature branch: `git checkout -b feature/your-feature`
3. **Commit** changes: `git commit -am 'Add new feature'`
4. **Push** to branch: `git push origin feature/your-feature`
5. **Submit** a Pull Request

### Contribution Ideas
- Add Terraform modules for reusability
- Create multi-environment configurations
- Add CI/CD pipeline examples
- Improve documentation
- Add RDS, Lambda, or other AWS services
- Create cost optimization examples

---

## 📋 Quick Reference

### Common Terraform Commands

```bash
# Initialize working directory
terraform init

# Format code
terraform fmt -recursive

# Validate syntax
terraform validate

# Preview changes
terraform plan

# Preview and save to file
terraform plan -out=tfplan

# Apply changes
terraform apply tfplan

# Refresh state
terraform refresh

# Destroy resources
terraform destroy

# Show outputs
terraform output

# Show specific state
terraform show

# Show state resources
terraform state list
```

### Useful AWS CLI Commands

```bash
# List EC2 instances
aws ec2 describe-instances --region ap-south-1

# List S3 buckets
aws s3 ls

# Get security groups
aws ec2 describe-security-groups

# Get key pairs
aws ec2 describe-key-pairs
```

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## 👤 Author

**Priyanshu Vishwakarma**
- GitHub: [@PriyanshuVishwakarma912](https://github.com/PriyanshuVishwakarma912)
- Repository: [Let-s-Terraform-IAC](https://github.com/PriyanshuVishwakarma912/Let-s-Terraform-IAC)

---

## ⭐ Support

If you found this repository helpful, please consider:
- ⭐ Giving it a star
- 🍴 Forking it for your own use
- 💬 Providing feedback and suggestions
- 🤝 Contributing improvements

---

<div align="center">

**Made with ❤️ for the Infrastructure as Code Community**

*Happy Terraforming! 🚀*

</div>
