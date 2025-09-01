# 📚 Projetos Terraform Profissionais - AWS

Esta seção contém projetos Terraform **profissionalmente estruturados**, ideais para quem quer aprender as melhores práticas de Infraestrutura como Código (IaC) na AWS.

## 🎯 Objetivo

Os projetos desta seção foram **completamente reformulados** para demonstrar as melhores práticas do Terraform, incluindo:
- **Estrutura modular** e organizada
- **Variáveis locais** centralizadas
- **Sistema de tags** consistente
- **Configurações avançadas** de segurança
- **Documentação profissional** e detalhada
- **Outputs organizados** e descritivos

## 🏗️ Arquitetura dos Projetos

Todos os projetos seguem a **mesma estrutura profissional**:

```
projeto/
├── required.tf          # Versões e providers
├── providers.tf         # Configuração do provider AWS
├── _locals.tf          # Variáveis locais e configurações
├── aws_[recurso].tf    # Recursos AWS específicos
├── output.tf           # Outputs organizados
└── readme.md           # Documentação detalhada
```

## 📁 Projetos Disponíveis

### 🏗️ **AWS VPC Avançada** (`/aws-vpc`)
**Descrição**: Criação de uma VPC completa com subnets públicas, Internet Gateway e Route Tables configuradas adequadamente.

**Conceitos Demonstrados**:
- ✅ **VPC Configurada**: DNS habilitado, CIDR organizado
- ✅ **Subnet Pública**: Auto-assign de IP, mapeamento automático
- ✅ **Internet Gateway**: Conectado e configurado
- ✅ **Route Tables**: Roteamento para internet configurado
- ✅ **Estrutura Modular**: Separação clara entre arquivos

**Arquitetura**:
```
VPC (10.0.0.0/16)
├── Subnet Pública (10.0.1.0/24) - us-east-1a
├── Internet Gateway
├── Route Table Pública
└── Route Table Association
```

**Tempo Estimado**: 20-25 minutos

---

### 🔒 **AWS Security Group + EC2 Avançado** (`/aws-sg-ec2`)
**Descrição**: Deploy de uma instância EC2 com security group configurado para SSH, incluindo configurações avançadas de storage e monitoramento.

**Conceitos Demonstrados**:
- ✅ **Security Groups**: Regras de ingress/egress bem documentadas
- ✅ **Key Pairs**: Autenticação SSH configurada
- ✅ **Instâncias EC2**: Monitoring, storage criptografado
- ✅ **Configurações Avançadas**: Volume root configurado
- ✅ **Estrutura Modular**: Separação clara entre arquivos

**Arquitetura**:
```
EC2 Instance (t2.micro)
├── Security Group (SSH:22)
├── Key Pair (SSH Authentication)
├── Root Volume (8GB GP2, Encrypted)
├── Monitoring (CloudWatch)
└── VPC Default
```

**Tempo Estimado**: 25-30 minutos

---

### 🗂️ **AWS S3 Bucket Avançado** (`/aws-bucket`)
**Descrição**: Criação e configuração de um bucket S3 com funcionalidades avançadas de segurança, versioning, criptografia e lifecycle management.

**Conceitos Demonstrados**:
- ✅ **Buckets S3**: Configuração completa e segura
- ✅ **Versioning**: Histórico de versões habilitado
- ✅ **Criptografia**: Server-Side Encryption AES256
- ✅ **Lifecycle Rules**: Transições automáticas otimizadas
- ✅ **Segurança**: Public access completamente bloqueado
- ✅ **Estrutura Modular**: Separação clara entre arquivos

**Arquitetura**:
```
S3 Bucket (bucketglobal-csv-nascimento)
├── Versioning (Habilitado)
├── Server-Side Encryption (AES256)
├── Public Access Block (Bloqueado)
├── Ownership Controls (BucketOwnerPreferred)
├── Lifecycle Rules (IA → Glacier → Expiration)
└── ACL (Private)
```

