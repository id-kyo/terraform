terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
  #backend é usado para configurar onde o estado remoto do terraform será armazenado
  backend "s3" {
    bucket = "bucketglobal-csv-nascimento"
    key    = "aws-vm/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "caio"
      managed-by = "terraform"
    }
  }
}

#configurando o terraform para usar o estado remoto do armazenamento S3
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "bucketglobal-csv-nascimento"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}