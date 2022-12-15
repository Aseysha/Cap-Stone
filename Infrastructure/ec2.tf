resource "aws_instance" "facts_instance" {
  ami                         = "ami-0d593311db5abb72b"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  subnet_id                  = aws_subnet.public_subnet.id
  vpc_security_group_ids     = [aws_security_group.allow_http.id]
  key_name                   = "vockey"
  iam_instance_profile       ="LabInstanceProfile"
  tags = {
    Name = "Facts Notifier"
  }
}
# OUTPUT
output "ec2_public_ip" {
  value = aws_instance.facts_instance.public_ip
  description = "Public ip address"
}
