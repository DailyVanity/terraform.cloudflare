provider "cloudflare" {
  version = "~> 2.0"  
  api_key = var.CF_KEY
  email   = var.CF_EMAIL
}
