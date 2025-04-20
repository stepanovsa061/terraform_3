output "access_key" {
  value = module.bucket.access_key
  sensitive = true
}

output "secret_key" {
  value = module.bucket.secret_key
  sensitive = true
}


output "Picture_URL" {
  value = "https://${module.bucket.bucked}/${module.bucket.picture_key}"
  description = "Адрес загруженной в бакет картинки"
}
