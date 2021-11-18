data "http" "microsoft_key" {
  url = "https://packages.microsoft.com/keys/microsoft.asc"
}

data "http" "sqlserver_list" {
  url = "https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list"
}

data "http" "microsoft_list" {
  url = "https://packages.microsoft.com/config/ubuntu/20.04/prod.list"
}

data "local_file" "ssh_key" {
  filename = var.ssh_key_file 
}

data "carvel_ytt" "user_data" {
  files = [
    "${var.project_root}/src/cloud-init"
  ]
  values = {
    "domain" = var.domain

    "microsoft.pgp_key"    = data.http.microsoft_key.body,
    "microsoft.mssql_list" = data.http.sqlserver_list.body,
    "microsoft.prod_list"  = data.http.microsoft_list.body,

    "ssh.authorized_keys.crdant"  = data.local_file.ssh_key.content
  }

  ignore_unknown_comments = true
}


