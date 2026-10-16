# Wedding Template - AWS S3 Static Website Hosting with Terraform, IAM & GitHub Actions

A responsive, modern wedding landing page built with Bootstrap and deployed serverlessly on Amazon Web Services (AWS) using Infrastructure as Code (IaC), cloud security best practices, and automated CI/CD.

---

## Architecture & Tech Stack

- **Frontend**: HTML5, CSS3, JavaScript, Bootstrap.
- **Cloud Infrastructure**: Amazon S3 (Simple Storage Service) configured for Static Website Hosting.
- **Cloud Security**: AWS IAM (Identity and Access Management) configured with a least-privilege custom policy (`WeddingS3SyncPolicy`) and a dedicated deployment user (`ian-s3-deployer`).
- **Infrastructure as Code (IaC)**: Terraform for provisioning and managing cloud resources.
- **CI/CD Automation**: GitHub Actions for automated building and deploying on every push to `main`.
- **Version Control**: Git & GitHub for source code management.

---

## CI/CD Pipeline

This project uses GitHub Actions for continuous deployment. The workflow (`.github/workflows/deploy.yml`) is automatically triggered on every push to the `main` branch. It performs the following steps:
1. **Check out code**: Pulls the latest repository files into the runner environment.
2. **Configure AWS Credentials**: Securely authenticates with AWS using GitHub Repository Secrets (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`) tied to the `ian-s3-deployer` IAM user.
3. **Deploy to S3**: Uses the AWS CLI (`aws s3 sync`) to upload website assets (`index.html`, CSS, JS, images, etc.) to the S3 bucket (`wedding-template-static-hosting-20261016190256`), while strictly excluding sensitive files like Terraform states, Git configurations, and local files.

---

## Project Structure

```text
wedding-template/
├── .github/workflows/  # GitHub Actions CI/CD deployment workflow
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