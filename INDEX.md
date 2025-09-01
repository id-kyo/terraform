# 📚 Índice do Portfólio Terraform

Navegação rápida por todos os projetos e recursos disponíveis.

## 🏠 [Página Principal](../README.md)

Visão geral completa do portfólio, objetivos e estrutura.

## 📁 Estrutura do Repositório

```
terraform/
├── 📚 simple-project/          # Projetos básicos
├── 🔧 intermediary-project/    # Projetos intermediários  
├── 🚀 complex-project/         # Projetos avançados
├── 📖 README.md                # Documentação principal
├── 🗺️ ROADMAP.md               # Planejamento futuro
├── 🤝 CONTRIBUTING.md          # Guia de contribuição
├── 🏆 BADGES.md                # Coleção de badges
├── 📋 INDEX.md                 # Este arquivo
├── 📄 LICENSE                  # Licença MIT
└── 🔧 devbox.json              # Ambiente de desenvolvimento
```

## 📚 Projetos Simples

### 🏗️ [AWS VPC Básica](simple-project/aws-vpc/)
- **Descrição**: Criação de VPC com subnets e internet gateway
- **Tempo**: 15-20 minutos
- **Conceitos**: VPC, Subnets, Internet Gateway, Route Tables
- **Arquivos**: `aws_vpc.tf`, `aws_subnet.tf`, `aws_igw.tf`, `aws_route_table.tf`

### 🔒 [AWS Security Group + EC2](simple-project/aws-sg-ec2/)
- **Descrição**: Instância EC2 com security group para SSH
- **Tempo**: 20-25 minutos
- **Conceitos**: Security Groups, EC2, Key Pairs, SSH
- **Arquivos**: `aws_ec2.tf`, `aws_sg.tf`, `main.tf`, `output.tf`

### 🗂️ [AWS S3 Bucket](simple-project/aws-bucket/)
- **Descrição**: Bucket S3 com configuração de website
- **Tempo**: 15-20 minutos
- **Conceitos**: S3, Website Hosting, Public Access, Objects
- **Arquivos**: `main.tf`, `resource.tf`

## 🔧 Projetos Intermediários

### 🏗️ [Arquitetura 3-Tier](intermediary-project/aws-3tier/)
- **Descrição**: VPC completa com camadas web, aplicação e banco
- **Tempo**: 45-60 minutos
- **Conceitos**: Multi-tier, Auto Scaling, RDS, NAT Gateway
- **Arquivos**: `aws_VPC.tf`, `aws_subnets.tf`, `aws_alb.tf`, `aws_asg.tf`, `aws_rds.tf`

### ⚖️ [Load Balancer + Auto Scaling](intermediary-project/aws-lb-as/)
- **Descrição**: ALB com grupos de auto-scaling
- **Tempo**: 30-40 minutos
- **Conceitos**: ALB, Target Groups, Auto Scaling, Health Checks
- **Arquivos**: `main.tf`, `resouce.tf`

### 🌐 [Website Estático S3](intermediary-project/aws-static-website/)
- **Descrição**: Deploy de site estático usando S3
- **Tempo**: 20-25 minutos
- **Conceitos**: S3 Website, Public Access, Object Upload
- **Arquivos**: `main.tf`, `resource.tf`, `variables.tf`, `output.tf`

### 🔗 [VPC + VM](intermediary-project/aws-vpc-with-vm/)
- **Descrição**: Integração entre VPC customizada e instâncias EC2
- **Tempo**: 25-30 minutos
- **Conceitos**: Remote State, VPC Integration, EC2
- **Arquivos**: `main.tf`, `vm.tf`, `output.tf`

## 🚀 Projetos Complexos

### 🖥️ [Módulos EC2](complex-project/aws-ec2-module/)
- **Descrição**: Coleção abrangente de módulos para instâncias EC2
- **Tempo**: 60-90 minutos
- **Conceitos**: Módulos Terraform, EC2 Avançado, Spot Instances
- **Submódulos**:
  - [EC2 Single](complex-project/aws-ec2-module/aws-ec2-single/)
  - [EC2 Complete](complex-project/aws-ec2-module/aws-ec2-complete/)

### 🔐 [Módulos IAM](complex-project/aws-iam-module/)
- **Descrição**: Gerenciamento avançado de identidade e acesso
- **Tempo**: 45-60 minutos
- **Conceitos**: IAM, Cross-account, Roles, Policies
- **Submódulos**:
  - [IAM Account](complex-project/aws-iam-module/iam-account/)
  - [Cross-Account Policies](complex-project/aws-iam-module/cross-account-policies-using-group/)

