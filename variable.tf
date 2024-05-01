
variable "region" {
  description = "this is the region where our resources are created"
  type        = string
  default     = "eu-west-1"
}

variable "name" {
  description = "this is the tag name for Ec2 instance"
  type        = string
  default     = "dev"
}

variable "ami" {
  description = "this is the chosen amazon machine image"
  type        = string
  default     = "ami-0607a9783dd204cae"
}

variable "instance_type" {
  description = "this is the name of our instance type"
  type        = string
  default     = "t2.micro"
}

variable "bucket_name" {
  description = "this is the name of our s3 bucket"
  type        = string
  default     = "s3-backend-buckett"
}

variable "tag_name" {
  description = "this is the tag name for my bucket"
  type        = string
  default     = "s3-backend-buckett"
}

variable "deletion_window_in_days" {
  description = "this is the deletion window for my kms key"
  type        = number
  default     = 30
}

variable "delete_protect" {
  description = "To protect the dynamodb from being deleted by default"
  type        = bool
  default     = true
}

variable "table_name" {
  description = "Name of my dynamodb table"
  type        = string
  default     = "lock-terraform-state-db"
}


variable "dynamo_table" {
  description = "tag name of my dynamo table"
  type        = string
  default     = "dynamodb-table-stafe-file"

}

variable "name_sg" {
  description = "name of our security group for our ec2"
  type        = string
  default     = "Allow_tls"
}

variable "description" {
  description = "this is the decription for our security group"
  type        = string
  default     = "Allow TLS inbound traffic"
}

variable "tags" {
  description = "tag name for our ingress"
  type        = string
  default     = "manual"
}

