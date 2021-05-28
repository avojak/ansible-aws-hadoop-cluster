#########################################
#  Provider details
#########################################

provider "aws" {
    region = "us-east-1"
}

#########################################
#  EC2 Guest resources
#########################################

# Reference the default VPC
resource "aws_default_vpc" "default" {
    tags = {
        Name = "Default VPC"
    }
}

# Define the security group
resource "aws_security_group" "my-security-group" {
    name = "allow-ssh-security-group"
    vpc_id = aws_default_vpc.default.id
    ingress {
        description      = "TLS from VPC"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
}

# The EC2 instance which will serve as the namenode
resource "aws_instance" "nnode" {
    ami = "ami-0d5eff06f840b45e9"
    instance_type = "m5.xlarge"
    key_name = "ec2-keypair"
    security_groups = [ "allow-ssh-security-group" ]
    root_block_device {
        delete_on_termination = true
        encrypted             = false
        iops                  = 3000
        volume_size           = 64
        volume_type           = "gp3"
    }
}

# The EC2 instance which will serve as datanode 1
resource "aws_instance" "dnode1" {
    ami = "ami-0d5eff06f840b45e9"
    instance_type = "m5.xlarge"
    key_name = "ec2-keypair"
    security_groups = [ "allow-ssh-security-group" ]
    root_block_device {
        delete_on_termination = true
        encrypted             = false
        iops                  = 3000
        volume_size           = 64
        volume_type           = "gp3"
    }
}

# The EC2 instance which will serve as datanode 2
resource "aws_instance" "dnode2" {
    ami = "ami-0d5eff06f840b45e9"
    instance_type = "m5.xlarge"
    key_name = "ec2-keypair"
    security_groups = [ "allow-ssh-security-group" ]
    root_block_device {
        delete_on_termination = true
        encrypted             = false
        iops                  = 3000
        volume_size           = 64
        volume_type           = "gp3"
    }
}

# The EC2 instance which will serve as datanode 3
resource "aws_instance" "dnode3" {
    ami = "ami-0d5eff06f840b45e9"
    instance_type = "m5.xlarge"
    key_name = "ec2-keypair"
    security_groups = [ "allow-ssh-security-group" ]
    root_block_device {
        delete_on_termination = true
        encrypted             = false
        iops                  = 3000
        volume_size           = 64
        volume_type           = "gp3"
    }
}