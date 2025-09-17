# Create the SP to use with terraform plan/apply
SUBSCRIPTION_ID=$(az account show --query id -o tsv)
az ad sp create-for-rbac \
  --name "terraform-sp" \
  --role="Contributor" \
  --scopes="/subscriptions/$SUBSCRIPTION_ID" \
  --sdk-auth
