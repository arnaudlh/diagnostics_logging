# Deploys the operations log repositories 
Creates Storage Account and Event Hubs to be used for diagnostics and operations logs. 


Reference the module to a specific version (recommended):
```
module "diagnostics_logging" {
    source                  = "git://github.com/aztfmod/diagnostics_logging.git?ref=v1.1"
  
    resource_group_name                = var.rg
    prefix                            = var.prefix
    location                          = var.location
    tags                              = var.tags
}
```

Or get the latest version
```
module "diagnostics_logging" {
    source                  = "git://github.com/aztfmod/diagnostics_logging.git?ref=latest"
  
    resource_group_name               = var.rg
    prefix                            = var.prefix
    location                          = var.location
    tags                              = var.tags
}
```

# Parameters

## resource_group_name
(Required) (Required) Name of the resource group to deploy the operations log.
```
variable "resource_group_name" {
  description = "(Required) Name of the resource group to deploy the operations log."
}

```
Example
```
virtual_network_rg = "my-vnet"
```

## location
(Required) Define the region where the resource groups will be created
```

variable "location" {
  description = "(Required) Define the region where the resource groups will be created"
  type        = string
}
```
Example
```
    location    = "southeastasia"
```

## prefix
(Optional) You can use a prefix to add to the list of resource groups you want to create
```
variable "prefix" {
    description = "(Optional) You can use a prefix to add to the list of resource groups you want to create"
}
```
Example
```
locals {
    prefix = "${random_string.prefix.result}-"
}

resource "random_string" "prefix" {
    length  = 4
    upper   = false
    special = false
}
```

## tags
(Required) Map of tags for the deployment
```
variable "tags" {
  description = "(Required) map of tags for the deployment"
}
```
Example
```
tags = {
    environment     = "DEV"
    owner           = "Arnaud"
    deploymentType  = "Terraform"
  }
```

# Output
## diagnostics_map
Returns a map: 
  - "diags_sa"- Storage account resource ID
  - "eh_name"- Event Hub Name 
  - "eh_id" - Event Hub Resource ID  