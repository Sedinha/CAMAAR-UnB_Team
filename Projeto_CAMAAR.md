# Projeto CAMAAR

## Introdução
O sistema CAMAAR (Sistema para Avaliação de Atividades Acadêmicas Remotas do CIC - Ciência da Computação) foi desenvolvido com o objetivo de facilitar a avaliação de atividades acadêmicas realizadas remotamente pelos alunos do curso de Ciência da Computação. Desenvolvido em Ruby on Rails, o sistema permite que administradores gerenciem turmas, matérias e formulários de avaliação, enquanto os alunos podem responder às avaliações de suas respectivas turmas e matérias.

## Planejamento

### 1. Escopo do Software
O sistema proposto visa desenvolver uma plataforma de avaliação acadêmica para instituições de ensino, focada em facilitar o processo de avaliação de atividades acadêmicas tanto para alunos quanto para professores. O sistema permitirá o gerenciamento de avaliações, criação de templates de avaliação, autenticação de usuários, e a atribuição de disciplinas e turmas.

### 2. Descrição do Problema
Atualmente, o processo de avaliação acadêmica em muitas instituições é manual e demorado, o que pode levar a erros e ineficiências. Professores e alunos enfrentam dificuldades na gestão de avaliações, feedback e acompanhamento de desempenho. Há necessidade de um sistema centralizado que permita uma melhor gestão e automação desses processos.

### 3. Proposta de Desenvolvimento
- **Linguagem de programação**: Ruby on Rails
- **Banco de dados**: PostgreSQL
- **Recursos necessários**:
  - Servidor de aplicação (Heroku, AWS, etc.)
  - Sistema de controle de versão (GitHub)
  - Ferramentas de CI/CD (GitHub Actions)
  - Frameworks de front-end (HTML, CSS, JavaScript)

### 4. Análise de Requisitos

#### 4.1 Requisitos Funcionais
```text
    \item \textbf{RF1}: O sistema deve permitir que professores e alunos se cadastrem e informem dados pessoais.
    \item \textbf{RF2}: O sistema deve permitir que professores criem e gerenciem avaliações.
    \item \textbf{RF3}: O sistema deve permitir que alunos visualizem e respondam avaliações.
    \item \textbf{RF4}: O sistema deve gerar relatórios de desempenho para alunos e turmas.
    \item \textbf{RF5}: O sistema deve permitir a criação de templates de avaliação reutilizáveis.
    \item \textbf{RF6}: O sistema deve fornecer autenticação e autorização para diferentes tipos de usuários (alunos, professores, administradores).
    \item \textbf{RF7}: O sistema deve permitir a associação de alunos e professores a disciplinas e turmas específicas.
    \item \textbf{RF8}: O sistema deve enviar notificações por e-mail para eventos importantes (novas avaliações, resultados de avaliações, etc.).
```

#### 4.2 Requisitos de Qualidade (Não Funcionais)
```text
    \item \textbf{RQ1}: O sistema deve ser responsivo e acessível em diferentes dispositivos (desktop, tablet, smartphone).
    \item \textbf{RQ2}: O sistema deve garantir a segurança dos dados dos usuários através de criptografia e controle de acesso.
    \item \textbf{RQ3}: O sistema deve ser disponível e escalável para suportar um grande número de usuários simultâneos.
    \item \textbf{RQ4}: O sistema deve ter um tempo de resposta aceitável (menos de 2 segundos para operações comuns).
    \item \textbf{RQ5}: O sistema deve ser mantível e extensível para futuras melhorias e adições de funcionalidades.
```

#### 4.3 Requisitos de Restrição
```text
    \item \textbf{RR1}: O sistema deve ser desenvolvido utilizando Ruby on Rails como framework principal.
    \item \textbf{RR2}: O banco de dados deve ser PostgreSQL.
    \item \textbf{RR3}: O sistema deve ser integrado com sistemas de autenticação externos (por exemplo, OAuth).
    \item \textbf{RR4}: O desenvolvimento deve seguir práticas ágeis, com entregas incrementais e feedback contínuo.
```

## Backlog do Projeto CAMAAR

### Histórias de Usuário

#### 1. Cadastro de Usuários

##### HU01: Cadastro de Alunos
**Como** um aluno, **eu quero** me cadastrar no sistema, **para que** eu possa acessar as avaliações da minha turma.

- **Critérios de Aceitação**:
  - O aluno deve fornecer nome, email, matrícula e senha.
  - O sistema deve validar a unicidade do email e da matrícula.
  - O aluno deve receber um email de confirmação após o cadastro.

##### HU02: Cadastro de Professores
**Como** um professor, **eu quero** me cadastrar no sistema, **para que** eu possa criar e gerenciar avaliações.

