provider "aws" {
  region = var.aws_region
}

resource "aws_api_gateway_rest_api" "dummy_api" {
  name        = "DummyAPI"
  description = "A dummy AWS API Gateway for demonstration purposes"
}
