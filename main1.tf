provider "aws" {
    alias = "east"
        region     = "us-east-1"
    access_key = "AKIAZICJYN3QW4OPSAGF"
    secret_key = "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"
  }     
resource "aws_instance" "v2"   {
    ami                    = "ami-06371c9f2ad704460"
    instance_type          = "t2.micro"
    key_name               = "SecretKey"
    monitoring             = true
    vpc_security_group_ids = ["sg-02052e37f000ecf6e"]
    subnet_id              = "subnet-0579b73f2a4cf842e"
  
    tags = {
      Name = "v2"
    }
  }
  