data "cloudflare_zones" "CF_Zone" {
  filter {
    name   = var.CF_ZONE
    status = "active"
    paused = false
  }
}

resource "cloudflare_record" "CF_record" {
  for_each = var.CF_RECORDS
  zone_id = data.cloudflare_zones.CF_Zone.zones[0].id
  name    = lookup(each.value, "key", each.key)
  value   = lookup(each.value, "value", null)
  type    = each.value.type
  ttl     = 1
  proxied = each.value.proxy
  priority= lookup(each.value, "priority", null)
  data = lookup(each.value, "data", null)
}
