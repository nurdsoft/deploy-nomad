# deploy-nomad

This Github action allows you to submit an HCL nomad job to an endpoint.

## Usage

| Parameter | Description |
|-----------|-------------|
| token | Authentication token |
| endpoint |  Endpoint where the HCL Nomad job will be submitted |
| job | Path to the nomad job |

All parameters are required.

## Example

```yaml
jobs:
  deploy:
    steps:
      - name: "Deploy to Nomad"
        uses: nurdsoft/deploy-nomad
        with:
          token: ${{ secrets.NOMAD_DEPLOY_TOKEN }}
          endpoint: https://nomad.domain.com
          job: deploy.nomad
```