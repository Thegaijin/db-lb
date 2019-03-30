# db-lb

Load balancing postgres databases

#### Introduction

In this repository, I setup a high availability database infrastructure with 2 slaves and one master working with PostgreSQL databases and a HAproxy load balancer

Deployment Tools

    [Packer](https://www.packer.io/))
    [Terraform](terraform.io)
    Bash Scripts

Project directory structure

The project is divided into two directories each holding separate components needed to setup the project.

#### How to deploy to GCP

Once you have cloned the repository, set the necessary environment variables, changge directory to the root of the project, then run;

        ```bash deploy.sh```

#### Acces to the HAproxy statistics page

In order to access the statistics page, depending on what variables you opted to use, pick the external IP address of your HAproxy instance and use that in the browser along with the port number, `1936`. the URL should look something like

    ```http://<HAproxy-external-ip>:1936

#### Image of working infrastructure

![HAproxy statistics](https://user-images.githubusercontent.com/5388763/55282408-4d416380-5354-11e9-9572-2888fd55aec6.png)

#### Gif of replication

![replication](https://user-images.githubusercontent.com/5388763/55282414-73670380-5354-11e9-9ff5-b624177cf08a.gif)
