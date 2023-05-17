terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-3"

}
# upload "terraform.tfstate" file to S3 
terraform {
    backend "s3" {
    bucket = "dina-bucket-tf-1"
    key    = "terraform.tfstate"
    region = "eu-west-3"
  }
}

