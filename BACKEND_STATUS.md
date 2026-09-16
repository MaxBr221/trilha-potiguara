# Status do Backend: Tupi Digital (Trilha Potiguara)

Este documento centraliza o progresso, as decisões de arquitetura e o estado atual da API do projeto **Tupi Digital**. A intenção é que ele seja atualizado constantemente para guiar o desenvolvimento do back-end.

## 1. Visão Geral da Arquitetura
- **Stack:** Java 21+, Spring Boot, Spring Security (JWT), PostgreSQL, Flyway.
- **Estrutura:** Monólito Modular (MVC + Services).
- **Diretrizes principais:**
  - Controllers delegam a lógica para os Services.
  - Forte utilização de DTOs (Records) nas respostas, adaptando-se aos contratos esperados pelo front-end.
  - Tratamento das informações culturais e linguísticas como regras core (onde o back-end é a fonte da verdade de respostas e pontuações).

## 2. Progresso Atual do MVP (Roadmap)

### ✅ Etapa 1: Configuração e Banco de Dados (Concluído)
- Configuração do `application.yml` (conexão com o banco `tupidigital` no PostgreSQL).
- Flyway ativado para versionamento (pasta `db/migration`).
- `V1` e `V2` scripts de banco criados.

### ✅ Etapa 2: Autenticação, Usuários e JWT (Concluído)
- Entidade `Usuario` criada com suporte a criptografia de senha (BCrypt) e níveis de autorização (Role `USER` e `ADMIN`).
- Serviço `TokenService` gerando os JWTs.
- `AuthenticationController` com endpoints:
  - `POST /api/v1/auth/login`: Retorna o token e os dados da sessão do usuário (`UsuarioSessaoDTO`).
  - `POST /api/v1/auth/register`: Efetua o cadastro de novos usuários.

### ✅ Etapa 3: Estrutura de Aprendizado Base (Concluído)
- Entidades criadas com mapeamento JPA: `Trilha`, `Modulo`, `Licao`.
- Relacionamentos estabelecidos: `Trilha` 1->N `Modulo` 1->N `Licao`.
- Endpoints alinhados com os contratos do Frontend:
  - `GET /api/v1/trilhas`: Lista as trilhas mapeadas em `TrilhaResponseDTO`.
  - `GET /api/v1/trilhas/{id}/modulos`: Lista módulos por trilha.
  - `GET /api/v1/modulos/{id}/licoes`: Lista as lições de um módulo.
  - `GET /api/v1/licoes/{id}`: Detalha uma lição específica.
- *Nota sobre Front-end:* Alguns campos puramente gráficos (`icon`, `corBase`, `estaBloqueada`) e a checagem de progresso/estado estão mockados via DTO para desbloquear o front-end, enquanto os cálculos dinâmicos não são implementados.

### ✅ Etapa 4: Exercícios e Validação de Respostas (Concluído)
- **Feito:** Entidade `Exercicio` criada para gerenciar as perguntas/respostas de cada lição. O backend recebe a resposta e valida, devolvendo se foi acerto/erro e emitindo a quantidade de XP ganha pelo usuário logado.

### ✅ Etapa 5: Pontuação (XP), Progresso e Sequência (Streak) (Concluído)
- **Feito:** Atualização do registro do `Usuario` dinamicamente conforme os exercícios são resolvidos. Criada a entidade `ProgressoUsuarioLicao` e o endpoint de conclusão de lição (`/api/v1/licoes/{id}/concluir`) para gerenciar a sequência contínua (streak) e o histórico de conclusão.

### ✅ Etapa 6: Administração e Conteúdo Linguístico (Concluído)
- **Feito:** Entidades para `ConteudoLinguistico` (Palavras/Frases Tupi, traduções, fonética) criadas, incluindo repositórios, DTOs e serviços correspondentes. Implementados os endpoints administrativos para cadastrar conteúdos e vincular às lições, com relacionamento `@ManyToMany`.

---

## 3. Contratos e Mockups Temporários em Código (Technical Debt)
Para alinhar rapidamente com os Mocks do Front-end, o back-end injetou alguns dados fictícios diretamente no momento em que mapeia de Entidade para DTO. No futuro, isso precisa ser refatorado para consultar o DB ou calcular com base em lógicas dinâmicas:
- `TrilhaResponseDTO`: `progresso`, `nivel`, `icon`, `corBase`, `estaBloqueada`.
- `ModuloResponseDTO`: `estaBloqueada`.
- `LicaoResponseDTO`: `estaConcluida`, `type` (sempre retorna "learning").

---
**Última Atualização:** Implementação de Conteúdo Linguístico finalizada (Etapa 6). Os endpoints base para administrar o vocabulário e associar às lições estão prontos. O próximo foco será conectar o front-end aos dados reais ou revisar as pendências de Mock.
