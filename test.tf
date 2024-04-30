variable "env_var_name" {
  description = "The name of the environment variable to print"
  type        = string
}

resource "null_resource" "print_env_var" {
  triggers = {
    env_var_name = var.env_var_name
  }

  provisioner "local-exec" {
    command = "echo \"The value of ${var.env_var_name} is: $${${var.env_var_name}}\""
  }
}

output "env_var_name" {
  description = "The name of the environment variable being printed"
  value       = var.env_var_name
}
