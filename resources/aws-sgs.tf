resource "aws_security_group" "main" {
  for_each = toset(["instances", "database", "loadbalance"])

  name        = "${var.project}-${each.key}-sg"
  description = "${var.project} SG ${each.key}"
  vpc_id      = aws_vpc.main.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project} SG ${each.key}"
  }
}

resource "aws_security_group_rule" "instances-ssh-all" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main["instances"].id
}

resource "aws_security_group_rule" "instances_http_only_by_lb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.main["instances"].id

  source_security_group_id = aws_security_group.main["loadbalance"].id
}

resource "aws_security_group_rule" "database_by_instances" {
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  security_group_id = aws_security_group.main["database"].id

  source_security_group_id = aws_security_group.main["instances"].id
}

resource "aws_security_group_rule" "loadbalance_http_all" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main["loadbalance"].id
}
