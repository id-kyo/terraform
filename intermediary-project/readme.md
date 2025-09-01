# 🚀 Projetos Terraform Intermediários - AWS

Esta seção contém projetos Terraform **intermediários e avançados**, ideais para quem já domina os conceitos básicos e quer aprender arquiteturas mais complexas na AWS.

## 🎯 Objetivo

Os projetos desta seção foram **completamente reformulados** para demonstrar as melhores práticas do Terraform em cenários intermediários e avançados, incluindo:
- **Arquiteturas multi-tier** e complexas
- **Load Balancers** e Auto Scaling Groups
- **VPCs avançadas** com múltiplas subnets
- **Integração entre serviços** AWS
- **Padrões enterprise** de infraestrutura
- **Estrutura profissional** e modular

## 🏗️ Arquitetura dos Projetos

Todos os projetos seguem a **mesma estrutura profissional**:

```
projeto/
├── required.tf              # Versões e providers
├── providers.tf             # Configuração do provider AWS
├── _locals.tf              # Variáveis locais e configurações
├── aws_[recurso].tf        # Recursos AWS específicos
├── output.tf               # Outputs organizados
└── readme.md               # Documentação detalhada
```

## 📁 Projetos Disponíveis

### 🏗️ **AWS 3-Tier Architecture** (`/aws-3tier`)
**Descrição**: Arquitetura 3-tier completa com Web, Application e Database tiers, incluindo Load Balancer, Auto Scaling Groups e RDS.

**Conceitos Demonstrados**:
- ✅ **VPC Avançada**: 6 subnets em 2 AZs (Web, App, DB)
- ✅ **Load Balancer**: Application Load Balancer com health checks
- ✅ **Auto Scaling**: Launch Templates e Auto Scaling Groups
- ✅ **Security Groups**: Isolamento por tier com regras específicas
- ✅ **NAT Gateway**: Para subnets privadas acessarem internet
- ✅ **RDS MySQL**: Multi-AZ com backup e criptografia
- ✅ **Estrutura Modular**: Separação clara entre arquivos

**Arquitetura**:
```
Internet → ALB → Web Tier (Public) → App Tier (Private) → DB Tier (Private)
    ↓           ↓                    ↓                    ↓
  Security   Subnets              Subnets              Subnets
  Groups     (2 AZs)             (2 AZs)              (2 AZs)
```

**Tempo Estimado**: 45-60 minutos

---

### ⚖️ **AWS Load Balancer + Auto Scaling** (`/aws-lb-as`)
**Descrição**: Infraestrutura completa de Load Balancer e Auto Scaling com VPC dedicada e configurações avançadas.

**Conceitos Demonstrados**:
- ✅ **VPC Completa**: Subnets, IGW, Route Tables
- ✅ **Application Load Balancer**: Health checks e target groups
- ✅ **Launch Configuration**: Padrão para instâncias
- ✅ **Auto Scaling Group**: Escalabilidade 1-4 instâncias
- ✅ **Security Groups**: Isolamento entre LB e EC2
- ✅ **Multi-AZ**: Distribuição em 2 zonas de disponibilidade
- ✅ **Estrutura Modular**: Separação clara entre arquivos

**Arquitetura**:
```
Internet → ALB → Target Group → Auto Scaling Group → EC2 Instances
    ↓         ↓         ↓              ↓              ↓
  Security  Health   Security      Launch        Security
  Groups    Checks   Groups      Configuration   Groups
```

**Tempo Estimado**: 30-40 minutos

---

### 🌐 **AWS Static Website** (`/aws-static-website`)
**Descrição**: Website estático hospedado no S3 com configurações avançadas de segurança e performance.

**Conceitos Demonstrados**:
- ✅ **S3 Bucket**: Website hosting configurado
- ✅ **Security**: Public access controlado
- ✅ **Content**: HTML, CSS e imagens
- ✅ **Performance**: Otimizações para websites
- ✅ **Estrutura Modular**: Separação clara entre arquivos

**Tempo Estimado**: 20-25 minutos

---

