resource "aws_instance" "main" {
  count = 2

  ami           = data.aws_ami.linux2.image_id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.deployer.key_name

  subnet_id              = values(aws_subnet.public)[count.index].id
  vpc_security_group_ids = [aws_security_group.main["instances"].id]

  tags = {
    Name = "${var.project} ${count.index}"
  }
}
