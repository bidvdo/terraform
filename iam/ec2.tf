# # http://ubersid.in/blog/find-latest-amazon-linux-image/
# #Get Linux AMI ID using SSM Parameter endpoint
# data "aws_ssm_parameter" "this" {
#   name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
# }

# resource "aws_key_pair" "mine_key" {
#   key_name   = "mine-key"
#   public_key = file("~/.ssh/id_rsa.pub")
# }

# resource "aws_instance" "this" {
#   ami                    = data.aws_ssm_parameter.this.id
#   key_name               = aws_key_pair.mine_key.key_name
#   vpc_security_group_ids = [aws_security_group.sg.id]
#   instance_type          = "t2.micro"
#   tags = {
#     Name = "bastion-host"
#   }
# }
