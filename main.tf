terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.77.0"
    }
  }
}

provider "snowflake" {
  user = var.snowflake_username
  password = var.snowflake_pwd
  account = var.snowflake_account
  role =var.snowflake_role
}

resource "snowflake_database" "db" {
  name = "TF_DEMO"
}

resource "snowflake_warehouse" "warehouse" {
  name           = "TF_DEMO"
  warehouse_size = "large"
  auto_suspend   = 60
}