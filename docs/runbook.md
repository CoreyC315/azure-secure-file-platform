<!--
  docs/runbook.md — Operational playbook.
  Purpose: step-by-step deploy / rollback / troubleshooting notes so the platform can be
  operated by someone other than the author. Demonstrates operational-excellence maturity.
  STATUS: scaffold — procedures stubbed; fill in real commands/output as milestones complete.
-->

# Runbook

## Prerequisites

- `az` CLI logged in (`az account show`)
- `terraform` >= 1.7, `python` >= 3.11, Azure Functions Core Tools (`func`)
- Permissions: Contributor + User Access Administrator on the subscription (for RBAC assignments)

## Deploy (first time)

1. **Bootstrap** remote state + OIDC identity:
   ```bash
   cd infra/bootstrap && terraform init && terraform apply
   ```
   Record outputs into GitHub repo **variables** (not secrets): `AZURE_CLIENT_ID`,
   `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`.
2. **Deploy environment**:
   ```bash
   cd infra/environments/dev && terraform init && terraform apply
   ```
3. **Deploy app code**:
   ```bash
   cd app && func azure functionapp publish <function-app-name>
   ```

## Rollback

- Infra: revert the Terraform change, `terraform apply` (or `terraform plan` a previous tag).
- App: redeploy the previous build artifact / git tag.

## Teardown (cost control)

```bash
cd infra/environments/dev && terraform destroy
```

## Known gotchas

### Flex Consumption + identity-based storage
When `shared_access_key_enabled = false` on the Function App's storage account, Azure
auto-injects a plain `AzureWebJobsStorage` **connection string**, which then fails to acquire
its host lock lease on startup. **Fix:** configure identity-based settings instead —
`AzureWebJobsStorage__accountName`, `AzureWebJobsStorage__credential = managedidentity` — and
grant the Function App's managed identity `Storage Blob Data Owner` on that account.

<!-- TODO(milestone 4): confirm exact app-setting keys once deployed -->

### Event Grid cold-start race
Event Grid subscriptions can fire before the function host is warm. Consider a `null_resource`
pre-warm step that pings a lightweight HTTP endpoint before creating the subscription.

<!-- TODO(milestone 3/4): add more gotchas as you hit them -->
