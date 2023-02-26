resource "aws_lb" "lb_main" {
  name               = replace("${var.project} LB", " ", "-")
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.main["loadbalance"].id]
  subnets            = values(aws_subnet.public).*.id

  tags = {
    Name = "${var.project} LB"
  }
}

resource "aws_lb_listener" "http_lb_main_listener" {
  load_balancer_arn = aws_lb.lb_main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "application/json"
      message_body = "{ \"status\":\"otherwise not routed\" }"
      status_code  = "200"
    }
  }
}

resource "aws_lb_target_group" "instances" {
  name     = "${var.project}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_target_group_attachment" "instances" {
  count = length(aws_instance.main.*.id)

  target_group_arn = aws_lb_target_group.instances.arn
  target_id        = aws_instance.main[count.index].id
  port             = 80
}
