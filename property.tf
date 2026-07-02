terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = ">= 10.1.0"
    }
  }
  required_version = ">= 1.0"
}

provider "akamai" {
  edgerc         = var.edgerc_path
  config_section = var.config_section
}

resource "akamai_property" "amd-template" {
  name        = "amd-template"
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = "prd_Adaptive_Media_Delivery"
  hostnames {
    cname_from             = "amd-template.akamaized.net"
    cname_to               = "amd-template.akamaized.net"
    cert_provisioning_type = "CPS_MANAGED"
  }
  rule_format = data.akamai_property_rules_builder.amd-template_rule_default.rule_format
  rules       = data.akamai_property_rules_builder.amd-template_rule_default.json
}

# NOTE: Be careful when removing this resource as you can disable traffic
#resource "akamai_property_activation" "amd-template-staging" {
#  property_id                    = akamai_property.amd-template.id
#  contact                        = []
#  version                        = var.activate_latest_on_staging ? akamai_property.amd-template.latest_version : akamai_property.amd-template.staging_version
#  network                        = "STAGING"
#  auto_acknowledge_rule_warnings = false
#}

# NOTE: Be careful when removing this resource as you can disable traffic
#resource "akamai_property_activation" "amd-template-production" {
#  property_id                    = akamai_property.amd-template.id
#  contact                        = []
#  version                        = var.activate_latest_on_production ? akamai_property.amd-template.latest_version : akamai_property.amd-template.production_version
#  network                        = "PRODUCTION"
#  auto_acknowledge_rule_warnings = false
#}
