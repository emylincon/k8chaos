
resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  availability_zone           = var.az
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  subnet_id                   = data.aws_subnet.subnet.id
  user_data                   = <<-EOF
#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
ip=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
read -r -d '' page << EOM
<!DOCTYPE html>
<html>
<head>
<title>No ASG</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Instance with No ASG!</h1>
<p>If you see this page, the web server is running successfully</p>

<p><em>Hostname: $(hostname)</em></p>
<p><em>IP Address: $ip </em></p>
</body>
</html>
EOM

sudo echo $page > /var/www/html/index.nginx-debian.html
EOF
  tags = {
    Name = "ec2-instance"
  }
}
