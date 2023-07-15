################################### Jenkins ###################################
resource "aws_key_pair" "jenkins-keypair" {
  key_name   = "jenkins-ec2-keypair"
  public_key = file(local.public_to_path)
}

resource "aws_eip" "jenkins-eip" {
  vpc      = true
  instance = aws_instance.jenkin-ec2.id

  tags = {
    Name = "${local.tag}-jenkins-eip"
  }
}

resource "aws_instance" "jenkin-ec2" {
  ami               = local.ami
  instance_type     = local.type
  availability_zone = local.az
  subnet_id         = lookup(aws_subnet.publics, local.az).id

  vpc_security_group_ids      = [aws_security_group.jenkins-sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.jenkins-keypair.key_name

  tags = {
    Name = "${local.tag}-jenkins-sg"
  }
}

resource "aws_eip_association" "jenkins_assoc" {
  instance_id   = aws_instance.jenkin-ec2.id
  allocation_id = aws_eip.jenkins-eip.id
}

################################### Jenkins ###################################
resource "aws_key_pair" "gitlab-keypair" {
  key_name   = "gitlab-ec2-keypair"
  public_key = file(local.public_to_path)
}

resource "aws_eip" "gitlab-eip" {
  vpc      = true
  instance = aws_instance.gitlab-ec2.id

  tags = {
    Name = "${local.tag}-gitlab-eip"
  }
}

resource "aws_instance" "gitlab-ec2" {
  ami               = local.ami
  instance_type     = local.type
  availability_zone = local.az
  subnet_id         = lookup(aws_subnet.publics, local.az).id

  vpc_security_group_ids      = [aws_security_group.gitlab-sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.gitlab-keypair.key_name

  tags = {
    Name = "${local.tag}-gitlab-sg"
  }
}

resource "aws_eip_association" "gitlab" {
  instance_id   = aws_instance.gitlab-ec2.id
  allocation_id = aws_eip.gitlab-eip.id
}