
# http://ubersid.in/blog/find-latest-amazon-linux-image/
#Get Linux AMI ID using SSM Parameter endpoint
data "aws_ssm_parameter" "webserver-ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}
resource "aws_instance" "app_server" {
  ami           = data.aws_ssm_parameter.webserver-ami.value
  instance_type = "t2.micro"

  tags = {
    Name = "Webserver01"
  }
}


resource "aws_instance" "redis_server" {
  ami           = data.aws_ssm_parameter.webserver-ami.value
  instance_type = "t2.micro"

  tags = {
    Name = "Redis01"
  }
}
