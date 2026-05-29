<!--
  README.md — Project front door.
  Purpose: give a recruiter or engineer a 2-minute understanding of WHAT this project is,
  WHY it exists, the architecture, how it maps to the Azure Well-Architected Framework,
  what it costs, and how to deploy/tear it down. This is the most-read file in the repo —
  keep it sharp and skimmable.
  STATUS: scaffold — sections are stubbed and filled in as milestones complete.
-->

# Azure Secure Serverless File-Processing Platform

A secure, event-driven file-processing platform on Azure, defined **100% as Infrastructure
as Code** (Terraform) and deployed via a **zero-secret OIDC CI/CD pipeline**. Built as a
flagship portfolio project demonstrating Azure Cloud Engineering / IaC practice across all
five Azure Well-Architected pillars.

## Problem

Many small businesses and teams continuously receive files (invoices, IDs, images, reports)
that must be ingested, processed, and made queryable. Standing up always-on servers for this
bursty workload is expensive and operationally heavy — patching, scaling, credential storage,
network lockdown, and reproducible environments all become someone's job. Teams tend to either
over-provision (waste) or cut corners on security and repeatability.

## Solution

Files uploaded to Blob Storage trigger (via Event Grid) a Python **Azure Function on the Flex
Consumption plan** that extracts metadata and writes results to **Cosmos DB**; a second HTTP
function serves those results. Everything — network, storage, functions, database, secrets,
monitoring, governance — is provisioned by **reusable Terraform modules** across **dev/prod**
and shipped by **GitHub Actions using OIDC federation (no stored secrets)**.

## Architecture

```
  Upload ─▶ Blob Storage ──Event Grid──▶ Function App (Flex Consumption, VNet-integrated)
                                            ├─ blob-trigger: extract metadata ─▶ Cosmos DB
                                            └─ HTTP GET /results/{id} ◀───────── query
  Secrets: Key Vault (managed identity)   Telemetry: Log Analytics + Application Insights
  Governance: Azure Policy                CI/CD: GitHub Actions + OIDC
```
<!-- TODO(milestone 8): replace with mermaid diagram + screenshots -->

## Well-Architected Framework mapping

| Pillar | What demonstrates it |
|--------|----------------------|
| Security | Managed identity, Key Vault, private endpoints, OIDC CI, Azure Policy, Checkov scan |
| Reliability | Multi-env, IaC reproducibility, remote state w/ locking, alerts |
| Cost Optimization | Serverless (Flex Consumption + Cosmos serverless), dev/prod cost profiles, teardown |
| Operational Excellence | CI/CD w/ approvals, runbook, structured logging, App Insights dashboards |
| Performance Efficiency | Event-driven autoscale, instance memory sizing on Flex plan |

## Repository layout

```
infra/          Terraform — the centerpiece
  bootstrap/      one-time: remote-state storage + OIDC app registration
  modules/        reusable modules (networking, storage, function_app, cosmos, keyvault, monitoring, governance)
  environments/   thin dev/ and prod/ compositions of the modules
app/            Python Azure Functions (the workload)
docs/           architecture decisions + operational runbook
.github/        CI/CD workflows (infra + app, kept separate by design)
```

## Quick start

> Status: scaffold. Build proceeds milestone-by-milestone — see the plan / `docs/runbook.md`.

```bash
# 1. one-time bootstrap (remote state + OIDC identity)
cd infra/bootstrap && terraform init && terraform apply
# 2. deploy an environment
cd ../environments/dev && terraform init && terraform apply
# 3. deploy the app
cd ../../../app && func azure functionapp publish <function-app-name>
```

## Cost & teardown

Uses serverless/consumption tiers; `dev` runs a cheaper profile (service endpoints) while
`prod` enables full private networking. Tear everything down with `terraform destroy` in the
environment folder when not demoing.

## License

MIT (see LICENSE) — portfolio/demo project.
