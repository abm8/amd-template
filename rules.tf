
data "akamai_property_rules_builder" "amd-template_rule_default" {
  rules_v2026_02_16 {
    name      = "default"
    is_secure = true
    behavior {
      origin {
        cache_key_hostname            = "ORIGIN_HOSTNAME"
        compress                      = true
        enable_true_client_ip         = true
        forward_host_header           = "REQUEST_HOST_HEADER"
        hostname                      = "yourorigin.com"
        http2_enabled                 = true
        http2_title                   = ""
        http_port                     = 80
        https_port                    = 443
        ip_version                    = "IPV4"
        min_tls_version               = "DYNAMIC"
        origin_certificate            = ""
        origin_sni                    = true
        origin_type                   = "CUSTOMER"
        ports                         = ""
        tls_version_title             = ""
        true_client_ip_client_setting = false
        true_client_ip_header         = "True-Client-IP"
        verification_mode             = "PLATFORM_SETTINGS"
      }
    }
    behavior {
      cp_code {
        enable_default_content_provider_code = false
        value {
          created_date = 1682483149000
          description  = "abm-amd"
          id           = 1468747
          name         = "abm-amd"
          products     = ["Adaptive_Media_Delivery", ]
        }
      }
    }
    behavior {
      segmented_media_optimization {
        behavior = "ON_DEMAND"
      }
    }
    behavior {
      origin_characteristics {
        authentication_method       = "AUTOMATIC"
        authentication_method_title = ""
        country                     = "UNKNOWN"
        origin_location_title       = ""
      }
    }
    behavior {
      content_characteristics_amd {
        catalog_size            = "UNKNOWN"
        content_type            = "HD"
        dash                    = true
        hds                     = true
        hls                     = true
        popularity_distribution = "UNKNOWN"
        segment_duration_dash   = "SEGMENT_DURATION_6S"
        segment_duration_hds    = "SEGMENT_DURATION_6S"
        segment_duration_hls    = "SEGMENT_DURATION_10S"
        segment_duration_smooth = "SEGMENT_DURATION_2S"
        segment_size_dash       = "UNKNOWN"
        segment_size_hds        = "UNKNOWN"
        segment_size_hls        = "UNKNOWN"
        segment_size_smooth     = "UNKNOWN"
        smooth                  = true
      }
    }
    behavior {
      client_characteristics {
        country = "UNKNOWN"
      }
    }
    behavior {
      cache_key_query_params {
        behavior = "IGNORE_ALL"
      }
    }
    behavior {
      segmented_content_protection {
        dash_media_encryption      = false
        enabled                    = false
        hls_media_encryption       = false
        media_encryption_title     = ""
        token_authentication_title = ""
      }
    }
    behavior {
      dynamic_throughtput_optimization {
        enabled = true
      }
    }
    behavior {
      http3 {
        enable = true
      }
    }
    behavior {
      enhanced_debug {
        debug_key      = "c7c41a69c7233e343eef1daec7e83708f6e78dede1217f72b676d006b2e399ac"
        disable_pragma = true
        enable_debug   = true
        generate_grn   = true
      }
    }
    children = [
      data.akamai_property_rules_builder.amd-template_rule_default_cors_policy.json,
    ]
  }
}

data "akamai_property_rules_builder" "amd-template_rule_default_cors_policy" {
  rules_v2026_02_16 {
    name                  = "Default CORS Policy"
    criteria_must_satisfy = "all"
    behavior {
      modify_outgoing_response_header {
        action                      = "MODIFY"
        avoid_duplicate_headers     = false
        new_header_value            = "*"
        standard_modify_header_name = "ACCESS_CONTROL_ALLOW_ORIGIN"
      }
    }
    behavior {
      modify_outgoing_response_header {
        action                      = "MODIFY"
        avoid_duplicate_headers     = false
        new_header_value            = "GET,POST,OPTIONS"
        standard_modify_header_name = "ACCESS_CONTROL_ALLOW_METHODS"
      }
    }
    behavior {
      modify_outgoing_response_header {
        action                      = "MODIFY"
        avoid_duplicate_headers     = false
        new_header_value            = "origin,range,hdntl,hdnts,CMCD-Request,CMCD-Object,CMCD-Status,CMCD-Session"
        standard_modify_header_name = "ACCESS_CONTROL_ALLOW_HEADERS"
      }
    }
    behavior {
      modify_outgoing_response_header {
        action                      = "MODIFY"
        avoid_duplicate_headers     = false
        new_header_value            = "Server,range,hdntl,hdnts,Akamai-Mon-Iucid-Ing,Akamai-Mon-Iucid-Del,Akamai-Request-BC"
        standard_modify_header_name = "ACCESS_CONTROL_EXPOSE_HEADERS"
      }
    }
    behavior {
      modify_outgoing_response_header {
        action                      = "MODIFY"
        avoid_duplicate_headers     = false
        new_header_value            = "true"
        standard_modify_header_name = "ACCESS_CONTROL_ALLOW_CREDENTIALS"
      }
    }
    behavior {
      modify_outgoing_response_header {
        action                      = "MODIFY"
        avoid_duplicate_headers     = false
        new_header_value            = "86400"
        standard_modify_header_name = "ACCESS_CONTROL_MAX_AGE"
      }
    }
  }
}
