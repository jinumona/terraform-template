# vim output.conf

output "dbserver_userdata" {
    
  value = data.template_file.mysql-userdata.rendered
}

output "wpfrontend_userdata" {
value = data.template_file.wordpress-frontend-userdata.rendered
}

