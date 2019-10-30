variable "tfe_host" {
  description = "TFC/TFE Instance"
  default     = "app.terraform.io"
}

variable "name" {
  description = "Name of webhook destination"
  default     = "tfe-webhook-receiver"
}

variable "token" {
  description = "TFE User Token"
}

variable "type" {
  description = "`generic` or `slack`"
  default = "generic"
}

variable "org" {
  description = "TFE Organization to install webhooks to"
}

variable "webhook_url" {
  description = "URL to send webhook notifications to"
}
