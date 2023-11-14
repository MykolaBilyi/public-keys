variable "connection" {
  type = object({
    user        = string
    host        = string
    private_key = optional(string)
    agent       = optional(bool)
  })
}

variable "script_path" {
  type = string
  default = "/usr/local/bin/userkeys.sh"
}