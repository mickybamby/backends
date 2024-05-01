#creation of ec2 instance.
resource "aws_instance" "my_instance" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
  Name = var.name
  }
}

#s3 bucket for our backend storage.
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = var.tag_name
  }
}

#s3 bucket versioning
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = var.bucket_name
  versioning_configuration {
    status = "Enabled"
  }
}

#s3 bucket encrytion using kms
resource "aws_kms_key" "a" {
  description             = "This key is used to encrypt backend bucket objects"
  deletion_window_in_days = var.deletion_window_in_days
}

resource "aws_kms_alias" "a" {
  name          = "alias/tfstate/${var.region}/s3/key"
  target_key_id = aws_kms_key.a.key_id
}

#dynamodb for locking the state file 
resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  deletion_protection_enabled = var.delete_protect

  tags = {
    Name = var.dynamo_table
  }
}

#creation of security group for our ec2 instance
resource "aws_security_group" "allow_tls" {
  name        = var.name_sg
  description = var.description

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["116.30.20.50/32"]

  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["116.30.20.50/32"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["116.30.20.50/32"]
  }

  tags = {
    Name = var.tags
  }
}
