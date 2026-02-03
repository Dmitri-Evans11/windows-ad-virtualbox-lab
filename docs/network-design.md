# VirtualBox Network Design

## Goal
Design a simple, predictable network layout for an Active Directory lab that allows domain-joined clients to communicate while remaining isolated from the host network.

## Network Types Used
- **NAT**: Provides internet access to the outside for updates
- **Internal Netowrk**: Allows VM to VM communication for the lab

## Planned Networks
### Internal Network: AD_LAB
- Domain Controller
- Windows Client 1
- Windows Client 2
- pfSense firewall/router (LAN interface)

### NAT Network
- pfSense (WAN interface)

## Topology Overview
pfSense acts as the central router with:
- WAN interface connected to NAT for internet access
- LAN interface connected to the AD_LAB internal network

ALL domain joined systems reside on the LAN network and route traffic through pfSense.

## IP Addressing Plan
- Network: 10.0.0.0/24
- Domain Controller: 10.0.0.10
- DHCP Scope: 10.0.0.50 - 10.0.0.100
- Default Gateway: 10.0.0.1 (pfSense LAN)
- DNS Server: 10.0.0.10 (Domain Controler)

## DNS and DHCP Design
- pfSense provides DHCP services to the LAN
- DHCP assigns the Domain Controler (10.0.0.10) as the DNS server
- pf Sense does not act as the primary DNS server for clients
- This design ensure proper Active Directory name resolution and domain authentication

## Validation Critieria
- Clients receive IP addresses via DHCP
- Clients can resolve the domain name
- Clients can acces the internet through pfSense

## Evidence

### pfSense LAN Interface Configuration

<img
  src="https://github.com/user-attachments/assets/78a9d29f-4eca-44f4-b92e-71a2cb7258c8"
  alt="pfSense LAN IP Configuration"
  width="600"
/>



