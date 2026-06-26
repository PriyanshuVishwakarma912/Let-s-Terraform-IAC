variable "ec2_instance_name" {
    description = "This variabl holds ec2 instance name"
    default = "terra-iac-server"
    type = string
}

variable "ec2_volume_size" {
    description = "This variabl holds ec2 instance volume size"
    default = "1"
    type = number
}

variable "ec2_instance_state" {
    description = "This variabl holds ec2 instance state"
    default = "running"
    type = string
}
