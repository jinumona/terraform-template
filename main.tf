provider "aws" {
    region = "ap-south-1"
}


# creating key pair

resource "aws_key_pair" "key" {
  key_name   = "${var.project}-${var.env}"
  public_key = file("localkey.pub")
    
    tags = {
    
    Name = "${var.project}-${var.env}"
    project = var.project
    env = var.env
}
}



# instance db server creation

resource "aws_instance" "dbserver" {
  ami           = "ami-079b5e5b3971bd10d"
  instance_type = "t2.micro"
  key_name = aws_key_pair.key.key_name
  vpc_security_group_ids = ["sg-04182bdfbfa17d831"]

  user_data                   = "${data.template_file.mysql-userdata.rendered}"
  user_data_replace_on_change = true
  tags = {
    Name = "dbserver-${var.project}-${var.env}"
    project= var.project
    
  }
}




# instance wp-frontend server creation

resource "aws_instance" "wp-frontend" {
  ami           = "ami-079b5e5b3971bd10d"
  instance_type = "t2.micro"
  key_name = aws_key_pair.key.key_name
  vpc_security_group_ids = ["sg-04182bdfbfa17d831"]

 user_data                   = "${data.template_file.wordpress-frontend-userdata.rendered}"
  user_data_replace_on_change = true
  tags = {
    Name = "frontend-${var.project}-${var.env}"
    project = var.project
  }
}


