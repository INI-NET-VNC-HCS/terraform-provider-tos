resource "tufin_server" "mars_1" {
  domain = var.domain
  app    = var.app

  name           = "MARS_1"
  group_id       = 1
  ip             = "1.2.3.4"
  security_level = ""
  comment        = "Test Server MARS 1 .. Created by Tufin Terraform Provider"
  tags = merge(
    var.default_tags,
    {
      network_object_SA = format("%s", "MARS_1")
    })
}
output "mars_1" {
  value = tufin_server.mars_1
}

data "tufin_servers" "mars_1_name" {
  name = "MARS_1"

  domain = var.domain
  app    = var.app
}

output "mars_1_name" {
  value       = data.tufin_servers.mars_1_name.name
  description = "servers by name, name"
}
output "mars_1_servers" {
  value       = data.tufin_servers.mars_1_name.servers
  description = "servers by name, servers"
}

