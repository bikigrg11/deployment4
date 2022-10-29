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