# Wedding Template - AWS S3 Static Website Hosting with Terraform

A responsive, modern wedding landing page built with Bootstrap and deployed serverlessly on Amazon Web Services (AWS) utilizing Infrastructure as Code (IaC) principles.

---

## Architecture & Tech Stack

* **Frontend**: HTML5, CSS3, JavaScript, Bootstrap.
* **Cloud Infrastructure**: Amazon S3 (Simple Storage Service) configured for Static Website Hosting.
* **Infrastructure as Code (IaC)**: Terraform for provisioning and managing AWS resources.
* **Version Control**: Git & GitHub for source code management.

---

## Project Structure

```text
wedding-template/
├── css/                  # Stylesheets and custom styles
├── js/                   # JavaScript files
├── img/                  # Gallery and event imagery
├── lib/                  # Vendor libraries and plugins
├── scss/                 # SASS source files
├── index.html            # Main wedding landing page
├── s3.tf                 # Terraform configuration for S3 bucket & website hosting
└── README.md             # Project documentation