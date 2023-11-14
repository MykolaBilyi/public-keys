locals {
  escaped_script_path = replace(var.script_path, "/", "\\/")
}

resource "ssh_resource" "keys" {
  host        = var.connection.host
  user        = var.connection.user
  private_key = var.connection.private_key
  agent       = var.connection.agent

  when = "create"

  file {
    source      = "${path.module}/userkeys.sh"
    destination = var.script_path
    permissions = "0755"
  }

  commands = [
    "sed -i -E 's/#?AuthorizedKeysCommand none/AuthorizedKeysCommand ${local.escaped_script_path} %u/' /etc/ssh/sshd_config",
    "sed -i -E 's/#?AuthorizedKeysCommandUser nobody/AuthorizedKeysCommandUser nobody/' /etc/ssh/sshd_config",
    "service ssh restart",
  ]
}