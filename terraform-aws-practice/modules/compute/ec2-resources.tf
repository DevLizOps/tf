resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
 
  tags = {
    Name = "${var.prefix}-instance"
    CreatedAt = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
  }
}
