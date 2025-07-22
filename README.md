# Terraform S3 Static Website

This project contains Terraform code to deploy a static website to an AWS S3 bucket.

## Description

The Terraform configuration in this project will create an S3 bucket, configure it for static website hosting, and upload the HTML files from the `src` directory. It also sets up a public-read policy to make the website accessible to everyone.

## Prerequisites

Before you begin, ensure you have the following installed and configured:

*   [Terraform](https://www.terraform.io/downloads.html)
*   [AWS CLI](https://aws.amazon.com/cli/)
*   An AWS account with the necessary permissions to create S3 buckets and related resources.
*   AWS credentials configured for your environment.

## Configuration

The following variables can be configured in the `vairables.tf` file:

| Variable      | Description                                       | Type          | Default                |
|---------------|---------------------------------------------------|---------------|------------------------|
| `html_pages`  | A list of HTML files to upload to the S3 bucket.  | `list(string)`| `["src/index.html", "src/error.html"]` |
| `aws_region`  | The AWS region where the resources will be created. | `string`      | `"us-east-1"`          |
| `aws_profile` | The AWS profile to use for authentication.        | `string`      | `"default"`            |

## Usage

1.  **Initialize Terraform:**
    ```bash
    terraform init
    ```

2.  **Plan the deployment:**
    ```bash
    terraform plan
    ```

3.  **Apply the configuration:**
    ```bash
    terraform apply
    ```

    Enter `yes` when prompted to confirm the deployment.

## Outputs

After the deployment is complete, Terraform will output the following:

| Name          | Description                             |
|---------------|-----------------------------------------|
| `website_url` | The URL of the deployed S3 bucket website. |

You can access the website by opening the `website_url` in your web browser.

## Contributing

Contributions are welcome! Please feel free to submit a pull request with any improvements or new features.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
