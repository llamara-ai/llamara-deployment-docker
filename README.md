# LLAMARA Docker Deployment

LLAMARA - **L**arge **L**anguage **A**ssistant for **M**odel-**A**ugmented **R**etrieval and **A**nalysis - is an LLM-based assistant for information retrieval from a provided knowledge base.
It aims at supporting researchers working with scientific papers, whitepapers and documentation,
as well as possibly serving research findings in an accessible way to the public.

This repository contains a Docker Compose file and a configuration template to deploy the [LLAMARA distribution](https://github.com/llamara-ai/llamara-distro) Docker container.

## Dependencies

### Authentication

This application requires an OIDC authentication provider to be set up.
We recommend to use Keycloak as OIDC provider. For more details see the [Keycloak setup guide](/keycloak).

## Configuration

Copy `.env.sample` and `.app.env.sample` removing the `.sample` file extension and fill out the empty environment variables.

Use [`application.yaml.sample`](/config/application.yaml.sample) to create a `application.yaml` in the `config` dir that provides the required configuration.

Refer to [llamara-backend](https://github.com/llamara-ai/llamara-backend/blob/main/config/README.md) to learn about the supported configuration properties.

## Deployment

Once you have completed the configuration step, start LLAMARA through Docker Compose:

```shell script
docker compose up
```
