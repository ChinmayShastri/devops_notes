# AWS VPC (Amazon Virtual Private Cloud)

## Overview
- **Definition:** A VPC is a virtual network dedicated to your AWS account, logically isolated from other virtual networks in the AWS Cloud.
- **Purpose:** To provide control over a virtual networking environment, including selection of IP address range, creation of subnets, and configuration of route tables and network gateways.

## Key Components

### Subnets
- **Public Subnets:** Accessible from the internet.
- **Private Subnets:** Not directly accessible from the internet.
- **Subnet CIDR Blocks:** Define the IP address range for the subnet.

### Route Tables
- **Main Route Table:** Default route table for a VPC.
- **Custom Route Tables:** Can be created for specific subnets to define routing rules.
- **Routes:** Define the traffic destinations and the paths.

### Internet Gateway (IGW)
- **Purpose:** Enables communication between instances in your VPC and the internet.
- **Attachment:** Attach to the VPC to route traffic to/from the internet.

### NAT Gateway / NAT Instances
- **NAT Gateway:** Managed service for outbound internet traffic from private subnets.
- **NAT Instance:** Custom EC2 instance acting as a gateway for outbound traffic.

### VPC Peering
- **Purpose:** Connects two VPCs for direct routing between them.
- **Usage:** Allows resources in different VPCs to communicate with each other.

### VPN Connections
- **AWS Site-to-Site VPN:** Securely connects your on-premises network to your VPC.
- **Customer Gateway:** Represents your physical device or software application on your side of the VPN connection.
- **Virtual Private Gateway:** The AWS end of the VPN connection.

### VPC Endpoints
- **Gateway Endpoints:** For S3 and DynamoDB, enables private connection to these services.
- **Interface Endpoints:** Uses AWS PrivateLink to connect to AWS services and VPC endpoint services.

### Security Groups and Network ACLs
- **Security Groups:** Virtual firewalls for controlling inbound and outbound traffic at the instance level.
- **Network ACLs:** Stateless, network-level firewall for controlling traffic in and out of subnets.

### Bastion Host
- **Purpose:** Provides secure access to instances in private subnets via SSH or RDP.

## Best Practices
- **Network Segmentation:** Use multiple subnets to isolate different parts of your application.
- **Security:** Apply the principle of least privilege for security groups and network ACLs.
- **High Availability:** Use multiple Availability Zones for redundancy.
- **Monitoring:** Enable VPC Flow Logs to capture information about IP traffic going to and from network interfaces.

## Common Use Cases
- **Hosting web applications:** Isolate public and private subnets for web servers and databases.
- **Hybrid cloud environments:** Extend on-premises networks to the cloud.
- **Data privacy:** Create isolated environments to meet regulatory requirements.

## Key Points to Remember
- VPC allows you to create a logically isolated network in the AWS Cloud.
- Subnets can be public or private, and they are defined by CIDR blocks.
- Internet Gateways and NAT Gateways facilitate internet access for VPC resources.
- Security Groups and Network ACLs help in managing access control.
- VPC Peering and VPN connections enable communication between VPCs and on-premises networks.