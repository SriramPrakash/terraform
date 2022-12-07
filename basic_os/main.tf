terraform {
  required_providers {
    sheeruaws = {
      source  = "hashicorp/aws"
      version = "~> 4.40.0"
    }
  }
}

# authentication
provider "sheeruaws" {
  region     = "ap-south-1"
  access_key = "*************"
  secret_key = "*************"
}

resource "aws_instance" "os1" {
  ami           = "ami-074dc0a6f6c764218"
  instance_type = "t2.micro"
  tags = {
    Name = "SheeruTestOS"
  }
}
