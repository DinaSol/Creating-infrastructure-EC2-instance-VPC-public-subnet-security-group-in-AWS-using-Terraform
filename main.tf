
#  creating a security group that allow http, https and SSH traffic to get in instance
resource "aws_security_group" "sg" {
  name        = "Dina-allow_http_https_ssh"
  description = "Allow http, https and ssh inbound traffic"
  depends_on = [
    aws_vpc.main_vpc
  ]
  vpc_id = aws_vpc.main_vpc.id 

#  allow https, http, ssh inbound traffic
  ingress {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  
  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
   ingress {
    description      = "HTTP from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#  allow all outbound traffic from the ec2 instance
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  } 

  tags = {
    Name = "allow_http_https_ssh"
  }
}


# creating an EC2 instance within a tag name
resource "aws_instance" "my-instance" {
  ami           = "ami-06b6c7fea532f597e"
  instance_type = "t2.micro"

  depends_on = [
    aws_vpc.main_vpc
  ]  
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = aws_subnet.public_subnet.id

#  here is my key-pair that used to authentication when access this instance by ssh
  key_name = "key-pair-dina"
  
#   the instance name 
  tags = {
    Name = "dina-instance"
  }
}

# Generate an EIp elastic public ip 
resource  "aws_eip" "my-eip"{
    vpc = true
}

# Associate the EIP to the instance 
resource "aws_eip_association" "associate"{
    instance_id=aws_instance.my-instance.id
    allocation_id=aws_eip.my-eip.id
}


# upload "terraform.tfstate" file to S3 
terraform {
    backend "s3" {
    bucket = "dina-bucket-tf"
    key    = "terraform.tfstate"
    region = "eu-west-3"
  }
}

