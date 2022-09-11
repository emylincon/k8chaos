export EC2_IP_NO_ASG=$(aws ec2 describe-instances --filters Name=tag:Name,Values=ec2-instance --query "Reservations[*].Instances[*].NetworkInterfaces[*].Association.PublicIp" --output text)
export EC2_IP_ASG=$(aws ec2 describe-instances --filters Name=tag:aws:autoscaling:groupName,Values=asg --query "Reservations[*].Instances[*].NetworkInterfaces[*].Association.PublicIp" --output text)
