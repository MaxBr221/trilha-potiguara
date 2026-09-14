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

### ⏳ Etapa 4: Exercícios e Validação de Respostas (Próximo Passo)
- **A fazer:** Criar entidade `Exercicio` e gerenciar as perguntas/respostas de cada lição. O backend deve receber a resposta e validá-la, devolvendo se foi acerto/erro e emitindo a quantidade de XP.

### ⏳ Etapa 5: Pontuação (XP), Progresso e Sequência (Streak) (Pendente)
- **A fazer:** Atualizar o registro do `Usuario` dinamicamente conforme os exercícios são resolvidos. Gerenciar a sequência contínua (streak de dias) quando o usuário conclui uma lição com base em timestamps.

### ⏳ Etapa 6: Administração e Conteúdo Linguístico (Pendente)
- **A fazer:** Entidades para `ConteudoLinguistico` (Palavras/Frases Tupi, traduções, fonética) e um grupo de endpoints administrativos para cadastrar e vincular esses conteúdos de forma persistente.

---

## 3. Contratos e Mockups Temporários em Código (Technical Debt)
Para alinhar rapidamente com os Mocks do Front-end, o back-end injetou alguns dados fictícios diretamente no momento em que mapeia de Entidade para DTO. No futuro, isso precisa ser refatorado para consultar o DB ou calcular com base em lógicas dinâmicas:
- `TrilhaResponseDTO`: `progresso`, `nivel`, `icon`, `corBase`, `estaBloqueada`.
- `ModuloResponseDTO`: `estaBloqueada`.
- `LicaoResponseDTO`: `estaConcluida`, `type` (sempre retorna "learning").

---
**Última Atualização:** Alinhamento de DTOs e Contratos com o Frontend concluído. O foco atual deve pular para a **Etapa 4 (Exercícios e Respostas)**.
