# AWS Load Balancing

## Overview
- **Definition:** AWS Load Balancing automatically distributes incoming application traffic across multiple targets, such as EC2 instances, containers, IP addresses, and Lambda functions.
- **Purpose:** To increase the availability and fault tolerance of your applications by spreading traffic across multiple targets.

## Types of AWS Load Balancers
- **Application Load Balancer (ALB):**
  - Best suited for HTTP and HTTPS traffic.
  - Operates at the application layer (OSI model Layer 7).
  - Supports advanced request routing based on URL, hostname, HTTP headers, and more.
- **Network Load Balancer (NLB):**
  - Best suited for TCP, UDP, and TLS traffic.
  - Operates at the transport layer (OSI model Layer 4).
  - Capable of handling millions of requests per second with ultra-low latencies.
- **Gateway Load Balancer (GWLB):**
  - Used for deploying, scaling, and managing third-party virtual appliances.
  - Operates at the network layer (OSI model Layer 3).
- **Classic Load Balancer (CLB):**
  - Older generation load balancer.
  - Supports both HTTP/HTTPS and TCP traffic.
  - Operates at both the application and transport layers (OSI model Layers 4 and 7).

## Key Features
- **Health Checks:** Regularly monitors the health of registered targets and ensures traffic is only sent to healthy instances.
- **SSL Termination:** Manages SSL certificates for secure connections and offloads SSL termination from application servers.
- **Sticky Sessions:** Ensures that a user's session is consistently routed to the same target instance.
- **Cross-Zone Load Balancing:** Distributes traffic evenly across all registered instances in all enabled Availability Zones.
- **Auto Scaling Integration:** Works seamlessly with Auto Scaling to ensure the right number of instances to handle the load.

## Common Use Cases
- **Web Applications:** Distribute incoming web traffic across multiple EC2 instances to improve availability and fault tolerance.
- **Microservices Architectures:** Route requests to different services or containers based on URL paths.
- **Hybrid Environments:** Distribute traffic between on-premises servers and cloud-based instances.
- **Disaster Recovery:** Route traffic to instances in different regions for disaster recovery and failover.

## Best Practices
- **Enable Health Checks:** Ensure that only healthy instances receive traffic.
- **Use Auto Scaling:** Combine load balancers with Auto Scaling groups to handle varying levels of traffic.
- **Secure Connections:** Use SSL/TLS to secure connections between clients and load balancers.
- **Monitor and Analyze:** Utilize AWS CloudWatch to monitor metrics and set up alarms for unusual patterns.
- **Optimize Costs:** Use the appropriate load balancer type for your specific use case to manage costs effectively.

## Key Points to Remember

- **AWS Load Balancing improves application availability and fault tolerance.**
- **Choose the right type of load balancer:** ALB for HTTP/HTTPS, NLB for TCP/UDP, and CLB for legacy applications.
- **Enable health checks:** Ensure that only healthy instances receive traffic.
- **Integrate with Auto Scaling:** Automatically adjust capacity to handle varying levels of traffic.
- **Secure connections:** Use SSL/TLS to protect data in transit.
- **Monitor performance:** Utilize AWS CloudWatch for monitoring metrics and setting up alarms.
