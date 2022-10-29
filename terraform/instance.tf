# provider "docker" {}

# resource "docker_image" "nginx" {
#   name         = "python:latest"
#   keep_locally = false
# }

# resource "docker_container" "python" {
#   image = docker_image.python.latest
#   name  = "tutorial"
#   ports {
#     internal = 80
#     external = 8000
#   }
# }


module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.5.0"
  count   = 1

  name = "web_server01"

  ami                    = "ami-08c40ec9ead489470"
  instance_type          = "t2.micro"
  key_name               = "ubuntu_ec2"
  monitoring             = true
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  user_data              = "${file("deploy.sh")}"


  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name = "Webserver001"
  }
}