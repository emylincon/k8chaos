resource "aws_autoscaling_group" "ec2_auto_scaling_group" {
  name                 = "asg"
  vpc_zone_identifier  = [data.aws_subnet.subnet.id]
  launch_configuration = aws_launch_configuration.ec2_launch_config.name

  desired_capacity          = 1
  min_size                  = 1
  max_size                  = 1
  health_check_grace_period = 30
  health_check_type         = "EC2"
}


resource "aws_launch_configuration" "ec2_launch_config" {
  image_id                    = data.aws_ami.ubuntu.id
  security_groups             = [aws_security_group.ec2_sg.id]
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
<title>Welcome!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Instance with ASG!</h1>
<p>If you see this page, the web server is running successfully</p>

<p><em>Hostname: $(hostname)</em></p>
<p><em>IP Address: $ip </em></p>
</body>
</html>
EOM

sudo echo $page > /var/www/html/index.nginx-debian.html
EOF
  instance_type               = "t2.micro"
  name                        = "web_config"
  key_name                    = var.key_name
  associate_public_ip_address = true

}
