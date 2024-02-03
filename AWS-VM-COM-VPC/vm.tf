#core do código. é necessário o par de chaves para utilização dos recursos em sua conta.
resource "aws_key_pair" "key" {
  key_name = "aws-key"
  
  #ssh-keygen -f aws-key
  public_key = file("./aws-key.pub") #coloque sua chave pública.
}

resource "aws_instance" "vm" {
    ami = ""#ami da instancia desejada. olhe o site da AWS para obter essa informação
    instance_type = "t2.micro"
    key_name = aws_key_pair.key.key_name #referenciando o par de chaves acima
    subnet_id = data.terraform_remote_state.vpc.outputs.subnet_id
    vpc_security_group_ids = data.terraform_remote_state.vpc.outputs.security_group_id
    associate_public_ip_address = true

    tags = {
      Name = "vm-terraform"
    }
}