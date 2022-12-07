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
  access_key = "*******"
  secret_key = "***********"
}

resource "aws_instance" "os1" {
  ami                    = "ami-074dc0a6f6c764218"
  instance_type          = "t2.micro"
  key_name               = "tf-sp-key-pair"
  vpc_security_group_ids = ["sg-004061952dbaf4f10"]
  tags = {
    Name = "SheeruTestOSForWeb"
  }

}

resource "null_resource" "execute-it" {
  connection {
    type = "ssh"
    user = "ec2-user"
    # password    = var.root_password
    private_key = file("/Users/sriram/Downloads/tf-sp-key-pair.pem")
    host        = aws_instance.os1.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo bash",
      "yum install httpd -y",
      "touch /var/www/html/index.html",
      "systemctl enable httpd --now"
    ]
  }
}

