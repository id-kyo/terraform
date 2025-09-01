# 🤝 Guia de Contribuição

Obrigado por considerar contribuir para o Portfólio Terraform! Este documento fornece diretrizes para contribuições.

## 🎯 Como Contribuir

### 📋 Tipos de Contribuições

- **🐛 Reportar Bugs**: Encontrou um problema? Abra uma issue!
- **💡 Sugerir Melhorias**: Tem uma ideia para melhorar o projeto?
- **📚 Melhorar Documentação**: Achou algo confuso? Ajude a esclarecer!
- **🔧 Adicionar Novos Projetos**: Criou um projeto interessante? Compartilhe!
- **🧪 Testes**: Testou um projeto? Reporte os resultados!

### 🚀 Processo de Contribuição

1. **Fork o Repositório**
   ```bash
   git clone https://github.com/[seu-usuario]/terraform-portfolio.git
   cd terraform-portfolio
   ```

2. **Crie uma Branch**
   ```bash
   git checkout -b feature/nova-funcionalidade
   # ou
   git checkout -b fix/correcao-bug
   ```

3. **Faça suas Alterações**
   - Mantenha o código limpo e bem documentado
   - Siga as convenções de nomenclatura existentes
   - Teste suas alterações localmente

4. **Commit suas Alterações**
   ```bash
   git add .
   git commit -m "feat: adiciona novo projeto de exemplo"
   ```

5. **Push para sua Branch**
   ```bash
   git push origin feature/nova-funcionalidade
   ```

6. **Abra um Pull Request**
   - Use o template de PR fornecido
   - Descreva claramente suas alterações
   - Referencie issues relacionadas

## 📝 Padrões de Código

### 🏗️ Estrutura de Projetos

Cada projeto deve seguir esta estrutura:
```
nome-do-projeto/
├── README.md          # Documentação do projeto
├── main.tf            # Configuração principal
├── variables.tf       # Variáveis de entrada
├── outputs.tf         # Outputs do projeto
├── versions.tf        # Versões do Terraform e providers
├── .gitignore         # Arquivos a serem ignorados
└── [outros-arquivos]  # Arquivos específicos do projeto
```

### 📚 Documentação

- **README.md**: Deve incluir:
  - Descrição clara do projeto
  - Pré-requisitos
  - Instruções de uso
  - Exemplos de execução
  - Arquitetura (se aplicável)

### 🏷️ Nomenclatura

- **Recursos**: Use snake_case (ex: `aws_vpc`, `aws_subnet`)
- **Variáveis**: Use snake_case (ex: `vpc_cidr`, `instance_type`)
- **Arquivos**: Use snake_case (ex: `main.tf`, `variables.tf`)
- **Diretórios**: Use kebab-case (ex: `aws-vpc-module`)

### 🔒 Segurança

- **Nunca** commite credenciais ou chaves privadas
- Use variáveis para dados sensíveis
- Configure security groups com o princípio do menor privilégio
- Documente considerações de segurança

## 🧪 Testando

### ✅ Checklist de Testes

Antes de submeter um PR, certifique-se de:

- [ ] O projeto executa sem erros (`terraform init`, `terraform plan`, `terraform apply`)
- [ ] A infraestrutura é criada corretamente na AWS
- [ ] O projeto pode ser destruído sem problemas (`terraform destroy`)
- [ ] A documentação está atualizada e clara
- [ ] O código segue as convenções estabelecidas

### 🐳 Testando com Docker

Se disponível, use o ambiente Docker fornecido:
```bash
# Usando Devbox
devbox shell
terraform init
terraform plan
```

## 📋 Templates

### 🐛 Reportar Bug

```markdown
## Descrição do Bug
[Descreva o bug de forma clara e concisa]

## Passos para Reproduzir
1. Vá para '...'
2. Clique em '...'
3. Role para baixo até '...'
4. Veja o erro

## Comportamento Esperado
[Descreva o que deveria acontecer]

## Comportamento Atual
[Descreva o que está acontecendo]

## Ambiente
- OS: [ex: Ubuntu 20.04]
- Terraform: [ex: 1.5.0]
- AWS Provider: [ex: 5.0.0]

## Informações Adicionais
[Qualquer outra informação relevante]
```

### 💡 Sugerir Melhoria

```markdown
## Descrição da Sugestão
[Descreva a melhoria de forma clara e concisa]

## Problema que Resolve
[Explique qual problema esta sugestão resolve]

## Solução Proposta
[Descreva a solução proposta]

## Alternativas Consideradas
[Liste alternativas que você considerou]

## Informações Adicionais
[Qualquer outra informação relevante]
```

## 🏷️ Labels e Milestones

### Labels Disponíveis

- `bug` - Problemas que precisam ser corrigidos
- `enhancement` - Novas funcionalidades ou melhorias
- `documentation` - Melhorias na documentação
- `good first issue` - Boas para iniciantes
- `help wanted` - Precisa de ajuda
- `question` - Perguntas sobre o projeto

### Milestones

- `v1.0.0` - Primeira versão estável
- `v1.1.0` - Melhorias e correções
- `v2.0.0` - Nova versão principal

## 📞 Comunicação

### 💬 Discussões

- Use o GitHub Discussions para perguntas gerais
- Mantenha as discussões construtivas e respeitosas
- Procure nas discussões existentes antes de criar uma nova

### 🐛 Issues

- Use o template apropriado para issues
- Forneça informações suficientes para reproduzir o problema
- Responda a comentários e atualizações

## 🎉 Reconhecimento

Contribuições serão reconhecidas de várias formas:

- **Contribuidores** listados no README principal
- **Mencionados** em releases
- **Badges** para contribuições significativas
- **Agradecimentos** especiais para contribuições excepcionais

## 📄 Licença

Ao contribuir, você concorda que suas contribuições serão licenciadas sob a mesma licença do projeto (MIT).

---

**Obrigado por contribuir para o Portfólio Terraform! 🚀**

Se você tiver dúvidas sobre este guia, abra uma issue ou entre em contato conosco.
