# Let's Terraform IaC

A hands-on learning repository for **Infrastructure as Code (IaC)** using **Terraform** and **AWS**. This project demonstrates how to provision and manage cloud infrastructure through code, covering the fundamentals of HCL syntax, resource management, and Terraform workflows.

## About This Repository

This repository contains Terraform configurations for deploying AWS resources including EC2 instances, S3 buckets, security groups, and networking components. It's designed to help learn IaC principles and Terraform best practices through practical examples.

**Repository Created**: March 29, 2026  
**Primary Language**: HCL (HashiCorp Configuration Language)  
**Cloud Provider**: AWS

### What's Inside

- `EC2.tf` - EC2 instance provisioning with security groups and SSH keys
- `s3.tf` - S3 bucket configuration
- `variables.tf` - Reusable input variables
- `remote-backend/` - Remote state management setup
- Supporting documentation and learning notes

## About Terraform

**Terraform** is an open-source Infrastructure as Code (IaC) tool by HashiCorp that allows you to define, provision, and manage cloud infrastructure using declarative configuration files.

### Key Concepts

- **HCL (HashiCorp Configuration Language)**: Human-readable configuration syntax
- **Providers**: Plugins that interact with cloud platforms (AWS, Azure, GCP, etc.)
- **Resources**: Infrastructure components you want to create (EC2, S3, VPC, etc.)
- **State**: Terraform tracks your infrastructure state to manage changes
- **Plan & Apply**: Preview changes before executing infrastructure modifications

### Why Use Terraform?

✅ **Infrastructure as Code** - Manage infrastructure like application code  
✅ **Multi-Cloud Support** - Works with AWS, Azure, GCP, and 1000+ providers  
✅ **Version Control** - Track infrastructure changes in Git  
✅ **Reusability** - Create modules for repeatable deployments  
✅ **Consistency** - Ensures identical deployments across environments  

### Basic Workflow

```bash
terraform init      # Initialize Terraform working directory
terraform plan      # Preview infrastructure changes
terraform apply     # Execute infrastructure changes
terraform destroy   # Remove infrastructure
```

For more information, visit [terraform.io](https://www.terraform.io/)
