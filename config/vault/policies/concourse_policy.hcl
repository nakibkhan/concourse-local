path "auth/approle/login" {
  capabilities = ["create", "read"]
}

path "sys/*"  {
  policy = "deny"
}

path "concourse/*"  {
  capabilities = ["read", "list"]
}