# 🔒 AWS Security Group + EC2 Avançado com Terraform

## 📋 Sobre o Projeto

Este projeto demonstra como criar uma **instância EC2** completa na AWS com **Security Group** configurado para SSH, utilizando Terraform com uma arquitetura profissional e bem estruturada. Inclui configurações avançadas de storage, monitoramento e segurança.

## 🏗️ Arquitetura

```
EC2 Instance (t2.micro)
├── Security Group (SSH:22)
├── Key Pair (SSH Authentication)
├── Root Volume (8GB GP2, Encrypted)
├── Monitoring (CloudWatch)
└── VPC Default
```

## 📁 Estrutura do Projeto

```
aws-sg-ec2/
├── required.tf          # Versões e providers
├── providers.tf         # Configuração do provider AWS
├── _locals.tf          # Variáveis locais e configurações
├── aws_sg.tf           # Security Group e Key Pair
├── aws_ec2.tf          # Instância EC2
├── output.tf           # Outputs organizados
└── readme.md           # Documentação
```

## 🚀 Funcionalidades

### ✅ **Security Group Configurado**
- **SSH (Porta 22)**: Acesso permitido de qualquer IP
- **Egress**: Todo tráfego de saída permitido
- **Descrições**: Regras bem documentadas
- **Tags**: Identificação clara dos recursos

### ✅ **Key Pair SSH**
- **Nome**: ssh_key
- **Arquivo**: ./my-priv-key
- **Tags**: Identificação organizada
- **Segurança**: Autenticação SSH configurada

### ✅ **Instância EC2 Avançada**
- **AMI**: Amazon Linux 2 (ami-0c55b159cbfafe01e)
- **Tipo**: t2.micro (Free Tier)
- **Monitoring**: CloudWatch habilitado
- **Security Groups**: Associados via IDs
- **Tags**: Sistema de tags consistente

### ✅ **Storage Configurado**
- **Volume Root**: 8GB
- **Tipo**: GP2 (SSD)
- **Criptografia**: Habilitada
- **Tags**: Identificação do volume

## 🔧 Configurações

### **Variáveis Locais**
- **Client Name**: caio
- **Environment**: development
- **Region**: us-east-1
- **Tags Padrão**: owner, managed-by, environment, source-project

### **EC2 Configuration**
- **Instance Type**: t2.micro
- **AMI ID**: Amazon Linux 2
- **Monitoring**: Habilitado
- **Volume Size**: 8GB

### **Security Group Configuration**
- **SSH Port**: 22
- **SSH CIDR**: 0.0.0.0/0 (qualquer IP)
- **Egress**: Todo tráfego permitido

## 📊 Outputs Disponíveis

| Output | Descrição |
|--------|-----------|
| `instance_id` | ID da instância EC2 criada |
| `instance_arn` | ARN da instância EC2 |
| `public_ip` | IP público da instância EC2 |
| `private_ip` | IP privado da instância EC2 |
| `instance_state` | Estado atual da instância EC2 |
| `security_group_id` | ID do Security Group criado |
| `security_group_name` | Nome do Security Group |
| `key_pair_name` | Nome do Key Pair criado |
| `key_pair_id` | ID do Key Pair |

## 🚀 Como Executar

### **Pré-requisitos**
- Terraform >= 1.6.2
- AWS CLI configurado
- Conta AWS ativa
- **Arquivo de chave SSH**: `./my-priv-key`

### **Preparação da Chave SSH**
```bash
# Gerar chave SSH (se não tiver)
ssh-keygen -t rsa -b 2048 -f my-priv-key

# Verificar se o arquivo existe
ls -la my-priv-key*
```

### **Comandos**
```bash
# Inicializar
terraform init

# Verificar plano
terraform plan

# Aplicar
terraform apply

# Conectar via SSH (após criação)
ssh -i my-priv-key ec2-user@[PUBLIC_IP]

# Destruir (quando terminar)
terraform destroy
```

## 💡 Melhorias Implementadas

1. **Estrutura Modular**: Separação clara entre arquivos
2. **Variáveis Locais**: Configurações centralizadas e reutilizáveis
3. **Tags Padrão**: Sistema de tags consistente
4. **Configurações Avançadas**: Monitoring, storage criptografado
5. **Security Groups**: Uso de IDs em vez de nomes
6. **Documentação**: README detalhado e organizado
7. **Outputs Organizados**: Informações estruturadas e descritivas

## 🔒 Considerações de Segurança

### **⚠️ Avisos Importantes**
- **SSH de qualquer IP**: Configuração para desenvolvimento
- **Produção**: Restrinja CIDR blocks para IPs específicos
- **Chave SSH**: Mantenha a chave privada segura
- **Security Groups**: Revise regras antes de produção

### **Recomendações para Produção**
- Limite acesso SSH por IP específico
- Use bastion hosts para acesso
- Implemente logs de auditoria
- Configure alertas de segurança

## 🔗 Próximos Passos

Após dominar esta configuração básica, você pode expandir para:
- **Múltiplas Instâncias** com Auto Scaling
- **Load Balancers** para distribuição de carga
- **RDS Databases** para persistência de dados
- **CloudWatch Alarms** para monitoramento
- **Backup Strategies** com snapshots automáticos
- **CI/CD Pipelines** para deploy automatizado

---

**🎯 Este projeto demonstra as melhores práticas de estruturação Terraform para computação na AWS com foco em segurança e monitoramento.**