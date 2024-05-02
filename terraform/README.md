# Terraform

<b><details><summary>About</summary></b>
Usage about Terraform commands, and code to setup infrastructures based on AWS, etc.

</details>

## Terraform commands

* Initialize a working directory and dowloads the necessary provider plugins and modules, setup the backend for storing infrastructure's state:

```sh
$ terraform init
```

* Execute the actions specified in a Terraform plan to create, update, or destroy infrastructure:

```sh
$ terraform apply
```

* Destroy all the remote objects managed by a Terraform configuration/plan:

```sh
$ terraform destroy
```

* Check the current state of the infrastructure:

```sh
$ terraform show
```