- **Critérios de Aceitação**:
  - O professor deve fornecer nome, email e senha.
  - O sistema deve validar a unicidade do email.
  - O professor deve receber um email de confirmação após o cadastro.

#### 2. Autenticação e Autorização

##### HU03: Login de Usuários
**Como** um usuário (aluno ou professor), **eu quero** fazer login no sistema, **para que** eu possa acessar minhas funcionalidades.

- **Critérios de Aceitação**:
  - O usuário deve fornecer email e senha.
  - O sistema deve autenticar o usuário e redirecioná-lo para a página inicial correspondente ao seu papel (aluno ou professor).

##### HU04: Logout de Usuários
**Como** um usuário (aluno ou professor), **eu quero** fazer logout do sistema, **para que** eu possa encerrar minha sessão com segurança.

- **Critérios de Aceitação**:
  - O usuário deve ser capaz de sair do sistema a partir de qualquer página.
  - O sistema deve encerrar a sessão do usuário e redirecioná-lo para a página de login.

#### 3. Gerenciamento de Disciplinas e Turmas

##### HU05: Cadastro de Disciplinas
**Como** um administrador, **eu quero** cadastrar disciplinas no sistema, **para que** os professores possam associá-las às turmas.

- **Critérios de Aceitação**:
  - O administrador deve fornecer nome e código da disciplina.
  - O sistema deve validar a unicidade do código da disciplina.

##### HU06: Cadastro de Turmas
**Como** um administrador, **eu quero** cadastrar turmas no sistema, **para que** os alunos possam ser associados a elas.

- **Critérios de Aceitação**:
  - O administrador deve fornecer nome, ano, semestre e disciplina associada à turma.
  - O sistema deve validar a combinação única de nome, ano e semestre para cada turma.

#### 4. Gerenciamento de Avaliações

##### HU07: Criação de Avaliações
**Como** um professor, **eu quero** criar avaliações para minhas turmas, **para que** eu possa avaliar o desempenho dos alunos.

- **Critérios de Aceitação**:
  - O professor deve fornecer título, descrição, data de criação e data de entrega da avaliação.
  - O professor deve associar a avaliação a uma turma específica.

##### HU08: Responder Avaliações
**Como** um aluno, **eu quero** responder às avaliações das minhas turmas, **para que** eu possa demonstrar meu conhecimento.

- **Critérios de Aceitação**:
  - O aluno deve visualizar as avaliações pendentes na sua página inicial.
  - O aluno deve fornecer respostas para cada pergunta da avaliação.
  - O sistema deve registrar a data e hora de submissão da resposta.

#### 5. Relatórios e Feedback

##### HU09: Visualização de Resultados
**Como** um aluno, **eu quero** visualizar os resultados das minhas avaliações, **para que** eu possa acompanhar meu desempenho.

- **Critérios de Aceitação**:
  - O aluno deve acessar uma página de resultados com a lista de avaliações respondidas.
  - O aluno deve visualizar a nota e o feedback do professor para cada avaliação.

##### HU10: Geração de Relatórios
**Como** um professor, **eu quero** gerar relatórios de desempenho dos alunos, **para que** eu possa avaliar o progresso da turma.

- **Critérios de Aceitação**:
  - O professor deve selecionar a turma e o período para o relatório.
  - O sistema deve gerar um relatório com as notas e o desempenho de cada aluno.

#### 6. Notificações

##### HU11: Notificações de Novas Avaliações
**Como** um aluno, **eu quero** receber notificações por email quando uma nova avaliação for criada, **para que** eu possa me preparar para respondê-la.

- **Critérios de Aceitação**:
  - O sistema deve enviar um email para o aluno quando uma nova avaliação for criada na sua turma.

##### HU12: Notificações de Resultados de Avaliações
**Como** um aluno, **eu quero** receber notificações por email quando os resultados das minhas avaliações forem publicados, **para que** eu possa verificar meu desempenho.

- **Critérios de Aceitação**:
  - O sistema deve enviar um email para o aluno quando os resultados de uma avaliação forem publicados pelo professor.

#### 7. Templates de Avaliações

##### HU13: Criação de Templates
**Como** um professor, **eu quero** criar templates de avaliações, **para que** eu possa reutilizá-los em diferentes turmas e períodos.

- **Critérios de Aceitação**:
  - O professor deve fornecer título e descrição para o template.
  - O professor deve adicionar perguntas ao template.
  - O template deve estar disponível para uso em futuras avaliações.

##### HU14: Utilização de Templates
**Como** um professor, **eu quero** utilizar templates para criar novas avaliações, **para que** eu possa economizar tempo na criação de avaliações similares.

- **Critérios de Aceitação**:
  - O professor deve selecionar um template existente ao criar uma nova avaliação.
  - O sistema deve preencher automaticamente as perguntas da avaliação com base no template selecionado.
