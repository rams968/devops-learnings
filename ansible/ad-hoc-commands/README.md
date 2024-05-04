# Ansible

## Ad-hoc command examples

```sh
$ ansible [pattern] -m ping                                    // -m - module
$ ansible [pattern] -m stat -a "name=/etc/passwd"              // -a - module option/argument
$ ansible [patern] -m yum -a "name=httpd state=present" -b     // -b - sudo as root
$ ansible [patern] -m yum -a "name=httpd state=present" -u username     // -u - connect as a different user
```

## Command line tools

- ansible
- ansible-config
- ansible-console
- ansible-doc
- ansible-galaxy
- ansible-inventory
- ansible-playbook
- ansible-pull

## References


