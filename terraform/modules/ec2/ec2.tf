resource "aws_instance" "web_server" {
  ami           = "ami-0000000000000"
  instance_type = var.instance_type

  tags = {
    name        = "web-server"
    environment = var.environment
  }
}
