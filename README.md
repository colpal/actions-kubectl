This action can be used to run a kubectl command.

Example usage:

```yaml
name: Run gcloud version on push
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: colpal/actions-kubectl@v1.0.0
        env:
          GCP_CREDENTIALS: ${{ secrets.GCP_CREDENTIALS }}
          GCP_PROJECT: gcp-project-id
          GKE_CLUSTER_NAME: cluster-name
        with:
          args: version
```

Note: GCP_CREDENTIALS needs to be a base64 encoded string.

Example to 
```bash
cat my_service_account_secret_file.json | base64 > my_service_account_secret_file.json.base64
```
