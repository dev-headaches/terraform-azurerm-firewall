terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.12"
    }
  }
}

resource "azurerm_firewall_policy" "firewall_policy" {
  name                = format("%s%s%s%s", "fwp_hub_", var.prjname, var.enviro, var.prjnum)
  resource_group_name = var.rgname
  location            = var.location
  sku                 = var.fwsku
  dns {
    proxy_enabled = "true"
    servers        = var.dns_servers
  }
  threat_intelligence_mode = var.ThreatIntelligence_Mode
  threat_intelligence_allowlist {
  ip_addresses = var.ThreatIntelligence_IP_Whitelist
  fqdns        = var.ThreatIntelligence_FQDN_Whitelist
  }

  intrusion_detection {
    mode = "Alert"
  }
}

resource "azurerm_firewall" "firewall" {
  name                = var.firewall_name
  location            = var.location
  resource_group_name = var.rgname
  sku_tier            = var.fwsku
  firewall_policy_id  = azurerm_firewall_policy.firewall_policy.id
  depends_on = [
    azurerm_firewall_policy.firewall_policy #TF does a piss poor job of managing this association and it causes problems every time you have to make a config change, hence this is a last resort...
  ]

  ip_configuration {
    name                 = format("%s%s", "ipcfg_", var.firewall_name)
    subnet_id            = var.AzureFirewallSubnet_ID
    public_ip_address_id = var.AzureFirewall_Public_IP_ID
  }
}