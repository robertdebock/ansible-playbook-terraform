variable "cf_api_key" {}

variable "cf_email" {}

provider "cloudflare" {
  api_key = var.cf_api_key
  email   = var.cf_email
}
