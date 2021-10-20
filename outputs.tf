output "fw_private_ip_address" {
  value = azurerm_firewall.firewall.ip_configuration.0.private_ip_address
}

output "fwp_id" {
  value = azurerm_firewall_policy.firewall_policy.id
}