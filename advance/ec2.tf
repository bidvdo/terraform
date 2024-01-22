# http://ubersid.in/blog/find-latest-amazon-linux-image/
#Get Linux AMI ID using SSM Parameter endpoint
data "aws_ssm_parameter" "webserver-ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}


#Create key-pair for logging into EC2
resource "aws_key_pair" "webserver-key" {
  key_name   = "webserver-key"
  public_key = file("/tmp/ssh.pub")
}

#Create and bootstrap webserver01
resource "aws_instance" "webserver01" {
  ami                         = "ami-0df7a207adb9748c7"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.webserver-key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.public_subnet_2a.id
  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install httpd && sudo systemctl start httpd",
      "echo '<h1><center>My Test Website With Help From Terraform Provisioner</center></h1>' > index.html",
      "sudo mv index.html /var/www/html/"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }
  }
  tags = {
    Name = "webserver01"
  }
}


#TODO Create Redis instance
