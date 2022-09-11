variable "project" {
    default = "wordpress"
}

variable "env" {
    default = "dev"
}

variable "root_password" {
    
  default = "mysqlroot@123"
}

variable "database_user" {
    
  default = "wordpressuser"
}

variable "database_name" {
    
  default = "wordpressdb"
}

variable "database_password" {

  default = "wordpresspwd"
}


variable "database_host" {
    
  default = "%"
}

