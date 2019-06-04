variable "aws_credentials" {
    default = {
        region = "us-east-2"
        access_key = ""
        secret_key = ""
    }
}

variable "project" {
    default = {
        default_group_name = "kops"
        default_user_name = "kops"
    }
}