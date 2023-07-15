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
  - [x] Jenkin는 Route53에 Record에 DNS연결해야 한다.
  - [x] GitLab은 자체적으로 https를 지원하기 때문에 Route53 Record에 eip를 연결시켜야 한다.

## Architecture

![arch](<./public/flowchart-fun%20(30).png>)

## ...

- terraform시 중복되는 자원들은 .json파일에 놓고 for_each를 하는 편이 좋으나... 그냥 씀 저렇게 하는게 더 귀찮아서 -> 하지만 best practice는 for_each를 하면서 해야좋음 module로 만들면 더좋고..
- acm이 등록이 안된다.. https는 나중에 하자.(jenkins)
- gitlab이 의외로 크네? t3.large로 해야할듯... t3.small은 disk 터진듯
