<<<<<<< Updated upstream
# CAMAAR-UnB

## Participantes:
Scrum Master: Luiz Fernando Sperandio David - 190112735
Product Owner:  Rodrigo Vieira de oliveira - 242043105
Guilherme Barbosa Dias - 221018924

### Política de Branching:
Por Feature e Release(Sprints)

### Funcionalidades e seus Responsáveis:
Guilherme - sistema de login, sistema de definição de senha, criar formulário de avaliação, criar template de formulário, visualização dos templates criados

Rodrigo - Importar dados do sigaa, Cadastrar usuários do sistema, Gerar relatório do administrador, atualizar base de dados com dados do sigaa

Luiz - Visualização de resultados dos formulários, Visualização de formularios para responder, Responder formulário, Edição e deleção de templates
=======
# CAMAAR Project

## Getting Started

To start the project using Docker Compose, follow these steps:

1. **Build the Docker images:**

   ```sh
   docker-compose build
    ```

### Create and migrate the database:
docker-compose run web rails db:create db:migrate

### Start the application

docker-compose up

### Acess the application

Open your browser and go to http://localhost:3000 to see the application running.

## Running Tests
To run Cucumber tests, use the following command:
    ```sh
    docker-compose run web bundle exec cucumber
    ```

## Services
Web: The Rails application.
DB: PostgreSQL database.

## Environment Variables
Ensure you have the following environment variables set in your .env file or in the docker-compose.yml:

DATABASE_URL: Connection string for the PostgreSQL database.

## Volumes
postgres_data: Stores the PostgreSQL data.

## Notes

Ensure Docker and Docker Compose are installed on your machine.
Adjust the docker-compose.yml and database.yml files as needed for your specific environment and credentials.
>>>>>>> Stashed changes
