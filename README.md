# EWB AWS VPC Peering Lab

This standalone Terraform configuration follows the supplied EWB workbook: two VPCs, three subnets, three EC2 instances, one IGW, three explicit route tables, restricted SSH/ICMP rules and optional peering routes.

## Setup
1. Check AWS pricing for three EC2 instances, EBS and public IPv4.
2. Create/download EC2 key pair `ewb-lab` in `ap-south-1` if needed. Keep its private key local and secret.
3. Run `.\Initialize-Lab.ps1` from this folder. It checks the account ID, verifies the key pair and writes `terraform.tfvars` with your current public IPv4 `/32`.
4. Run:
```powershell
terraform init
terraform fmt -recursive
terraform validate
terraform plan
```
Review the plan. Then `terraform apply` to create the baseline. Capture failed ping from App-A to App-B before enabling peering.
5. Change `enable_peering = false` to `true` in `terraform.tfvars`, then run `terraform plan` and `terraform apply`. The same EC2 instances should remain.
6. Capture route, ping, SSH, controlled ICMP failure and recovery evidence in `evidence`.

## Important network limitation
This workbook deliberately has no NAT gateway or internet gateway in VPC B. App-A/App-B can reach each other only after peering routes are added. Do not rely on package installation from the private instances.

## SSH
Use your locally stored PEM key and OpenSSH ProxyJump. Never copy the private key to EC2 or commit it to Git.

## Cleanup
After screenshots are verified, student runs:
```powershell
terraform plan -destroy
terraform destroy
```
Inspect the plan and confirm only this lab will be removed. Check manually created key pairs separately; destroying Terraform does not delete an EC2 key pair created outside Terraform.