### 🔗 **AWS VPC with VM** (`/aws-vpc-with-vm`)
**Descrição**: VPC configurada com instância EC2 e integração entre projetos Terraform.

**Conceitos Demonstrados**:
- ✅ **VPC Integration**: Uso de outputs de outros projetos
- ✅ **EC2 Instance**: Configuração avançada
- ✅ **Remote State**: Referência entre projetos
- ✅ **Estrutura Modular**: Separação clara entre arquivos

**Tempo Estimado**: 25-30 minutos

## 🚀 Como Começar

### Pré-requisitos
- **Terraform >= 1.6.2** instalado
- **AWS CLI** configurado
- **Conta AWS** ativa
- **Permissões adequadas** para todos os recursos
- **Experiência básica** com Terraform (recomendado)

### Ordem Recomendada de Aprendizado
1. **AWS Load Balancer + Auto Scaling** - Entenda Load Balancers e Auto Scaling
2. **AWS 3-Tier Architecture** - Aprenda arquiteturas complexas
3. **AWS Static Website** - Explore S3 para websites
4. **AWS VPC with VM** - Entenda integração entre projetos

### Executando um Projeto
```bash
# Navegue para o projeto
cd terraform/intermediary-project/[nome-do-projeto]

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
- **Security Groups** bem configurados e isolados
- **Acesso controlado** entre diferentes tiers
- **Permissões mínimas** necessárias

### 📊 **Outputs e Documentação**
- **Outputs organizados** com descrições claras
- **READMEs detalhados** para cada projeto
- **Exemplos de uso** e comandos
- **Próximos passos** para expansão

## 📖 Conceitos Intermediários

### 🔧 **Providers e Versões**
- **AWS Provider ~> 5.38** para recursos AWS
- **Terraform >= 1.6.2** para funcionalidades modernas
- **Configurações avançadas** de providers

### 📝 **Recursos AWS Avançados**
- **VPC e Networking**: Subnets múltiplas, NAT Gateway, Route Tables
- **Compute**: Launch Templates, Auto Scaling Groups, Load Balancers
- **Storage**: S3 Website Hosting, EBS criptografado
- **Database**: RDS Multi-AZ, Backup automático

### 🔍 **Data Sources e Integração**
- **Remote State**: Referência entre projetos Terraform
- **Outputs**: Compartilhamento de informações entre módulos
- **Dependencies**: Gerenciamento de dependências entre recursos

### 📤 **Outputs Estruturados**
- **Informações de recursos** organizadas por categoria
- **Descrições claras** para cada output
- **Valores úteis** para integração com outros sistemas

## 💡 Dicas para Aprendizado Intermediário

1. **Comece pelo Load Balancer**: Entenda distribuição de carga
2. **Teste Incrementalmente**: Execute `terraform plan` frequentemente
3. **Modifique Variáveis**: Experimente alterar valores em `_locals.tf`
4. **Analise Outputs**: Use `terraform output` para entender recursos criados
5. **Documente Mudanças**: Mantenha comentários no código
6. **Teste Destruição**: Sempre teste `terraform destroy`
7. **Monitore Recursos**: Use AWS Console para verificar recursos criados

## 🔗 Próximos Passos

Após dominar estes projetos intermediários, você estará pronto para:
- **Projetos Avançados**: Arquiteturas serverless e microservices
- **Módulos Terraform**: Reutilização de código entre projetos
- **Workspaces**: Gerenciamento de múltiplos ambientes
- **Backends**: Armazenamento remoto de estado
- **CI/CD Pipelines**: Deploy automatizado de infraestrutura
- **Terraform Cloud**: Gerenciamento empresarial de Terraform

## 📚 Recursos Adicionais

- [Documentação Oficial Terraform](https://www.terraform.io/docs)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/index.html)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)
- [Terraform Modules Registry](https://registry.terraform.io/browse/modules)

---

**🎉 Parabéns por avançar para projetos intermediários! Cada projeto que você completar te aproximará de se tornar um especialista em IaC enterprise.**

**🚀 Os projetos foram reformulados para refletir o que você encontrará em ambientes de produção reais com arquiteturas complexas e profissionais.**