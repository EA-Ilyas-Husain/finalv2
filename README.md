**See Trello for Solution Description**

# Instructions
*(CentOS 7)*

Create a ~/creds/serviceaccount.json file on your machine. Copy your service account credentials into this file.

Install java, wget, git, unzip: ```sudo yum install -y java wget git unzip```

Install Terraform: https://www.terraform.io/downloads.html.

Install Packer: https://www.packer.io/downloads.html.

Git clone this repo and ```cd```.

To create the nginx and apache images (not really necessary since already created and in terraform code) run:

```
make packer
```

To create the instance groups and load-balancer, run:

```
make instances
```