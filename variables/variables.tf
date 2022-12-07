variable "root_password" {
  type    = string
  default = "hash"
}

output "out1" {
  value = var.root_password
}
