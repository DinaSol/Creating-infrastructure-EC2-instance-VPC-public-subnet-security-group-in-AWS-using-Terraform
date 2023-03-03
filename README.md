# Creating-infrastructure-EC2-instance, VPC-public, subnet, security-group in-AWS-using-Terraform


### Description
- By using the Terraform tool you could create a VPC, subnets, security-group, internet-gateway and EC2 instance  in AWS.
- Benefit of that project: 
	You save time by automating the creation of your infrastructure using Terraform
  You can reuse that code in different cloud providers such as GCP, AWS, Azure, Oracle, etc.. and create an infrastructure just by changing the  resources name
	
## :warning:  NOTE:
-  Here I used **Paris Region**.
- Also in the EC2 section, I used **operating system image in that Region also** so if you changed the Region you must set an image of that region .


------------


#### 📝 The Resources that will be created are:

- **VPC :**
   Here, I created a VPC and attached to it a public subnet 
- **Subnet : **
- 
  a Public subnet that associated to Internet-gateway so it can be accessed over internet
  
- **SecurityGroup :**
	- This security group allow to  SSH, HTTP inbound traffic and all outbound traffic from any IP address. 

- **EC2Instance :**
	 - ImageId is the operating system image id, ***you must be sure that the image is in the same region you use***. 
	 - KeyName must be the keyPair you use or you can create a new one.
	 - vpc_security_group_ids here you assign to the EC2 instance the security groups you want, I assigned the Security group i created above.
	 - SubnetId in which subnet you want the instance be assigned.
   
------------
### How to use the Project

1. $ terraform init
2. $ terraform plan

to create this infrastructure use the command below: 
 $ terraform apply

to delete this infrastructure use the command below: 
 $ terraform destroy


