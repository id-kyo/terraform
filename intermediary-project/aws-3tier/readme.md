# 🏗️ AWS 3-Tier Architecture Profissional usando Resources com Terraform

## 📋 Sobre o Projeto

Este projeto demonstra como criar uma **arquitetura 3-tier completa** na AWS utilizando Terraform com uma estrutura profissional e bem organizada. A infraestrutura inclui três camadas principais: Web, Aplicação e Banco de Dados, com recursos avançados como Load Balancer, Auto Scaling Groups e NAT Gateway.

## 🏗️ Arquitetura

```
Internet
    ↓
Application Load Balancer (ALB)
    ↓
Web Tier (Public Subnets)
├── EC2 Instances + Auto Scaling Group
├── Security Groups (HTTP/HTTPS/SSH)
└── Public Route Table (IGW)
    ↓
Application Tier (Private Subnets)
├── EC2 Instances + Auto Scaling Group
├── Security Groups (SSH only)
└── Private Route Table (NAT Gateway)
    ↓
Database Tier (Private Subnets)
├── RDS MySQL Instance
├── Security Groups (MySQL from App Tier)
└── Multi-AZ Deployment
```

## 📁 Estrutura do Projeto

```
aws-3tier/
├── required.tf              # Versões e providers
├── providers.tf             # Configuração do provider AWS
├── _locals.tf              # Variáveis locais e configurações
├── aws_vpc.tf              # VPC principal
├── aws_subnets.tf          # Subnets (Web, App, DB)
├── aws_igw.tf              # Internet Gateway
├── aws_nat_gateway.tf      # NAT Gateway para subnets privadas
├── aws_rt_route_public.tf  # Route Tables públicas
├── aws_rt_route_private.tf # Route Tables privadas
├── aws_sg_web.tf           # Security Groups do Web Tier
├── aws_sg_app.tf           # Security Groups do App Tier
├── aws_sg_db.tf            # Security Groups do DB Tier
├── aws_sg_alb.tf           # Security Groups do Load Balancer
├── aws_alb.tf              # Application Load Balancer
├── aws_ec2.tf              # Instâncias EC2
├── aws_asg.tf              # Auto Scaling Groups
├── aws_rds.tf              # Banco de dados RDS
├── output.tf               # Outputs organizados
├── install-apache.sh       # Script de instalação do Apache
└── readme.md               # Documentação
```

## 🚀 Funcionalidades

### ✅ **VPC e Networking**
- **VPC**: 10.0.0.0/16 com DNS habilitado
- **Subnets Públicas**: Web Tier em 2 AZs
- **Subnets Privadas**: App e DB Tiers em 2 AZs
- **Internet Gateway**: Para acesso à internet
- **NAT Gateway**: Para subnets privadas acessarem internet

### ✅ **Web Tier (Apresentação)**
- **Subnets Públicas**: 10.0.1.0/24 e 10.0.2.0/24
- **EC2 Instances**: Amazon Linux 2 com Apache
- **Auto Scaling Group**: Escalabilidade automática
- **Security Groups**: HTTP/HTTPS/SSH permitidos
- **Route Table**: Rota direta para internet

### ✅ **Application Tier (Lógica de Negócio)**
- **Subnets Privadas**: 10.0.3.0/24 e 10.0.4.0/24
- **EC2 Instances**: Amazon Linux 2
- **Auto Scaling Group**: Escalabilidade automática
- **Security Groups**: Apenas SSH permitido
- **Route Table**: Rota via NAT Gateway

### ✅ **Database Tier (Dados)**
- **Subnets Privadas**: 10.0.5.0/24 e 10.0.6.0/24
- **RDS MySQL**: Engine 5.7 com Multi-AZ
- **Security Groups**: MySQL apenas do App Tier
- **Route Table**: Rota via NAT Gateway

### ✅ **Load Balancer e Auto Scaling**
- **Application Load Balancer**: Distribuição de carga
- **Target Groups**: Health checks configurados
- **HTTP to HTTPS**: Redirecionamento automático
- **Auto Scaling**: Escalabilidade baseada em demanda

## 🔧 Configurações

### **Variáveis Locais**
- **Client Name**: caio
- **Environment**: development
- **Region**: us-east-1
- **Tags Padrão**: owner, managed-by, environment, source-project, architecture

### **Networking**
- **VPC CIDR**: 10.0.0.0/16
- **Web Subnets**: 10.0.1.0/24, 10.0.2.0/24
- **App Subnets**: 10.0.3.0/24, 10.0.4.0/24
- **DB Subnets**: 10.0.5.0/24, 10.0.6.0/24
- **AZs**: us-east-1a, us-east-1b

