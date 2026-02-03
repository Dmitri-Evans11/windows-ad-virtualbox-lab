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

### 1. pfSense LAN Interface Configuration

<img
  src="https://github.com/user-attachments/assets/78a9d29f-4eca-44f4-b92e-71a2cb7258c8"
  alt="pfSense LAN IP Configuration"
  width="600"
/>

*pfSense LAN interface configured with IP 10.0.0.1/24, acting as the default gateway for the Active Directory lab network.*


### 2. pfSense DHCP Server Configuration

<img src="https://github.com/user-attachments/assets/f4b6b73c-9129-4482-a031-fb0d6b8e2d35"
     width="600"
     alt="pfSense DHCP Server Configuration" />

*pfSense DHCP server configured with an address pool from 10.0.0.50 to 10.0.0.100 and DNS set to the domain controller (10.0.0.10).*


### 3. Domain Controller Network Configuration

<img src="https://github.com/user-attachments/assets/228e15cb-fe64-4c7d-84bc-dedc8e8381ce"
     width="600"
     alt="DC01 ipconfig showing static IP configuration" />

*Domain Controller (DC01) configured with a static IPv4 address (10.0.0.10), default gateway pointing to pfSense (10.0.0.1), and DNS bound locally for Active Directory.*


### 4. Domain User Authentication (Client Validation)

<img src="https://github.com/user-attachments/assets/5ddfd13e-e2c1-43f9-b2e7-1a0acb6068f1"
     width="600"
     alt="Domain user m.scott authenticated on Windows client" />

*Successful authentication of domain user **m.scott** on a Windows 11 client, confirming Active Directory domain join and user-based authentication.*
