provider "aws" {
  region = var.aws_region
}

resource "aws_db_instance" "dummy_db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  name                 = "dummydb"
  username             = "admin"
  password             = "dummyPassword123"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}

resource "aws_s3_bucket" "dummy_bucket" {
  bucket = "dummy-bucket-terraform-example"
  acl    = "private"
}