### **Compute**
- **Instance Type**: t2.micro
- **AMI**: Amazon Linux 2
- **Storage**: 8GB GP2 criptografado
- **Monitoring**: CloudWatch habilitado

### **Database**
- **Engine**: MySQL 5.7
- **Instance Class**: db.t2.micro
- **Storage**: 10GB GP2 criptografado
- **Multi-AZ**: Habilitado
- **Backup**: 7 dias de retenção

## 📊 Outputs Disponíveis

### **Load Balancer**
- `lb_dns_name` - DNS do ALB
- `lb_arn` - ARN do ALB
- `target_group_arn` - ARN do Target Group

### **VPC e Subnets**
- `vpc_id` - ID da VPC
- `vpc_cidr_block` - CIDR da VPC
- `public_web_subnet_1_id` - ID da subnet web 1
- `private_app_subnet_1_id` - ID da subnet app 1
- `private_db_subnet_1_id` - ID da subnet db 1

### **EC2 e Auto Scaling**
- `web_instance_id` - ID da instância web
- `web_instance_public_ip` - IP público da web
- `web_asg_id` - ID do ASG web
- `app_asg_id` - ID do ASG app

### **Database**
- `database_endpoint` - Endpoint do RDS
- `database_arn` - ARN do RDS
- `database_subnet_group_name` - Nome do grupo de subnets

### **Security Groups**
- `alb_security_group_id` - ID do SG do ALB
- `web_security_group_id` - ID do SG web
- `app_security_group_id` - ID do SG app
- `db_security_group_id` - ID do SG db

## 🚀 Como Executar

### **Pré-requisitos**
- **Terraform >= 1.6.2** instalado
- **AWS CLI** configurado
- **Conta AWS** ativa
- **Permissões adequadas** para todos os recursos
- **Key Pair**: `source_key` deve existir na AWS

### **Preparação**
```bash
# Verificar se o key pair existe
aws ec2 describe-key-pairs --key-names source_key

# Se não existir, criar:
aws ec2 create-key-pair --key-name source_key --query 'KeyMaterial' --output text > source_key.pem
chmod 400 source_key.pem
```

### **Comandos**
```bash
# Inicializar
terraform init

# Verificar plano
terraform plan

# Aplicar
terraform apply

# Verificar outputs
terraform output

# Testar acesso
curl http://[lb_dns_name]

# Destruir (quando terminar)
terraform destroy
```

## 💡 Melhorias Implementadas

1. **Estrutura Modular**: Separação clara entre arquivos por responsabilidade
2. **Variáveis Locais**: Configurações centralizadas e reutilizáveis
3. **Tags Padrão**: Sistema de tags consistente em todos os recursos
4. **Configurações Avançadas**: Monitoring, storage criptografado, health checks
5. **Segurança**: Security groups bem configurados por tier
6. **Documentação**: README detalhado e organizado
7. **Outputs Organizados**: Informações estruturadas e descritivas

## 🔒 Considerações de Segurança

### **✅ Configurações de Segurança**
- **Web Tier**: HTTP/HTTPS/SSH permitidos
- **App Tier**: Apenas SSH permitido
- **DB Tier**: MySQL apenas do App Tier
- **Storage**: Todos os volumes criptografados
- **RDS**: Storage criptografado e backup automático

### **⚠️ Avisos Importantes**
- **SSH de qualquer IP**: Configuração para desenvolvimento
- **Produção**: Restrinja SSH por IP específico
- **Senhas RDS**: Altere antes de produção
- **Key Pair**: Mantenha a chave privada segura

## 📈 Benefícios da Arquitetura

### **Alta Disponibilidade**
- **Multi-AZ**: Subnets em diferentes zonas
- **Auto Scaling**: Escalabilidade automática
- **Load Balancer**: Distribuição de carga

### **Segurança**
- **Tiers Isolados**: Separação clara de responsabilidades
- **Security Groups**: Controle granular de acesso
- **Subnets Privadas**: App e DB isolados da internet

### **Escalabilidade**
- **Auto Scaling Groups**: Escalabilidade automática
- **Load Balancer**: Distribuição inteligente de carga
- **Multi-AZ**: Redundância geográfica

## 🔗 Próximos Passos

Após dominar esta arquitetura 3-tier, você pode expandir para:
- **HTTPS/SSL**: Certificados SSL para o ALB
- **CloudWatch Alarms**: Monitoramento e alertas
- **S3 Buckets**: Storage para logs e arquivos
- **CloudFront**: CDN para conteúdo estático
- **Lambda Functions**: Serverless para lógica adicional
- **API Gateway**: APIs RESTful para o App Tier

---

**🎯 Este projeto demonstra as melhores práticas de estruturação Terraform para arquiteturas enterprise na AWS com foco em segurança, escalabilidade e alta disponibilidade.**