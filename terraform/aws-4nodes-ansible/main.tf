# Provider Block
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

#
# Use default VPC, and associated subnet, igw, rt and security group
# Ansible-SG to create 4 EC2 instances: 1 AWS instance for control node,
# 1 AWS instance, 1 Ubuntu instance, and 1 CentOS instance for total of
# 3 ansible managed nodes
# This configuration is used by Terraform to setup nodes to learn and practice
# Ansible. Add private ip for each node, to avoid update inventory for
# ansible after teardown/restart 4 nodes.

# Creates EC2 Instance - control node
resource "aws_instance" "Ansible_control_node" {

  ami                         = "ami-04e5276ebb8451442"
  instance_type               = "t2.micro"
  associate_public_ip_address = true

  key_name        = "Ansible"
  private_ip = "172.31.24.131"
  security_groups = ["Ansible-SG", ]
  vpc_security_group_ids = [
    "sg-0772870c81513785b"
  ]

  tags = {
    Name = "control_node"
  }

}

# Creates EC2 Instance - aws-linux managed node
resource "aws_instance" "Ansible_Amazon_managed_node" {
    ami             = "ami-0ce27a627be5f8d8d"
    instance_type = "t2.micro"

    key_name        = "Ansible"
    private_ip = "172.31.30.53"
    security_groups = [ "Ansible-SG", ]
    vpc_security_group_ids = [
        "sg-0772870c81513785b",
    ]
    associate_public_ip_address = true

    tags = {
        Name = "ams_managed_node"
    }
}

# Creates EC2 Instance - centos managed node
resource "aws_instance" "Ansible_centos_managed_node" {
    ami             = "ami-0df2a11dd1fe1f8e3"
    instance_type = "t2.micro"

    key_name        = "Ansible"
    security_groups = [ "Ansible-SG", ]
    vpc_security_group_ids = [
        "sg-0772870c81513785b",
    ]
    associate_public_ip_address = true
    private_ip = "172.31.28.44"

    tags = {
        Name = "centos_managed_node"
    }
}

# Creates EC2 Instance - ubuntu managed node
resource "aws_instance" "Ansible_ubuntu_managed_node" {
    ami             = "ami-04b70fa74e45c3917"
    instance_type = "t2.micro"

    key_name        = "Ansible"
    security_groups = [ "Ansible-SG", ]
    vpc_security_group_ids = [
        "sg-0772870c81513785b",
    ]
    associate_public_ip_address = true
    private_ip = "172.31.23.1"

    tags = {
        Name = "ubuntu_managed_node"
    }
}
