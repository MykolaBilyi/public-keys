variable "connection" {
  type = object({
    user        = string
    private_key = string
    host        = string
  })
}

variable "script_path" {
  type = string
  default = "/usr/local/bin/userkeys.sh"
}