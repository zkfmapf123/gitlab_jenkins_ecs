locals {
  tag = "cicd-donggyu"

  public_subnets = {
    "ap-northeast-2a" : "10.0.1.0/24",
    "ap-northeast-2b" : "10.0.2.0/24"
  }
}