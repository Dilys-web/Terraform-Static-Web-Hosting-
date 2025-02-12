# AWS S3 Static Website Hosting using Terraform

## Table of Contents
1. [Project Overview](#project-overview)
2. [Prerequisites](#prerequisites)
3. [Setup Instructions](#setup-instructions)
4. [Deploying the Infrastructure](#deploying-the-infrastructure)
5. [Testing the Website](#testing-the-website)
6. [Cleanup](#cleanup)
7. [Contributing](#contributing)
8. [References](#references)

---

## Project Overview

This project demonstrates how to use Terraform to provision an AWS S3 bucket configured for static website hosting. It automates the creation and configuration of the bucket, applies a bucket policy for public access, deploys sample website content, and verifies that the website is accessible via the S3 website endpoint.

### Objectives:
- Learn how to set up infrastructure as code with Terraform.
- Provision an AWS S3 bucket for hosting a static website.
- Configure bucket policies to allow public read access.
- Deploy sample HTML content and test the static website.
- Document the process for future reference.

---

## Prerequisites

Before you begin, ensure you have the following:

1. **AWS Account**: An active AWS account with permissions to create S3 buckets.
2. **Terraform**: Installed on your local machine. Installation guide: [Terraform Installation](https://developer.hashicorp.com/terraform/downloads).
3. **AWS CLI (Optional but Recommended)**: For verifying configurations and manual file uploads. Installation guide: [AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).
4. **Text Editor/IDE**: For editing Terraform files (e.g., VS Code, Sublime Text).
5. **Basic Knowledge**: Familiarity with command-line interfaces and basic AWS services (especially S3).

---

## Setup Instructions

### 1. Install Required Tools
- Install Terraform and verify it with:
  ```bash
  terraform --version
  ```
- Install AWS CLI and verify it with:
  ```bash
  aws --version
  ```
- Configure AWS credentials:
  ```bash
  aws configure
  ```
  Enter your `AWS Access Key ID`, `Secret Access Key`, default region (e.g., `us-east-1`), and output format (`json`).

### 2. Create Project Directory
Create a folder for your project and organize it as follows:
```
aws-s3-static-website/
├── main.tf
├── variables.tf
├── outputs.tf
├── index.html
├── error.html
└── README.md
```

---

## Deploying the Infrastructure

### 1. Initialize Terraform
Navigate to your project directory and run:
```bash
terraform init
```

### 2. Validate Configuration
Check for syntax errors:
```bash
terraform validate
```

### 3. Plan and Apply
Preview the changes before applying:
```bash
terraform plan
```
Apply the configuration:
```bash
terraform apply
```
Confirm by typing `yes` when prompted.

### 4. Upload Website Files
After the bucket is created, upload your `index.html` and `error.html` files:
```bash
aws s3 cp index.html s3://<your-bucket-name>/ --acl public-read
aws s3 cp error.html s3://<your-bucket-name>/ --acl public-read
```
Alternatively, if you've included the `null_resource` in your Terraform configuration, this step will be automated.

---

## Testing the Website

### 1. Access the Website
Open the website endpoint in your browser:
```plaintext
http://<your-bucket-name>.s3-website-<region>.amazonaws.com
```
You can find the exact URL in the Terraform output:
```bash
terraform output website_endpoint
```

### 2. Verify Content
Ensure the `index.html` and `error.html` pages load correctly.

---

## Cleanup

To delete all resources created by Terraform, run:
```bash
terraform destroy
```
Confirm by typing `yes`.

---

## Contributing

If you'd like to contribute to this project, follow these steps:
1. Fork the repository.
2. Create a new branch: `git checkout -b feature/new-feature`.
3. Make your changes and commit them: `git commit -m "Add new feature"`.
4. Push to the branch: `git push origin feature/new-feature`.
5. Submit a pull request.

---

## References

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS S3 Static Website Hosting Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html)
- [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/reference/)
- [Terraform Installation Guide](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

---

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute it as needed.
```

---
