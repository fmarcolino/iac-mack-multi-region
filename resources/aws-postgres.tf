resource "aws_db_subnet_group" "main" {
  name       = "mydb"
  subnet_ids = values(aws_subnet.public).*.id

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "main" {
  allocated_storage        = 20
  backup_retention_period  = 7
  db_subnet_group_name     = aws_db_subnet_group.main.name
  engine                   = "postgres"
  engine_version           = "12"
  identifier               = "mydb"
  instance_class           = "db.t2.micro"
  multi_az                 = false
  db_name                  = "mydb"
  password                 = "123456"
  port                     = 5432
  publicly_accessible      = true
  storage_encrypted        = true
  storage_type             = "gp2"
  username                 = "mydb"
  vpc_security_group_ids   = [aws_security_group.main["database"].id]
}
