terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.77.0"
    }
  }
}

provider "snowflake" {
  user = lookup(env,"SNOWFLAKE_USER") 
  password = lookup(env,"SNOWFLAKE_PRIVATE_KEY")
  account = lookup(env,"SNOWFLAKE_ACCOUNT")
  authenticator = lookup(env,"SNOWFLAKE_AUTHENTICATOR")
  role = "SYSADMIN"
}

resource "snowflake_database" "db" {
  name = "TF_DEMO"
}

resource "snowflake_warehouse" "warehouse" {
  name           = "TF_DEMO"
  warehouse_size = "large"
  auto_suspend   = 60
}