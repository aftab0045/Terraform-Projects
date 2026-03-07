#  Terraform Projects

![Terraform](https://img.shields.io/badge/Terraform-IaC-purple?style=for-the-badge&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?style=for-the-badge&logo=amazonaws)
![GitHub](https://img.shields.io/badge/GitHub-Version%20Control-black?style=for-the-badge&logo=github)
![DevOps](https://img.shields.io/badge/DevOps-Automation-blue?style=for-the-badge)

This repository contains my **Terraform Infrastructure as Code (IaC) projects** where I practice provisioning and managing cloud infrastructure using **HashiCorp Terraform**.

The goal of this repository is to strengthen my **DevOps and Cloud skills** by building real-world infrastructure using **Terraform and AWS**.

---

##  About This Repository

This repository contains multiple **Terraform projects and hands-on labs** focused on:

- Provisioning AWS infrastructure using Terraform
- Automating cloud resource creation
- Practicing Infrastructure as Code (IaC)
- Learning Terraform workflow and best practices
- Building real-world DevOps scenarios

Each project is organized in its own folder.

---

##  Technologies & Tools

| Tool | Purpose |
|-----|--------|
| Terraform | Infrastructure as Code |
| AWS | Cloud Platform |
| Git | Version Control |
| GitHub | Code Repository |

---
# Terraform Projects

This repository contains multiple **Terraform practice projects** for learning **Infrastructure as Code (IaC)** and **AWS resource provisioning**.

---

##  Project Structure

```
Terraform-Projects
│
├── project-1
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── project-2
│   ├── main.tf
│   └── modules/
│
├── project-3
│   └── main.tf
│
├── .gitignore
└── README.md
```

Each folder represents a **separate Terraform project**.

---

#  Terraform Workflow

## 1️. Initialize Terraform

```bash
terraform init
```

Downloads required providers and initializes the Terraform working directory.

---

## 2️. Validate Terraform Configuration

```bash
terraform validate
```

Checks whether the Terraform configuration files are valid.

---

## 3️. Preview Infrastructure Changes

```bash
terraform plan
```

Shows the resources Terraform will create, modify, or destroy.

---

## 4️. Apply Infrastructure

```bash
terraform apply
```

Creates the infrastructure defined in the Terraform configuration files.

---

## 5️. Destroy Infrastructure (Optional)

```bash
terraform destroy
```

Removes all resources created by Terraform.

---

#  Files Ignored in Git

Some Terraform-generated files are excluded using `.gitignore`:

```
.terraform/
terraform.tfstate
terraform.tfstate.backup
*.tfvars
```

These files may contain **local state or sensitive data**, so they should not be stored in GitHub repositories.

---

