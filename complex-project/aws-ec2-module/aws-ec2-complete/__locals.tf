locals {
  name   = "ex-${basename(path.cwd)}" # A função 'basename(path.cwd)' retorna o nome do diretório de trabalho atual. 
  region = "us-east-1"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)
  # A função slice é usada para pegar um subconjunto de uma lista.
  # 'data.aws_availability_zones.available.names' retorna uma lista de nomes das zonas de disponibilidade
  # 'slice(..., 0, 3)' seleciona os três primeiros elementos dessa lista.

  user_data = <<-EOT
    #!/bin/bash
    echo "Hello Terraform!"
  EOT
# 'user_data' é o que pode ser passado para instâncias EC2 (ou outros recursos suportados) no momento de sua criação. 
  
  tags = {
    Name       = local.name
    Example    = local.name
    Repository = "https://github.com/terraform-aws-modules/terraform-aws-ec2-instance"
  }
}