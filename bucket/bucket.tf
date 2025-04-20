// Создание бакета с использованием ключа
resource "yandex_storage_bucket" "step" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = local.bucket_name
  acl    = "public-read"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.secret-key.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "yandex_storage_object" "picture" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = local.bucket_name
  key    = "360_F_563160370_QKKN5QwcLcFL1mnKYlLSU3GJxa3jXCaG.jpg"
  source = "/home/sergey/terraform_3/picture/360_F_563160370_QKKN5QwcLcFL1mnKYlLSU3GJxa3jXCaG.jpg"
  acl = "public-read"
  depends_on = [yandex_storage_bucket.step]
}
