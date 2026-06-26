# Region
provider aws{
    region= "ap-south-1"
}

# key-value pair
resource aws_key_pair ec2{
    key_name= "demo-iac-key"
    public_key= "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHZlsp3QDrf55uMJLRIxmGh3Vo0Avyl72NNIRiYAMIkY priyanshu_vishwakarma@Priyanshu-vishw"
}

# Default vpc
resource aws_default_vpc default{

}

# Security group
resource aws_security_group security_group{
    name= "my_security_group"
    vpc_id= aws_default_vpc.default.id   # This is called interpolation
}

# Inbound and outbound rules of security_group
resource aws_vpc_security_group_ingress_rule allow_http {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = aws_default_vpc.default.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource  aws_vpc_security_group_egress_rule allow_all_traffic {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# EC2 instance
resource aws_instance my_instance{
    tags={
    Name= "iac-terraform-server"
    }
    ami= "ami-05d2d839d4f73aafb"
    instance_type= "t3.micro"
    key_name= aws_key_pair.ec2.key_name

   # vpc_id= aws_default_vpc.default.id
    vpc_security_group_ids=  [aws_security_group.security_group.id]

    # EBS storage
    root_block_device{
        volume_size= 10
        volume_type= "gp3"
    }

}
