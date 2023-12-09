terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.77.0"
    }
  }
}

provider "snowflake" {
  user = env("SNOWFLAKE_USERNAME")
  password = env("SNOWFLAKE_PRIVATE_KEY")
  account = env("SNOWFLAKE_ACCOUNT")
  authenticator = env("SNOWFLAKE_AUTHENTICATOR")
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