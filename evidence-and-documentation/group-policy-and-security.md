
# Group Policy and Security Evidence

## Purpose
This document provides evidence of Group Policy Objects (GPOs) and security controls implemented in the VirtualBox Active Directory lab. The goal is to demonstrate centralized user management, workstation restrictions, and baseline security enforcement.


## Environment Overview
- **Domain:** d.evans.adlab
- **Domain Controller:** DC01 (Windows Server 2019)
- **Clients:** Windows 11 domain-joined workstations
- **Policy Management:** Group Policy Management Console (GPMC)


## Group Policy Structure

Group Policy Objects are linked at the domain and Organizational Unit (OU) level to control both user and computer behavior. 


### 1. Group Policy Application Verification (RSOP)

<img
  src="https://github.com/user-attachments/assets/8312476f-eb82-4ecc-989f-843d29cab9c9"
  alt="RSOP showing applied Group Policies for domain user m.scott"
  width="600"
/>

*Resultant Set of Policy (RSOP) output confirming that domain user **m.scott** successfully received and applied Group Policy Objects from DC01, including control panel restrictions and mapped network drives.*


### 2. Control Panel Restriction Enforcement

<img
  src="https://github.com/user-attachments/assets/df4e76b8-1dea-4e77-b0f8-c86a6a5d7102"
  alt="Control Panel access blocked by Group Policy for domain user"
  width="600"
/>

*Domain user **m.scott** is prevented from accessing the Control Panel due to Group Policy restrictions, confirming successful enforcement of user-level security policies applied via Active Directory.*

<img width="1088" height="912" alt="mapped-z-drive-m scott-p6" src="https://github.com/user-attachments/assets/3800f7bb-423b-4350-bfa4-2f5363f08de6" />


### 3. Group Policy Drive Mapping (Z: Drive)

<img
  src="https://github.com/user-attachments/assets/3800f7bb-423b-4350-bfa4-2f5363f08de6"
  alt="Mapped company Z drive visible for domain user m.scott"
  width="600"
/>

*Domain user **m.scott** successfully receives a mapped network drive (**Z:** – Company Share) via Group Policy, confirming user-based drive mapping and logon policy execution.*


### 4. Domain Password Policy Enforcement

<img
  src="https://github.com/user-attachments/assets/032480ff-7a36-47a7-b3d3-ed8b0e4d8efd"
  alt="Active Directory domain password policy configured via Group Policy"
  width="600"
/>

*Domain password policy configured through Group Policy, enforcing password history, minimum length, maximum age, and complexity requirements for all domain users.*
