terraform {
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "3.1.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "3.56.0"
    }

    openpgp = {
      source = "greatliontech/openpgp"
      version = "0.0.3"
    }
  }
  backend "s3" {
    bucket = "pgr301-2021-terraform-state"
    key    = "glennbech/06-cd-docker-apprunner.tfstate"
    region = "eu-north-1"
  }
}

provider "openpgp" {
  version = "0.0.3"
}



