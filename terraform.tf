terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  provider_meta "aws" {
    region  = ""
    profile = ""
  }
  cloud {

    organization = ""

    workspaces {
      name = ""
    }
  }
}
