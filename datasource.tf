#dbserver userdata template

data "template_file" "mysql-userdata" {
 
  template = file("mysql-setup.tmpl")
  vars = {
    ROOT_PASSWORD     = var.root_password
    DATABASE_NAME     = var.database_name
    DATABASE_USER     = var.database_user
    DATABASE_PASSWORD = var.database_password
    DATABASE_HOST     = var.database_host
  }
}


#wp-frontend server  userdata template

data "template_file" "wordpress-frontend-userdata" {

    template = file("wordpress-frontend-userdata.tmpl")

    vars = {
    DATABASE_NAME     = var.database_name
    DATABASE_USER     = var.database_user
    DATABASE_PASSWORD = var.database_password
    DATABASE_HOST     = aws_instance.dbserver.private_ip
  }
}


