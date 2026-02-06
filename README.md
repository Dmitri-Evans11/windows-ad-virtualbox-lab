# Windows Active Directory VirtualBox Lab

This project is a hands-on Windows Active Directory lab built using Oracle VirtualBox.
It simulates a small enterprise environment and demonstrates identity management, device inventory,
network design, and security policy implementation using Windows Server and PowerShell automation.

The lab is designed to showcase practical system administration skills, scripting, and documentation
in a controlled, reproducible environment.

---

## Lab Topology

<img
 width="589" height="737" alt="ad-lab-topology" src="https://github.com/user-attachments/assets/99247b5d-40ba-4ae9-864e-e0d9890d3157"
/>

*High-level network topology of the Windows Active Directory VirtualBox lab, illustrating pfSense routing,
Active Directory domain services, and Windows client systems.*

---

## Project Areas

The project is organized into four primary areas. Each section includes scripts, documentation,
and supporting evidence.

### 🔹 User Creation Automation
Automates Active Directory user provisioning using PowerShell and CSV input.

📂 Scripts and Documentation:  
- [User Creation Script](./scripts/create-ad-users.md)

---

### 🔹 Device Inventory Collection
Collects hardware and identity information from domain-joined computers for inventory
and endpoint management preparation.

📂 Scripts and Documentation:  
- [Device Inventory Script](./scripts/device-inventory.md)

---

### 🔹 Network Design
Documents the logical and physical network layout of the lab environment, including
routing, segmentation, and firewall considerations.

📂 Documentation:  
- [Network Design](./evidence-and-documentation/network-design.md)

---

### 🔹 Group Policy and Security
Covers Group Policy Objects (GPOs), security baselines, and policy enforcement
within the Active Directory domain.

📂 Documentation:  
- [Group Policy and Security](./evidence-and-documentation/group-policy-and-security.md)

---

## Lab Environment Overview

- **Hypervisor:** Oracle VirtualBox  
- **Domain Controller:** Windows Server 2019  
- **Clients:** Windows 11  
- **Network Services:** Active Directory Domain Services (AD DS), DNS  
- **Automation:** PowerShell  
- **Security:** Group Policy Objects, domain-based authentication

---

## Goals of This Lab

- Demonstrate enterprise-style Active Directory administration
- Automate repetitive identity and inventory tasks using PowerShell
- Practice documenting infrastructure and security decisions
- Build a portfolio-ready project reflecting real-world IT workflows

---

## Notes

This lab is intended for learning and demonstration purposes.
All scripts are non-destructive and designed to run in a controlled lab environment.
