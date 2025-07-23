resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("${path.module}/id_rsa.pub")
 # ודא שקיים מפתח פומבי במחשב שלך
}

resource "aws_instance" "bastion" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  key_name               = aws_key_pair.deployer.key_name

  tags = {
    Name = "bastion-host"
  }
}

resource "aws_instance" "nginx" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.private_instance_sg.id]
  key_name               = aws_key_pair.deployer.key_name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y docker.io
              sudo systemctl start docker
              sudo docker run -d -p 80:80 nginx /bin/bash -c 'echo "yo this is nginx" > /usr/share/nginx/html/index.html && nginx -g "daemon off;"'
              EOF

  tags = {
    Name = "nginx-instance"
  }
}
