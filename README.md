# EKS deployments with Helm

GitHub action for deploying to AWS EKS clusters using helmfile.

## Customizing

### inputs

Following inputs can be used as `step.with` keys

| Name             | Type    | Description                        |
|------------------|---------|------------------------------------|
| `aws-secret-access-key`          | String  | AWS secret access key part of the aws credentials. This is used to login to EKS. |
| `aws-access-key-id`      | String  | AWS access key id part of the aws credentials. This is used to login to EKS. |
| `aws-region`      | String  | AWS region to use. This must match the region your desired cluster lies in. |
| `cluster-name`      | String  | The name of the desired cluster. |
| `cluster-role-arn`      | String  | If you wish to assume an admin role, provide the role arn here to login as. |
| `namespace`      | String  | Kubernetes namespace to use. This must be the same name of helmfile environment |
| `helmfile-path`      | String  | The path where lives the helmfile and its values. (defaults to `deploy/`) |
| `helmfile`      | String  | The name of the helmfile file. (defaults to `helmfile.yaml`) |


## Example usage

```yaml
uses: craftech-io/eks-helmfile-deploy-action@v1
with:
  aws-access-key-id: ${{ secrets.AWS_ACCESS__KEY_ID }}
  aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
  aws-region: us-west-2
  cluster-name: mycluster
  namespace: dev
  helmfile-path: my-path
  helmfile: my-helmfile.yaml
```