# Static Website Hosting on AWS S3 with Terraform

This repository contains Terraform code to provision and configure an AWS S3 bucket for hosting a static website.

---

## Features

- Creates an S3 bucket in `us-east-1` region.
- Configures S3 bucket ownership controls.
- Sets public access block settings to allow public reads.
- Uploads `index.html` to the bucket.
- Enables website hosting configuration on the bucket.
- Sets a bucket policy for public read access.

---

## Usage

1. **Install Terraform**

   Make sure you have [Terraform](https://www.terraform.io/downloads.html) installed.

2. **Configure AWS credentials**

   Terraform uses your AWS CLI credentials or environment variables. Make sure your user has necessary permissions.

3. **Initialize Terraform**

   ```bash
   terraform init
   ```
   
4. **Plan Your Changes**
 ```bash
 terraform plan
```

 5. **Apply the Terraform configuration**
  ```bash
terraform apply
```

7. Once applied, your website will be available at:
http://<your-bucket-name>.s3-website-us-east-1.amazonaws.com

