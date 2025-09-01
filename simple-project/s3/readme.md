# 🗂️ AWS S3 Bucket Avançado com Terraform

## 📋 Sobre o Projeto

Este projeto demonstra como criar um **bucket S3** completo na AWS utilizando Terraform com uma arquitetura profissional e bem estruturada. O bucket inclui configurações avançadas de segurança, versioning, criptografia e lifecycle management para armazenamento de dados CSV de nascimento.

## 🏗️ Arquitetura

```
S3 Bucket (bucketglobal-csv-nascimento)
├── Versioning (Habilitado)
├── Server-Side Encryption (AES256)
├── Public Access Block (Bloqueado)
├── Ownership Controls (BucketOwnerPreferred)
├── Lifecycle Rules (IA → Glacier → Expiration)
└── ACL (Private)
```

## 📁 Estrutura do Projeto

```
aws-bucket/
├── required.tf          # Versões e providers
├── providers.tf         # Configuração do provider AWS
├── _locals.tf          # Variáveis locais e configurações
├── aws_s3.tf           # Recursos S3 (bucket, versioning, encryption, etc.)
├── output.tf           # Outputs organizados
└── readme.md           # Documentação
```

## 🚀 Funcionalidades

### ✅ **Bucket S3 Configurado**
- **Nome**: bucketglobal-csv-nascimento
- **Região**: us-east-1
- **Tags**: Sistema de tags organizado e consistente
- **Propósito**: Armazenamento de dados CSV de nascimento

### ✅ **Versioning Habilitado**
- **Status**: Enabled
- **Benefícios**: Histórico de versões dos objetos
- **Recuperação**: Possibilidade de restaurar versões anteriores
- **Auditoria**: Rastreamento de mudanças nos arquivos

### ✅ **Segurança Avançada**
- **Criptografia**: Server-Side Encryption com AES256
- **Acesso Público**: Completamente bloqueado
- **ACL**: Configurado como privado
- **Ownership**: Controles de propriedade configurados

### ✅ **Lifecycle Management**
- **30 dias**: Transição para STANDARD_IA
- **90 dias**: Transição para GLACIER
- **365 dias**: Expiração automática
- **Otimização**: Redução de custos de storage

### ✅ **Configurações de Rede**
- **Public Access**: Bloqueado em todos os níveis
- **ACL**: Acesso controlado por usuário
- **Policy**: Sem políticas públicas

## 🔧 Configurações

### **Variáveis Locais**
- **Client Name**: caio
- **Environment**: development
- **Region**: us-east-1
- **Tags Padrão**: owner, managed-by, environment, source-project

### **S3 Configuration**
- **Bucket Name**: bucketglobal-csv-nascimento
- **Versioning**: Habilitado
- **Logging**: Desabilitado (configurável)
- **Encryption**: AES256

### **Lifecycle Rules**
- **STANDARD_IA**: 30 dias
- **GLACIER**: 90 dias
- **Expiration**: 365 dias

## 📊 Outputs Disponíveis

| Output | Descrição |
|--------|-----------|
| `bucket_name` | Nome do bucket S3 criado |
| `bucket_arn` | ARN do bucket S3 criado |
| `bucket_region` | Região onde o bucket S3 foi criado |
| `bucket_domain_name` | Nome de domínio do bucket S3 |
| `bucket_regional_domain_name` | Nome de domínio regional do bucket S3 |
| `versioning_enabled` | Status do versioning do bucket S3 |
| `encryption_algorithm` | Algoritmo de criptografia configurado |
| `lifecycle_rules` | Regras de lifecycle configuradas |

## 🚀 Como Executar

### **Pré-requisitos**
- Terraform >= 1.6.2
- AWS CLI configurado
- Conta AWS ativa
- Permissões para criar buckets S3

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

# Destruir (quando terminar)
terraform destroy
```

## 💡 Melhorias Implementadas

1. **Estrutura Modular**: Separação clara entre arquivos
2. **Variáveis Locais**: Configurações centralizadas e reutilizáveis
3. **Tags Padrão**: Sistema de tags consistente
4. **Configurações Avançadas**: Versioning, encryption, lifecycle
5. **Segurança**: Public access completamente bloqueado
6. **Documentação**: README detalhado e organizado
7. **Outputs Organizados**: Informações estruturadas e descritivas

## 🔒 Considerações de Segurança

### **✅ Configurações de Segurança**
- **Public Access**: Completamente bloqueado
- **Encryption**: Criptografia AES256 habilitada
- **ACL**: Acesso privado configurado
- **Ownership**: Controles de propriedade ativos

### **⚠️ Avisos Importantes**
- **Nome do Bucket**: Deve ser globalmente único
- **Região**: Configurada para us-east-1
- **Acesso**: Apenas via AWS CLI/SDK com credenciais válidas
- **Lifecycle**: Objetos serão movidos para storage classes mais baratas

## 📈 Benefícios da Configuração

### **Custo-Otimização**
- **STANDARD_IA**: 40% mais barato após 30 dias
- **GLACIER**: 90% mais barato após 90 dias
- **Expiração**: Limpeza automática de dados antigos

### **Conformidade**
- **Encryption**: Dados sempre criptografados
- **Versioning**: Histórico completo de mudanças
- **Auditoria**: Rastreamento de todas as operações

### **Performance**
- **AES256**: Criptografia rápida e segura
- **Region**: Otimizado para us-east-1
- **Storage Classes**: Transições automáticas otimizadas

## 🔗 Próximos Passos

Após dominar esta configuração básica, você pode expandir para:
- **S3 Replication**: Backup cross-region
- **CloudFront**: Distribuição de conteúdo
- **Lambda Triggers**: Processamento automático de arquivos
- **S3 Analytics**: Análise de uso e custos
- **Cross-Account Access**: Compartilhamento seguro entre contas
- **S3 Object Lock**: Proteção contra exclusão/aclteração

---

**🎯 Este projeto demonstra as melhores práticas de estruturação Terraform para storage na AWS com foco em segurança, custo-otimização e conformidade.**