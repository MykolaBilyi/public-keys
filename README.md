# Mykola's Public keys

Inspired by [Better SSH Authorized Keys Management](https://gist.github.com/sivel/c68f601137ef9063efd7).

## Terraform module

```hcl
module "user_keys" {
  source = "github.com/MykolaBilyi/public-keys?ref=v0.1"

  connection = {
    user        = "root"
    private_key = file("~/.ssh/id_rsa")
    host        = "my.domain.com"
  }
}
```

## Manual installation

```sh
curl https://raw.githubusercontent.com/MykolaBilyi/public-keys/main/userkeys.sh > /usr/local/bin/userkeys.sh
chmod 0755 /usr/local/bin/userkeys.sh
sed -i -E 's/#?AuthorizedKeysCommand none/AuthorizedKeysCommand \/usr\/local\/bin\/userkeys.sh %u/' /etc/ssh/sshd_config
sed -i -E 's/#?AuthorizedKeysCommandUser nobody/AuthorizedKeysCommandUser nobody/' /etc/ssh/sshd_config
service ssh restart
```
