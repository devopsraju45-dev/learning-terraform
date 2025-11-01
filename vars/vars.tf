variable "test" {
  default = "hello"
}

output "test" {
  value = var.test
}
