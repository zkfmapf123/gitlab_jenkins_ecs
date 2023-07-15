# Gitlab Jenkins ECS Automation

## Tools

- Terraform
- Ansible
- AWS
  - VPC
  - SG
  - EC2 (Jenkins, Gitlab)
  - ECR / ECS (Fargate)
  - Event_bridge
  - Lambda (ts)

## Todo

- [x] make aws infra terraform (vpc, sg, ec2, ecs, event_brige, lambda, ...)
- [x] make configure management use ansible
- [x] init jenkins and gitlab

## Architecture

![arch](<./public/flowchart-fun%20(30).png>)

## ...

- terraform시 중복되는 자원들은 .json파일에 놓고 for_each를 하는 편이 좋으나... 그냥 씀 저렇게 하는게 더 귀찮아서 -> 하지만 best practice는 for_each를 하면서 해야좋음 module로 만들면 더좋고..
