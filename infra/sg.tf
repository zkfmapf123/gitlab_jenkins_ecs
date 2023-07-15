## jenkins
resource "aws_security_group" "jenkins-sg" {
  name   = "jenkins-sg"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [local.my_public_ip]
  }

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    self        = true
  }

  ingress {
    description = "https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [local.my_public_ip]
  }

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [local.my_public_ip]
  }

  ingress {
    description = "jenkins use internal"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [local.my_public_ip]
  }

  ingress {
    description = "jenkins to alb(self)"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    self = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.tag}-jenkins-sg"
  }
}

## gitlab
resource "aws_security_group" "gitlab-sg" {
  name        = "gitlab-sg"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks = [local.my_public_ip]
  }

  ingress {
    description      = "https"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks = [local.my_public_ip]
  }

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks = [local.my_public_ip]
  }

  ingress {
    description      = "https self"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    self = true
  }

  ingress {
    description      = "http self"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    self = true
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.tag}-jenkins-sg"
  }
}