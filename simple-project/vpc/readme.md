# 🏗️ AWS VPC Avançada com Terraform

## 📋 Sobre o Projeto

Este projeto demonstra como criar uma **Virtual Private Cloud (VPC)** completa na AWS utilizando Terraform com uma arquitetura profissional e bem estruturada. A VPC inclui subnets públicas, Internet Gateway e Route Tables configuradas adequadamente.

## 🏗️ Arquitetura

```
VPC (10.0.0.0/16)
├── Subnet Pública (10.0.1.0/24) - us-east-1a
├── Internet Gateway
├── Route Table Pública
└── Route Table Association
```

## 📁 Estrutura do Projeto

```
aws-vpc/
├── required.tf          # Versões e providers
├── providers.tf         # Configuração do provider AWS
├── _locals.tf          # Variáveis locais e configurações
├── aws_vpc.tf          # Recurso VPC
├── aws_subnet.tf       # Recurso Subnet
├── aws_igw.tf          # Recurso Internet Gateway
├── aws_route_table.tf  # Recurso Route Table e Association
├── output.tf           # Outputs organizados
└── readme.md           # Documentação
```

## 🚀 Funcionalidades

### ✅ **VPC Configurada**
- CIDR Block: 10.0.0.0/16
- DNS Hostnames habilitado
- DNS Support habilitado
- Tags organizadas e padronizadas

### ✅ **Subnet Pública**
- CIDR Block: 10.0.1.0/24
- Zona de disponibilidade: us-east-1a
- Auto-assign de IP público habilitado
- Mapeamento automático de IP público

### ✅ **Internet Gateway**
- Conectado à VPC
- Permite acesso à internet
- Configuração de roteamento

### ✅ **Route Table**
- Rota padrão para internet (0.0.0.0/0)
- Associada à subnet pública
- Configuração de gateway

## 🔧 Configurações

### **Variáveis Locais**
- **Client Name**: caio
- **Environment**: development
- **Region**: us-east-1
- **Tags Padrão**: owner, managed-by, environment, source-project

### **Networking**
- **VPC CIDR**: 10.0.0.0/16
- **Subnet CIDR**: 10.0.1.0/24
- **Availability Zone**: us-east-1a

## 📊 Outputs Disponíveis

| Output | Descrição |
|--------|-----------|
| `vpc_id` | ID da VPC criada |
| `vpc_cidr_block` | CIDR block da VPC |
| `subnet_id` | ID da subnet criada |
| `subnet_cidr_block` | CIDR block da subnet |
| `internet_gateway_id` | ID do Internet Gateway |
| `route_table_id` | ID da Route Table |
| `route_table_association_id` | ID da associação |

## 🚀 Como Executar

### **Pré-requisitos**
- Terraform >= 1.6.2
- AWS CLI configurado
- Conta AWS ativa

### **Comandos**
```bash
# Inicializar
terraform init

# Verificar plano
terraform plan

# Aplicar
terraform apply

# Destruir (quando terminar)
terraform destroy
```

## 💡 Melhorias Implementadas

1. **Estrutura Modular**: Separação clara entre arquivos
2. **Variáveis Locais**: Configurações centralizadas e reutilizáveis
3. **Tags Padrão**: Sistema de tags consistente
4. **Documentação**: README detalhado e organizado
5. **Outputs Organizados**: Informações estruturadas e descritivas
6. **Configurações Avançadas**: DNS habilitado, auto-assign de IP

## 🔗 Próximos Passos

Após dominar esta VPC básica, você pode expandir para:
- **Subnets Privadas** com NAT Gateway
- **Múltiplas AZs** para alta disponibilidade
- **VPC Endpoints** para serviços AWS
- **Network ACLs** para controle de tráfego adicional
- **VPC Peering** para conectar múltiplas VPCs

---

**🎯 Este projeto demonstra as melhores práticas de estruturação Terraform para infraestrutura de rede na AWS.**