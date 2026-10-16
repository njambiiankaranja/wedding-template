# Wedding Template - AWS S3 Static Website Hosting with Terraform & IAM

A responsive, modern wedding landing page built with Bootstrap and deployed serverlessly on Amazon Web Services (AWS) using Infrastructure as Code (IaC) and cloud security best practices.

---

## Architecture & Tech Stack

- **Frontend**: HTML5, CSS3, JavaScript, Bootstrap.
- **Cloud Infrastructure**: Amazon S3 (Simple Storage Service) configured for Static Website Hosting.
- **Cloud Security**: AWS IAM (Identity and Access Management) configured with least-privilege policies.
- **Infrastructure as Code (IaC)**: Terraform for provisioning and managing cloud resources.
- **Version Control**: Git & GitHub for source code management.

---

## Project Structure

```text
wedding-template/
├── css/                # Stylesheets and custom styles
├── js/                 # JavaScript files
├── img/                # Gallery and event imagery
├── lib/                # Vendor libraries and plugins
├── scss/               # SASS source files
├── index.html          # Main wedding landing page
├── s3.tf               # Terraform configuration for S3 bucket & website hosting
├── iam.tf              # Terraform configuration for IAM user and least-privilege policy
├── .gitignore          # Keeps Terraform state and local files out of Git
└── README.md           # Project documentation