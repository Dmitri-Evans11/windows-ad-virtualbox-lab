# VirtualBox Network Design

## Goal
Design a simple, predictable network layout for an Active Directory lab that allows domain-joined clients to communicate while remaining isolated from the host network.

## Network Types Used
- **NAT**: Provides internet access to the outside for updates
- **Internal Netowrk**: Allows VM to VM communication for the lab

## Planned Networks
###Internal Network: AD_LAB
- Domain Controller
- Windows Client 1
- Windows Client 2
- pfSense firewall/router (LAN interface)

  ###NAT Network
  - pfSense (WAN interface)
 
##IP Addressing Plan
- Network: 10.0.0.0/24
- Domain Controller: 10.0.0.10
- DHCP Scope: 10.0.0.50 - 10.0.0.100
- Default Gateway: 10.0.0.1 (pfSense LAN)
- DNS Server: 10.0.0.10 (Domain Controler)

## Validation Critieria
- Clients receive IP addresses via DHCP
- Clients can resolve the domain name
- Clients can acces the internet through pfSense
