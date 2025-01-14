# LLAMARA - Docker Deployment

LLAMARA is an LLM-based assistant for information retrieval from a provided knowledge base.
It aims at supporting researchers working with scientific papers, whitepapers and documentation,
as well as possibly serving research findings in an accessible way to the public.

This repository contains a Docker Compose and a configuration template to deploy the [LLAMARA distribution](https://github.com/llamara-ai/llamara-distro) Docker container.

## Dependencies

### Authentication

This application requires an OIDC authentication provider to be set up.
We recommend to use Keycloak as OIDC provider.

You need to add the `microprofile-jwt` and `profile` scopes for the Quarkus client, e.g. for Keycloak see [Keycloak Server Documentation](https://www.keycloak.org/docs/latest/server_admin/#protocol).

## Configuration

Provide the required environment variables in a `.env` file:

```dotenv
QUARKUS_OIDC_CREDENTIALS_SECRET=
POSTGRES_PASSWORD=
MINIO_ROOT_PASSWORD=
MINIO_ACCESS_KEY=
MINIO_SECRET_KEY=
REDIS_PASSWORD=
QDRANT_API_KEY=

OPENAI_API_KEY=
```

Use [`application.yaml.sample`](/config/application.yaml.sample) to create a `application.yaml` in the `config` dir that provides the required configuration.

Refer to [llamara-backend](https://github.com/llamara-ai/llamara-backend/blob/main/config/README.md) to learn about the supported configuration properties.

## Deployment

Once you have completed the configuration step, start LLAMARA through Docker Compose:

```shell script
docker compose up
```
