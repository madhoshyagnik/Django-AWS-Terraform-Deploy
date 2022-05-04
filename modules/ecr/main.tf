provider "aws" {
  region = "us-west-2"
}

resource "aws_ecr_repository" "foo" {
  name                 = var.ecr_name
  image_tag_mutability = var.mutability

  image_scanning_configuration {
    scan_on_push = true
  }
}