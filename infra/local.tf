locals {
  tag = "cicd-donggyu"

  // vpc
  public_subnets = {
    "ap-northeast-2a" : "10.0.1.0/24",
    "ap-northeast-2b" : "10.0.2.0/24"
  }

  // sg
  my_public_ip = "221.151.163.17/32"

  // ec2
  ami            = "ami-0ea4d4b8dc1e46212"
  type           = "t3.small"
  az             = "ap-northeast-2a"
  public_to_path = "~/.ssh/id_rsa.pub"

}