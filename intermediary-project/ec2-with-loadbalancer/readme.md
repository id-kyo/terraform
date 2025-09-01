# ⚖️ AWS Load Balancer + Auto Scaling Profissional com Terraform

## 📋 Sobre o Projeto

Este projeto demonstra como criar uma **infraestrutura completa de Load Balancer e Auto Scaling** na AWS utilizando Terraform com uma arquitetura profissional e bem estruturada. A solução inclui VPC, subnets, Application Load Balancer, Launch Configuration e Auto Scaling Group para alta disponibilidade e escalabilidade.

## 🏗️ Arquitetura

```
Internet
    ↓
Application Load Balancer (ALB)
    ↓
Target Group
    ↓
Auto Scaling Group
    ↓
EC2 Instances (2-4 instâncias)
├── Subnet 1 (us-east-1a)
└── Subnet 2 (us-east-1b)
```

## 📁 Estrutura do Projeto

```
aws-lb-as/
├── required.tf              # Versões e providers
├── providers.tf             # Configuração do provider AWS
├── _locals.tf              # Variáveis locais e configurações
├── aws_vpc.tf              # VPC, subnets, IGW e route tables
├── aws_security_groups.tf  # Security groups para LB e EC2
├── aws_load_balancer.tf    # Application Load Balancer
├── aws_auto_scaling.tf     # Launch Configuration e Auto Scaling Group
├── output.tf               # Outputs organizados
└── readme.md               # Documentação
```

## 🚀 Funcionalidades

### ✅ **VPC e Networking**
- **VPC**: 10.0.0.0/16 com DNS habilitado
- **Subnets Públicas**: 2 subnets em diferentes AZs
- **Internet Gateway**: Para acesso à internet
- **Route Tables**: Roteamento automático para internet

### ✅ **Application Load Balancer**
- **Tipo**: Application Load Balancer (Layer 7)
- **Protocolo**: HTTP na porta 80
- **Health Checks**: Configurados para verificar instâncias
- **Target Group**: Configurado para receber tráfego

### ✅ **Auto Scaling Group**
- **Capacidade**: 2 instâncias desejadas
- **Escalabilidade**: 1-4 instâncias
- **Health Check**: Integrado com ELB
- **Multi-AZ**: Instâncias distribuídas em 2 zonas

### ✅ **Launch Configuration**
- **AMI**: Amazon Linux 2
- **Instance Type**: t2.micro
- **Storage**: 8GB GP2 criptografado
- **Security Groups**: Configurados adequadamente

### ✅ **Security Groups**
- **Load Balancer**: HTTP/HTTPS de qualquer IP
- **EC2 Instances**: HTTP do LB + SSH de qualquer IP
- **Egress**: Todo tráfego de saída permitido

## 🔧 Configurações

### **Variáveis Locais**
- **Client Name**: caio
- **Environment**: development
- **Region**: us-east-1
- **Tags Padrão**: owner, managed-by, environment, source-project

### **Networking**
- **VPC CIDR**: 10.0.0.0/16
- **Subnet 1**: 10.0.1.0/24 (us-east-1a)
- **Subnet 2**: 10.0.2.0/24 (us-east-1b)

### **Auto Scaling**
- **Desired Capacity**: 2 instâncias
- **Min Size**: 1 instância
- **Max Size**: 4 instâncias
- **Health Check Grace Period**: 300 segundos

### **Load Balancer**
- **Type**: Application Load Balancer
- **Internal**: false (público)
- **Deletion Protection**: false
- **Health Check Path**: /

## 📊 Outputs Disponíveis

### **Load Balancer**
- `load_balancer_dns_name` - DNS do ALB
- `load_balancer_arn` - ARN do ALB
- `target_group_arn` - ARN do Target Group

### **VPC e Subnets**
- `vpc_id` - ID da VPC
- `vpc_cidr_block` - CIDR da VPC
- `subnet_1_id` - ID da primeira subnet
- `subnet_2_id` - ID da segunda subnet

### **Auto Scaling**
- `auto_scaling_group_id` - ID do Auto Scaling Group
- `auto_scaling_group_name` - Nome do ASG
- `launch_configuration_name` - Nome da Launch Configuration

### **Security Groups**
- `load_balancer_security_group_id` - ID do SG do LB
- `ec2_security_group_id` - ID do SG das instâncias

### **Configuração**
- `asg_desired_capacity` - Capacidade desejada
- `asg_max_size` - Tamanho máximo
- `asg_min_size` - Tamanho mínimo

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
curl http://[load_balancer_dns_name]

# Destruir (quando terminar)
terraform destroy
```

## 💡 Melhorias Implementadas

1. **Estrutura Modular**: Separação clara entre arquivos por responsabilidade
2. **Variáveis Locais**: Configurações centralizadas e reutilizáveis
3. **Tags Padrão**: Sistema de tags consistente em todos os recursos
4. **Configurações Avançadas**: Health checks, monitoring, storage criptografado
5. **Segurança**: Security groups bem configurados e isolados
6. **Documentação**: README detalhado e organizado
7. **Outputs Organizados**: Informações estruturadas e descritivas

## 🔒 Considerações de Segurança

### **✅ Configurações de Segurança**
- **Load Balancer**: HTTP/HTTPS de qualquer IP
- **EC2 Instances**: HTTP apenas do Load Balancer
- **SSH**: Acesso de qualquer IP (configurável)
- **Storage**: Volumes criptografados
- **Security Groups**: Isolamento adequado entre recursos

### **⚠️ Avisos Importantes**
- **SSH de qualquer IP**: Configuração para desenvolvimento
- **Produção**: Restrinja SSH por IP específico
- **Key Pair**: Mantenha a chave privada segura
- **Health Checks**: Configure adequadamente para sua aplicação

## 📈 Benefícios da Arquitetura

### **Alta Disponibilidade**
- **Multi-AZ**: Instâncias em diferentes zonas
- **Load Balancer**: Distribuição de carga
- **Health Checks**: Detecção automática de falhas

### **Escalabilidade**
- **Auto Scaling**: Escalabilidade automática baseada em demanda
- **Launch Configuration**: Padrão consistente para novas instâncias
- **Target Group**: Integração automática com Load Balancer

### **Manutenibilidade**
- **Infrastructure as Code**: Configuração versionada
- **Estrutura Modular**: Fácil manutenção e modificação
- **Tags Organizadas**: Recursos facilmente identificáveis

## 🔗 Próximos Passos

Após dominar esta arquitetura básica, você pode expandir para:
- **HTTPS/SSL**: Certificados SSL para o Load Balancer
- **CloudWatch Alarms**: Monitoramento e alertas automáticos
- **Scaling Policies**: Políticas de escalabilidade baseadas em métricas
- **S3 Buckets**: Storage para logs e arquivos
- **CloudFront**: CDN para conteúdo estático
- **RDS**: Banco de dados para persistência

---

**🎯 Este projeto demonstra as melhores práticas de estruturação Terraform para Load Balancer e Auto Scaling na AWS com foco em alta disponibilidade, escalabilidade e manutenibilidade.**