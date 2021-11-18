# OutSystems Database

Creates an OutSystems database server on VMware using SQL Server for Linux
and Ubuntu Focal. 

## Using this Repository

This repository is set up to deploy a single Ubuntu server running MS SQL
Server for use as the OutSystems database. This configuration is intended
for lab/development purposes.

There are several convenience scripts in `bin` that will be in your path
if you use `direnv` and allow the `.envrc` to be processed. Scripts will
be referred to below assuming that they are in your path.

### Preparing 

This repository depends on a `params.yml` file that is used for 
environment specific configuration data. A sample `REDACTED-params.yaml` 
file is included directory `secrets/`, named `REDACTED-params.yml`. 
Make a copy of this file and name it `params.yml`.  Unecrypted files 
in the `secrets/` directory will be ignored by Git. To encrypt and
preserve those files run `secrets encrypt`.

### Configuring Google Cloud

Google Cloud is required to store the Terraform state remotely, allowing
you to run this script from multiple computers for the same server. To 
prepare a service account and storage bucket for the remote state run 
`prepare-remote-state`.

### Configuring vCenter

The server is deployed to vCenter using a user account that we create 
for that purpose. For the time being, the user is created as an admin. I 
plan to scope back the permissions at a later date. Run `prepare-vcenter`
to create the user and make them an administrator.

### Generating Terraform variables

To generate the required Terraform variables from your `params.yml` run
the script `generate-tfvars`.

### Deploying the Server

Run Terraform in the `src/terraform` directory to deploy the server.

```
cd src/terraform
terraform init
terraform apply -var-file ${SECRETS_DIR}/terraform.tfvars
```
