# 🌐 AWS Static Website Profissional com Terraform

## 📋 Sobre o Projeto

Este projeto demonstra como criar um **website estático completo** na AWS utilizando Terraform com uma arquitetura profissional e bem estruturada. O website é hospedado no S3 com configurações avançadas de segurança, performance e manutenibilidade.

## 🏗️ Arquitetura

```
Internet
    ↓
S3 Bucket (Website Hosting)
├── index.html (Página principal)
├── error.html (Página de erro)
├── profile.png (Imagem do perfil)
├── Versioning (Histórico de versões)
├── Encryption (Criptografia AES256)
└── Lifecycle Rules (Otimização de custos)
```

## 📁 Estrutura do Projeto

```
aws-static-website/
├── required.tf              # Versões e providers
├── providers.tf             # Configuração do provider AWS
├── _locals.tf              # Variáveis locais e configurações
├── aws_s3.tf               # Recursos S3 (bucket, configurações)
├── aws_s3_objects.tf       # Objetos do website (HTML, imagens)
├── output.tf               # Outputs organizados
├── index.html              # Página principal do website
├── error.html              # Página de erro 404
├── profile.png             # Imagem do perfil
└── readme.md               # Documentação
```

## 🚀 Funcionalidades

### ✅ **S3 Bucket Configurado**
- **Website Hosting**: Configuração completa para hospedar website
- **Public Access**: Configurado para acesso público controlado
- **Ownership Controls**: Configurações de propriedade adequadas
- **ACL**: Configurado como public-read para conteúdo do website

### ✅ **Website Configuration**
- **Index Document**: index.html configurado como página principal
- **Error Document**: error.html configurado para páginas não encontradas
- **Dependencies**: Configurações aplicadas na ordem correta

### ✅ **Segurança Avançada**
- **Server-Side Encryption**: Criptografia AES256 habilitada
- **Versioning**: Histórico de versões dos arquivos
- **Lifecycle Rules**: Transições automáticas para otimizar custos
- **Public Access Control**: Configurações de acesso público seguras

### ✅ **Content Management**
- **HTML Files**: index.html e error.html configurados
- **Images**: profile.png com content-type correto
- **Tags**: Identificação clara de todos os objetos
- **ACL**: Permissões adequadas para cada tipo de arquivo

## 🔧 Configurações

### **Variáveis Locais**
- **Owner**: caio
- **Environment**: development
- **Region**: us-east-1
- **Tags Padrão**: owner, managed-by, environment, source-project, purpose

### **S3 Configuration**
- **Bucket Name**: unique-global-name (configurável)
- **Website**: Hosting habilitado
- **Index Document**: index.html
- **Error Document**: error.html

### **Security Configuration**
- **Encryption**: AES256 habilitado
- **Versioning**: Habilitado
- **Lifecycle**: Transições automáticas configuradas

### **Lifecycle Rules**
- **30 dias**: Transição para STANDARD_IA
- **90 dias**: Transição para GLACIER
- **365 dias**: Expiração automática

## 📊 Outputs Disponíveis

### **Website Endpoints**
- `website_endpoint` - Endpoint do website estático
- `website_domain` - Nome de domínio do website

### **S3 Bucket**
- `bucket_name` - Nome do bucket S3 criado
- `bucket_arn` - ARN do bucket S3 criado
- `bucket_region` - Região onde o bucket foi criado

### **Website Configuration**
- `index_document` - Documento de índice configurado
- `error_document` - Documento de erro configurado
- `website_files` - Arquivos configurados para o website

### **Security and Configuration**
- `encryption_algorithm` - Algoritmo de criptografia configurado
- `versioning_enabled` - Status do versioning
- `lifecycle_rules` - Regras de lifecycle configuradas

## 🚀 Como Executar

### **Pré-requisitos**
- **Terraform >= 1.6.2** instalado
- **AWS CLI** configurado
- **Conta AWS** ativa
- **Permissões adequadas** para criar buckets S3
- **Arquivos do website**: index.html, error.html, profile.png

### **Preparação dos Arquivos**
```bash
# Verificar se os arquivos existem
ls -la index.html error.html profile.png

# Se algum arquivo não existir, criar:
# index.html - Página principal
# error.html - Página de erro 404
# profile.png - Imagem do perfil
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

# Testar website
curl http://[website_endpoint]

# Destruir (quando terminar)
terraform destroy
```

## 💡 Melhorias Implementadas

1. **Estrutura Modular**: Separação clara entre arquivos por responsabilidade
2. **Variáveis Locais**: Configurações centralizadas e reutilizáveis
3. **Tags Padrão**: Sistema de tags consistente em todos os recursos
4. **Configurações Avançadas**: Encryption, versioning, lifecycle rules
5. **Segurança**: Public access controlado e criptografia habilitada
6. **Documentação**: README detalhado e organizado
7. **Outputs Organizados**: Informações estruturadas e descritivas

## 🔒 Considerações de Segurança

### **✅ Configurações de Segurança**
- **Public Access**: Controlado e configurado adequadamente
- **Encryption**: Server-side encryption AES256 habilitada
- **ACL**: Configurações de acesso apropriadas
- **Ownership**: Controles de propriedade configurados

### **⚠️ Avisos Importantes**
- **Bucket Name**: Deve ser globalmente único
- **Public Access**: Configurado para websites públicos
- **Content**: Verifique se o conteúdo é apropriado para acesso público
- **Costs**: Lifecycle rules podem afetar custos de storage

## 📈 Benefícios da Configuração

### **Performance**
- **S3 Website Hosting**: Performance otimizada para websites
- **CDN Ready**: Preparado para integração com CloudFront
- **Global Access**: Acesso de qualquer lugar do mundo

### **Custo-Otimização**
- **Lifecycle Rules**: Transições automáticas para storage mais barato
- **Versioning**: Controle de versões sem custo adicional
- **Storage Classes**: Otimização automática de custos

### **Manutenibilidade**
- **Infrastructure as Code**: Configuração versionada
- **Estrutura Modular**: Fácil manutenção e modificação
- **Tags Organizadas**: Recursos facilmente identificáveis

## 🔗 Próximos Passos

Após dominar este website estático básico, você pode expandir para:
- **CloudFront**: CDN para melhor performance global
- **Custom Domain**: Configurar domínio personalizado
- **HTTPS/SSL**: Certificados SSL para segurança
- **CI/CD Pipeline**: Deploy automático de conteúdo
- **Monitoring**: CloudWatch para métricas de acesso
- **Backup Strategy**: Estratégias de backup automático

---

**🎯 Este projeto demonstra as melhores práticas de estruturação Terraform para websites estáticos na AWS com foco em segurança, performance e manutenibilidade.**