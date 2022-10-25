# creating target group for LB

resource "aws_lb_target_group" "webapp-LB-target-group" {
  name     = "webapp-LB-taget-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.proj-vpc.id
}


# Creating the load balancer

resource "aws_lb" "webapp-LB1" {
  name               = "webapp-LB1"
  internal           = false
  load_balancer_type = var.load_balancer_type
  security_groups    = [aws_security_group.allow-80-for-LB.id]
  subnets            = [aws_subnet.publicsubnet-1.id,aws_subnet.publicsubnet-2.id]

  # enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}

# creating the listener

resource "aws_lb_listener" "webapp-LB-listener" {
  load_balancer_arn = aws_lb.webapp-LB1.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webapp-LB-target-group.arn
  }
}
# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "webapp-ASG-attachment" {
  autoscaling_group_name = aws_autoscaling_group.webapp-ASG.id
  lb_target_group_arn    = aws_lb_target_group.webapp-LB-target-group.arn
}
