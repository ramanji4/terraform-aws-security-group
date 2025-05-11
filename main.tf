resource "aws_security_group" "main" {
  name        = local.sg_main_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

#ingress rules are may keep changing time to time based on requirement so that didn't mentioned the ingress rules.

  tags = merge(
    var.common_tags,
    var.sg_tags,
    {
        Name = local.sg_main_name
    }
  )
}