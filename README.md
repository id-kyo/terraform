# 🚀 Portfólio Terraform - Infraestrutura como Código

[![Terraform](https://img.shields.io/badge/Terraform-1.0+-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)](https://aws.amazon.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue.svg?style=for-the-badge)](https://github.com/[seu-usuario]/terraform-portfolio/releases)

[![Simple Projects](https://img.shields.io/badge/Simple%20Projects-3%20Projects-brightgreen?style=for-the-badge)](simple-project/)
[![Intermediate Projects](https://img.shields.io/badge/Intermediate%20Projects-4%20Projects-orange?style=for-the-badge)](intermediary-project/)
[![Complex Projects](https://img.shields.io/badge/Complex%20Projects-5%20Modules-red?style=for-the-badge)](complex-project/)

Bem-vindo ao meu portfólio de projetos Terraform! Este repositório demonstra minha jornada de aprendizado e habilidades em Infraestrutura como Código (IaC) usando Terraform na AWS.

## 🎯 Sobre o Projeto

Este portfólio foi desenvolvido para demonstrar diferentes níveis de complexidade em projetos Terraform, desde configurações básicas até arquiteturas empresariais avançadas. Cada projeto inclui documentação detalhada, exemplos práticos e boas práticas de IaC.

## 🏗️ Estrutura do Repositório

### 📚 **Projetos Simples** (`/simple-project`)
Projetos introdutórios para quem está começando com Terraform:
- **AWS VPC Básica** - Criação de VPC, subnets e internet gateway
- **AWS Security Group + EC2** - Configuração de grupos de segurança e instâncias
- **AWS S3 Bucket** - Criação e configuração de buckets S3

### 🔧 **Projetos Intermediários** (`/intermediary-project`)
Projetos de complexidade média com funcionalidades avançadas:
- **Arquitetura 3-Tier** - VPC completa com camadas web, aplicação e banco de dados
- **Load Balancer + Auto Scaling** - Configuração de ALB e grupos de auto-scaling
- **Website Estático S3** - Deploy de site estático com CloudFront
- **VPC + VM** - Integração entre VPC e instâncias EC2

### 🚀 **Projetos Complexos** (`/complex-project`)
Projetos empresariais com módulos reutilizáveis e arquiteturas avançadas:
- **Módulos EC2** - Módulos Terraform para instâncias EC2 com diferentes configurações
- **Módulos IAM** - Gerenciamento avançado de usuários, roles e políticas
- **Módulos RDS** - Bancos de dados PostgreSQL com alta disponibilidade
- **Módulos VPC** - Arquiteturas de rede escaláveis e seguras
- **Módulos de Preços** - Cálculo de custos de infraestrutura AWS

## 🛠️ Tecnologias Utilizadas

- **Terraform** >= 1.0
- **AWS Provider** >= 4.0
- **Módulos Terraform AWS** (oficiais e customizados)
- **HCL** (HashiCorp Configuration Language)
- **Git** para controle de versão

## 🚀 Como Utilizar

### Pré-requisitos
- Terraform instalado (versão >= 1.0)
- AWS CLI configurado
- Acesso a uma conta AWS

### Executando um Projeto
```bash
# Navegue para o projeto desejado
cd terraform/[categoria]/[nome-do-projeto]

# Inicialize o Terraform
terraform init

# Visualize o plano de execução
terraform plan

# Aplique as mudanças
terraform apply

# Para destruir a infraestrutura
terraform destroy
```

## 📖 Aprendizados e Boas Práticas

### ✅ Implementados
- **Modularização** - Uso de módulos Terraform para reutilização
- **Separação de Ambientes** - Estrutura clara para diferentes níveis de complexidade
- **Documentação** - READMEs detalhados para cada projeto
- **Versionamento** - Controle de versões com Git
- **Segurança** - Configurações de segurança groups e IAM
- **Escalabilidade** - Arquiteturas que suportam crescimento

### 🔒 Segurança
- Uso de variáveis para dados sensíveis
- Configuração adequada de security groups
- Políticas IAM com princípio do menor privilégio
- Criptografia de dados em trânsito e em repouso

## 📊 Métricas do Projeto

- **Total de Projetos**: 15+
- **Categorias**: 3 (Simples, Intermediário, Complexo)
- **Serviços AWS Cobertos**: 10+
- **Módulos Terraform**: 8+

## 🏆 Qualidade e Status

[![Documentation](https://img.shields.io/badge/Documentation-Complete-brightgreen?style=for-the-badge)](README.md)
[![Examples](https://img.shields.io/badge/Examples-15%2B-blue?style=for-the-badge)](simple-project/)
[![Beginner Friendly](https://img.shields.io/badge/Beginner%20Friendly-Yes-brightgreen?style=for-the-badge)](simple-project/)
[![Intermediate Level](https://img.shields.io/badge/Intermediate%20Level-Yes-orange?style=for-the-badge)](intermediary-project/)
[![Advanced Level](https://img.shields.io/badge/Advanced%20Level-Yes-red?style=for-the-badge)](complex-project/)
[![Contributions Welcome](https://img.shields.io/badge/Contributions-Welcome-brightgreen?style=for-the-badge)](CONTRIBUTING.md)

## 🤝 Contribuições

Contribuições são bem-vindas! Se você tem sugestões de melhorias, novos projetos ou correções, sinta-se à vontade para:

1. Fazer um fork do repositório
2. Criar uma branch para sua feature
3. Fazer commit das mudanças
4. Abrir um Pull Request

## 📞 Contato

- **LinkedIn**: [Seu LinkedIn]
- **GitHub**: [Seu GitHub]
- **Email**: [Seu Email]

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

⭐ **Se este projeto foi útil para você, considere dar uma estrela!** ⭐
