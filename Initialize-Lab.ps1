$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot
$identity = aws sts get-caller-identity --output json | ConvertFrom-Json
if ($LASTEXITCODE -ne 0) { throw "AWS CLI identity check failed." }
if ($identity.Account -ne "860350045306") {
  throw "Wrong AWS account: $($identity.Account). Expected 860350045306. Stop."
}
$keyName = Read-Host "Enter EC2 key pair name in ap-south-1 [ewb-lab]"
if ([string]::IsNullOrWhiteSpace($keyName)) { $keyName = "ewb-lab" }
aws ec2 describe-key-pairs --region ap-south-1 --key-names $keyName --query "KeyPairs[0].KeyName" --output text
if ($LASTEXITCODE -ne 0) { throw "Key pair not found. Create it first, then rerun." }
try { $ip = (Invoke-RestMethod "https://checkip.amazonaws.com").Trim() } catch { $ip = Read-Host "Enter current public IPv4 (without /32)" }
if ($ip -notmatch '^\d{1,3}(\.\d{1,3}){3}$') { throw "Invalid IPv4 address." }
@"
aws_region = "ap-south-1"
expected_account_id = "860350045306"
student_name = "Shivang"
bastion_ingress_cidr = "$ip/32"
key_pair_name = "$keyName"
instance_type = "t3.micro"
enable_peering = false
"@ | Set-Content -Path ".\terraform.tfvars" -Encoding ascii
Write-Host "Created terraform.tfvars for account $($identity.Account), Region ap-south-1, SSH source $ip/32."
Write-Host "Review pricing and then run terraform init, fmt, validate, plan."
