terraform {
  backend "s3" {
    bucket = "valentinchevreau"
    encrypt = true
    key  = "architecture/eu-west-1/database/terraform.state"
    region = "eu-west-1"
  }
  
  tags = {
    Name = "Bucket valentinchevreau"
  }
}