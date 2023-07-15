resource "aws_acm_certificate" "jenkins-cert" {
  domain_name       = "*.leedonggyu.com"
  validation_method = "DNS"

  subject_alternative_names = [
    "jenkins.leedonggyu.com"
  ]
}