module "bucket"  {
  source = "./bucket"
  folder_id  = var.folder_id
  token      = var.token
  cloud_id   = var.cloud_id
}
