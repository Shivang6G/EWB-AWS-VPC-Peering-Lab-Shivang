# EWB AWS VPC Peering Lab — Evidence Index

This folder contains selected screenshots from the submitted screenshot collection, renamed and ordered for a project submission.

## Included evidence

- **01-vpcs-and-cidr-ranges.png** — VPC list showing VPC A and VPC B with their CIDR ranges.
- **02-subnets.png** — Subnet inventory in the AWS VPC console.
- **03-route-tables.png** — Route table inventory in the AWS VPC console; detailed route entries may need a closer individual view if requested.
- **04-vpc-peering-active.png** — Peering details showing Active status, requester/accepter VPCs and CIDRs.
- **05-ec2-instances-private-workloads.png** — Three running EC2 instances; App-A and App-B have no public IPv4 listed.
- **06-bastion-instance-details.png** — Bastion instance details with public and private IPv4 addresses.
- **07-terraform-apply-complete.png** — Terraform apply completion and output values for the lab resources.
- **08-app-a-to-app-b-ping.png** — Successful ping from App-A (10.10.2.10) to App-B (10.20.1.10), four replies and 0% packet loss.
- **09-app-b-to-app-a-ping.png** — Successful ping from App-B (10.20.1.10) to App-A (10.10.2.10), four replies and 0% packet loss; the terminal also shows SSH via the bastion.

## Evidence gaps to be aware of

- The supplied collection does not clearly show a baseline ping failure before peering.
- It does not clearly show the required controlled ICMP-rule failure followed by recovery.
- A dedicated, readable security-group rules screenshot was not selected from this collection.
- The route-table screenshot is an inventory view; if your evaluator requires route targets and CIDRs to be legible, capture each relevant route table's Routes tab.

Do not describe any missing test as completed. The two-way ping screenshots are positive connectivity evidence only.

## Safety

These screenshots are provided as evidence only. Do not add the SSH private key (`*.pem`), Terraform state (`*.tfstate*`), local `terraform.tfvars`, or the `.terraform/` directory to a public repository.
