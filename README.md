# Setup Github Secrets
Setup the following github secrets which are required for the cicd of application and infrastructure.
- `AZURE_CREDENTIALS` -> azure service_principal_object or relevant identity access
- `AZURE_WEBAPP_PUBLISH_PROFILE` -> azure function_app credentials (download from azure app page)
- `REGISTRY_LOGIN_SERVER` -> azure container registry login server url
- `REGISTRY_USERNAME` -> service principal clientId
- `REGISTRY_PASSWORD` -> service principal clientSecret
- `AZURE_STORAGE_ACCESS_KEY` -> azure storage account access key to store terraform state file

# Infastructure Deployment Instructions
This repo contains a directory `terraform` that will provision the azure web app with required resources.

## Build image and Push to ACR(Azure Container Registry)
To build iamge locally, run the following command from project root directory
```bash
docker build -t <login-server>/<image-name>:<tag>
```

To push the image to Azure container regsitry, run the following command,
```bash
docker push <login-server>/<image-name>:<tag>
```

## Provision the Azure Web App
- Go to this directory, `terraform -> azure_web_app` and then in `variables.tf`, change the following variables `docker_image_name` according to your image that you built in previous step.

- Go to directory, `terraform -> test` and then in `main.tf`, change the `environment_name` as required.

- Run the following commands from project root dir in order,
```bash
cd ./terraform/test
terraform init
terraform plan
terraform apply
```

## CI/CD for terrafrom to automate the provision of infrastructure
- If you have already followed the Infrastructure Deployment instruction then you are ready to go, just do any change in your `terraform` dir while you are on git `infra branch` as you want and then do git `commit` and `push` in `infra branch` and `CI/CD pipeline` will trigger and deploy your updated infrastructure to azure web app.

# Application Deployment Instructions
- If you have already followed the Infrastructure Deployment instruction then you are ready to go, just do any change in your application code as you want while you are on git `main branch` and then do git `commit` and `push` in `main branch` and `CI/CD pipeline` will trigger and deploy your updated application to azure function app.

## References
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app#storage_account
- https://stackoverflow.com/questions/56636394/azure-app-service-error-while-pulling-image-from-acr-using-keyvault-terraform
- https://learn.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage?tabs=azure-cli
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret
- https://tecadmin.net/how-to-install-terraform-on-ubuntu/
- https://learn.microsoft.com/en-us/azure/app-service/configure-custom-container?pivots=container-linux&tabs=debian#enable-ssh
- https://learn.microsoft.com/en-us/azure/app-service/troubleshoot-diagnostic-logs
- https://learn.microsoft.com/en-us/azure/azure-monitor/app/azure-web-apps?tabs=net
- https://learn.microsoft.com/en-us/azure/app-service/reference-app-settings?tabs=kudu%2Cpython
- https://learn.microsoft.com/en-us/azure/app-service/configure-common?tabs=portal
- https://learn.microsoft.com/en-us/azure/container-instances/container-instances-github-action?tabs=userlevel