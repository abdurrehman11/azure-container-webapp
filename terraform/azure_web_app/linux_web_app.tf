resource "azurerm_linux_web_app" "linux_web_app" {
  name                = var.webapp_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.service_plan.id
  https_only          = true

  app_settings = {
    WEBSITES_PORT                              = var.webapp_websites_port
    WEBSITES_CONTAINER_START_TIME_LIMIT        = var.contqainer_start_time_limit
    APPLICATIONINSIGHTS_CONNECTION_STRING      = azurerm_application_insights.app_insights.connection_string
    ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
    XDT_MicrosoftApplicationInsights_Mode      = "Recommended"
  }

  site_config {
    always_on = true
    application_stack {
      docker_image_name = var.docker_image_name
      docker_registry_url = data.azurerm_key_vault_secret.docker_registry_server.value
      docker_registry_username = data.azurerm_key_vault_secret.docker_registry_username.value
      docker_registry_password = data.azurerm_key_vault_secret.docker_registry_password.value
    }
  }

  storage_account {
    access_key   = data.azurerm_key_vault_secret.storage_access_key.value
    account_name = var.storage_account_name
    name         = var.storage_name
    share_name   = var.storage_share_name
    type         = var.storage_type
    mount_path   = var.storage_mount_path
  }

  tags = {
    owner = "abdurrehman245"
    group = "TestGroup"
  }

}