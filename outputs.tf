# Display the public ip of the instance 
output "eip_value" {
    description = "VM public IP"
    value= aws_instance.my-instance.public_ip
}

# Display the private ip of the instance 
output "privateIp_value" {
    description = "VM private IP"
    value= aws_instance.my-instance.private_ip
}

# Display instance state (Running or stopped or terminated)
output "instanceState" {
    description = "instance_state"
    value= aws_instance.my-instance.instance_state
}

# Display Tag of the instance
output "EC2_instance_name" {
    description = "instance tag"
    value= aws_instance.my-instance.tags_all
}