**Tempo Estimado**: 20-25 minutos

## 🚀 Como Começar

### Pré-requisitos
- **Terraform >= 1.6.2** instalado
- **AWS CLI** configurado
- **Conta AWS** ativa
- **Permissões adequadas** para os recursos

### Ordem Recomendada de Aprendizado
1. **AWS VPC Avançada** - Entenda os conceitos de rede estruturada
2. **AWS S3 Bucket Avançado** - Aprenda sobre storage seguro e otimizado
3. **AWS Security Group + EC2 Avançado** - Combine networking e computação

### Executando um Projeto
```bash
# Navegue para o projeto
cd terraform/simple-project/[nome-do-projeto]

# Inicialize
terraform init

# Planeje
terraform plan

# Execute
terraform apply

# Verifique outputs
terraform output

# Limpe (quando terminar)
terraform destroy
```

## 💡 Melhorias Implementadas

### 🔧 **Estrutura Profissional**
- **Separação de responsabilidades** por arquivo
- **Nomenclatura consistente** em todos os projetos
- **Organização lógica** dos recursos
- **Padrões de codificação** uniformes

### 📝 **Variáveis e Configurações**
- **Variáveis locais** centralizadas em `_locals.tf`
- **Configurações reutilizáveis** e fáceis de modificar
- **Sistema de tags** consistente em todos os recursos
- **Valores padrão** bem definidos

### 🔒 **Segurança e Boas Práticas**
- **Configurações de segurança** adequadas para cada recurso
- **Criptografia** habilitada onde aplicável
- **Acesso público** controlado e configurado
- **Permissões mínimas** necessárias

### 📊 **Outputs e Documentação**
- **Outputs organizados** com descrições claras
- **READMEs detalhados** para cada projeto
- **Exemplos de uso** e comandos
- **Próximos passos** para expansão

## 📖 Conceitos Fundamentais

### 🔧 **Providers e Versões**
- **AWS Provider ~> 5.38** para recursos AWS
- **Random Provider ~> 3.0** para strings únicas
- **Terraform >= 1.6.2** para funcionalidades modernas

### 📝 **Recursos AWS**
- **VPC e Networking**: Subnets, IGW, Route Tables
- **Compute**: EC2, Security Groups, Key Pairs
- **Storage**: S3 Buckets, Versioning, Lifecycle

### 🔍 **Data Sources**
- **AWS Caller Identity**: Informações da conta
- **AWS Region**: Região atual configurada

### 📤 **Outputs Estruturados**
- **Informações de recursos** organizadas
- **Descrições claras** para cada output
- **Valores úteis** para integração com outros sistemas

## 💡 Dicas para Aprendizado

1. **Comece pela VPC**: Entenda networking antes de computação
2. **Teste Incrementalmente**: Execute `terraform plan` frequentemente
3. **Modifique Variáveis**: Experimente alterar valores em `_locals.tf`
4. **Analise Outputs**: Use `terraform output` para entender recursos criados
5. **Documente Mudanças**: Mantenha comentários no código
6. **Teste Destruição**: Sempre teste `terraform destroy`

## 🔗 Próximos Passos

Após dominar estes projetos profissionais, você estará pronto para:
- **Projetos Intermediários**: Arquiteturas multi-tier
- **Módulos Terraform**: Reutilização de código entre projetos
- **Workspaces**: Gerenciamento de múltiplos ambientes
- **Backends**: Armazenamento remoto de estado
- **CI/CD Pipelines**: Deploy automatizado de infraestrutura

## 📚 Recursos Adicionais

- [Documentação Oficial Terraform](https://www.terraform.io/docs)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/index.html)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)

---

**🎉 Parabéns por escolher aprender Terraform com as melhores práticas! Cada projeto que você completar te aproximará de se tornar um especialista em IaC profissional.**

**🚀 Os projetos foram reformulados para refletir o que você encontrará em ambientes de produção reais.**
