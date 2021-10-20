variable "enviro" {
  type        = string
  description = "define the environment ex. dev,tst,prd,stg"
}

variable "prjname" {
  type        = string
  description = "define the project name ex. prj02"
}

variable "prjnum" {
  type        = string
  description = "define the project number for TFstate file ex. 4858"
}

variable "location" {
  type        = string
  description = "location of your resource group"
}

variable "rgname" {
  type        = string
  description = "the name of the resource group in which to deploy the resource groups"
}

variable "AzureFirewallSubnet_ID" {
  type        = string
  description = "The ID of the AzureFirewall Subnet"
}

variable "AzureFirewall_Public_IP_ID" {
  type         = string
  description = "the resource ID of the AzureFirewall_Public_IP address"
}

variable "fwsku" {
  type = string
  description = "Either 'Standard' or 'Premium' - this is the SKU type of the firewall"
}

variable "dns_servers" {
  type = list
  description = "list of DNS resolvers - possibly domain controllers"
}

variable "ThreatIntelligence_Mode" {
  type = string
  description = "Alert, Deny, or Off"
}

variable "ThreatIntelligence_IP_Whitelist" {
  type = list
  description = "list of IP addresses that are whitelisted from Threat Intelligence"
  default = []
}

variable "ThreatIntelligence_FQDN_Whitelist" {
  type = list
  description = "list of FQDNs that are whitelisted from Threat Intelligence"
  default = []
}

variable "firewall_name" {
  type = string
  description = "the name of the firewall resource"
}