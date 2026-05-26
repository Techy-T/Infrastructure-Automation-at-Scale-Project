resource "aws_security_group" "web-sg" {
  name        = "${var.environment}-web-sg"
  vpc_id      = aws_vpc.main_vpc.id
  description = "Allow HTTP and HTTPS traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
    }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" 
    cidr_blocks = ["0.0.0.0/0"]
  }   

  tags = {
    Name = "${var.environment}-web-sg"
  }

}

resource "aws_instance" "web-server" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id = aws_subnet.public_subnet[count.index % length(aws_subnet.public_subnet)].id

  vpc_security_group_ids = [aws_security_group.web-sg.id]

  tags = {
    Name = "${var.environment}-web-server-${count.index + 1}"
    Environment = var.environment
  }
}