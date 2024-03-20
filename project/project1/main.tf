module "network" {
  source    = "../modules/network"
  region    = var.region
  az        = var.az
  ec2_sg_id = var.az
}

module "s3" {
  source = "../modules/s3"
  bucket = var.bucket
}

module "dynamodb" {
  source                = "../modules/dynamo"
  dynamo_table_name     = var.dynamo_table_name
  dynamo_table_key      = var.dynamo_table_key
  dynamo_table_key_type = var.dynamo_table_key_type
}

module "ec2" {
  source           = "../modules/ec2"
  public_subnet_id = module.network.public_subnet_id
  vpc_id           = module.network.vpc_id
  ami              = var.ami
  key_name         = var.key_name
  depends_on       = [module.dynamodb]
}
