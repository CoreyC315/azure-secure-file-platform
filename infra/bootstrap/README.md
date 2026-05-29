# Bootstrap (run once)

Creates the prerequisites the rest of the project assumes already exist:

1. **Terraform remote-state backend** — a Storage Account + `tfstate` container (versioned,
   public access disabled) used by every environment's `backend.tf`.
2. **Zero-secret CI identity** — an Entra ID app registration + service principal with a
   **GitHub OIDC federated credential**, so GitHub Actions can authenticate to Azure with no
   stored client secret.

## Run

```bash
cd infra/bootstrap
terraform init        # local state — this module creates the backend itself
terraform apply
```

## After apply

- Copy the storage outputs into `infra/environments/*/backend.tf`.
- Add `ci_client_id`, `tenant_id`, `subscription_id` as **GitHub repository variables**
  (Settings → Secrets and variables → Actions → Variables). They are NOT secrets.

> ⚠️ Run this only once (or when rotating the CI identity). It uses local state by design.
