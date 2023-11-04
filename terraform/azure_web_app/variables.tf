variable "resource_group_name" {
  default = ""
}

variable "location" {
  default = ""
}

variable "key_vault_name" {
  default = ""
}

variable "webapp_name" {
  description = "Azure Web App Name"
  type = string
}

variable "webapp_websites_port" {
  default = "7860"
}

variable "contqainer_start_time_limit" {
  default = "720"
}

variable "docker_image_name" {
  default = "<image_name>:<image_tag>"
}

variable "storage_account_name" {
  default = ""
}

variable "storage_name" {
  default = "model-eval-mount"
}

variable "storage_share_name" {
  default = "model-eval-container"
}

variable "storage_type" {
  default = "AzureBlob"
}

variable "storage_mount_path" {
  default = "/code/data"
}

variable "app_service_plan" {
  default = ""
}

variable "service_os_type" {
  default = "Linux"
}

variable "service_sku_name" {
  default = "B1"
}

variable "app_insight_name" {
  default = ""
}

variable "app_insights_app_type" {
  default = "web"
}