### 🗄️ [Módulos RDS](complex-project/aws-rds-module/)
- **Descrição**: Bancos PostgreSQL com alta disponibilidade
- **Tempo**: 40-50 minutos
- **Conceitos**: RDS, PostgreSQL, Multi-AZ, Security Groups
- **Arquivos**: `__rds.tf`, `__modules.tf`, `__locals.tf`

### 🌐 [Módulos VPC](complex-project/aws-vpc-module/)
- **Descrição**: Arquiteturas de rede escaláveis e seguras
- **Tempo**: 35-45 minutos
- **Conceitos**: VPC Avançado, Multi-region, Networking
- **Arquivos**: `__vpc.tf`, `_locals.tf`, `_outputs.tf`

### 💰 [Módulos de Preços](complex-project/aws-pricing-modules/)
- **Descrição**: Cálculo de custos de infraestrutura AWS
- **Tempo**: 30-40 minutos
- **Conceitos**: AWS Pricing API, Cost Analysis, Resource Filtering
- **Submódulos**:
  - [AWS Pricing Resources](complex-project/aws-pricing-modules/aws-pricing-resources/)
  - [AWS Complex Pricing](complex-project/aws-pricing-modules/aws-complex-pricing/)

## 📖 Documentação e Recursos

### 📋 [Guia de Contribuição](CONTRIBUTING.md)
- Como contribuir para o projeto
- Padrões de código
- Processo de pull request
- Templates para issues

### 🗺️ [Roadmap](ROADMAP.md)
- Planejamento futuro do projeto
- Cronograma de releases
- Novas funcionalidades planejadas
- Metas de longo prazo

### 🏆 [Badges](BADGES.md)
- Coleção de badges para personalização
- Badges por categoria
- Badges de qualidade e status
- Como usar e personalizar

### 📝 [Changelog](CHANGELOG.md)
- Histórico de mudanças
- Versões e releases
- Formato e estrutura
- Como contribuir

## 🚀 Como Começar

### 🎯 Para Iniciantes
1. **Leia o [README principal](../README.md)**
2. **Comece com [Projetos Simples](simple-project/)**
3. **Execute o projeto [AWS VPC Básica](simple-project/aws-vpc/)**
4. **Avance para [Security Group + EC2](simple-project/aws-sg-ec2/)**

### 🔧 Para Intermediários
1. **Revise os [Projetos Simples](simple-project/)**
2. **Experimente [Website Estático S3](intermediary-project/aws-static-website/)**
3. **Implemente [Load Balancer + Auto Scaling](intermediary-project/aws-lb-as/)**
4. **Desafie-se com [Arquitetura 3-Tier](intermediary-project/aws-3tier/)**

### 🚀 Para Avançados
1. **Domine os [Projetos Intermediários](intermediary-project/)**
2. **Explore [Módulos VPC](complex-project/aws-vpc-module/)**
3. **Implemente [Módulos RDS](complex-project/aws-rds-module/)**
4. **Crie [Módulos EC2](complex-project/aws-ec2-module/)**

## 🛠️ Ferramentas e Configuração

### 🔧 Pré-requisitos
- **Terraform** >= 1.0
- **AWS CLI** configurado
- **Conta AWS** ativa
- **Git** para controle de versão

### 🐳 Ambiente de Desenvolvimento
- **Devbox** para ambiente consistente
- **Docker** para isolamento
- **VS Code** com extensões Terraform

### 📚 Recursos de Aprendizado
- [Documentação Oficial Terraform](https://www.terraform.io/docs)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [HashiCorp Learn](https://learn.hashicorp.com/)

## 🤝 Comunidade e Suporte

### 💬 Discussões
- **GitHub Issues** para bugs e melhorias
- **GitHub Discussions** para perguntas gerais
- **Pull Requests** para contribuições

### 📞 Contato
- **LinkedIn**: [Seu LinkedIn]
- **GitHub**: [Seu GitHub]
- **Email**: [Seu Email]

### 🎉 Reconhecimento
- **Contribuidores** listados no README
- **Badges** para contribuições significativas
- **Mencionados** em releases

---

**💡 Dica**: Use este índice para navegar rapidamente pelos projetos. Cada projeto tem seu próprio README com instruções detalhadas!

**🚀 Boa jornada de aprendizado em Terraform!**
