# Examples

This directory contains usage examples for deploying job files using GitHub Actions.

## Structure

```
examples/
├── actions/
│   └── deploy-job/
│       └── action.yml          # 📎 Demo only — not used by GitHub Actions directly
├── jobs/
│   ├── hello-service.nomad
│   └── hello-batch.nomad
└── workflows/
    └── deploy.yml              # Example workflow that uses the deploy-job action
```

### Contents

- `jobs/`: Sample [Nomad](https://developer.hashicorp.com/nomad) job files in HCL format.
  - `hello-service.nomad`: A basic Nomad service job using an HTTP echo container.
  - `hello-batch.nomad`: A one-time batch job using the same image.

- `workflows/`: GitHub Actions workflow examples.
  - `deploy.yml`: A manually triggered workflow (`workflow_dispatch`) that deploys a job file by calling a reusable composite action.

- `actions/`: A demonstration copy of a reusable GitHub Action (`deploy-job`) that submits a job file to a remote deployment endpoint via `curl`.

## Usage Instructions

1. Copy the example workflow to your actual workflows directory:
   ```bash
   cp examples/workflows/deploy.yml .github/workflows/
   ```

2. Copy the example action to your `.github/actions/` directory to make it usable in workflows:
   ```bash
   mkdir -p .github/actions/deploy-job
   cp examples/actions/deploy-job/action.yml .github/actions/deploy-job/
   ```

3. Ensure the following **repository secrets** are defined:
   - `TOKEN`: API key used for authentication
   - `ENDPOINT`: Full deployment endpoint URL (e.g., `https://abc123.execute-api.us-west-2.amazonaws.com/v1/deploy`)

4. Trigger the workflow via the GitHub UI and provide the job file path (e.g., `examples/jobs/hello-service.nomad`).

## Notes

- The action in `examples/actions/` is for demonstration only. GitHub will not execute any action stored outside of `.github/actions/` or a public repo.
- Modify the job files and workflow to suit your environment and deployment method.