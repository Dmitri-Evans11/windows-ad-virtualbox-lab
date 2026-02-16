# Ticket 001 – Enforcing Least Privilege on a Domain Controller

## Summary

Tested and validated least privilege enforcement by restricting interactive logon access to the Domain Controller for a standard domain user.

---

## Environment

- DC01 – Windows Server 2019
- Windows 11 domain-joined client
- VirtualBox lab environment

---

## Actions Performed

1. Created domain user `k.malone`
2. Enforced password change at first logon
3. Added user to **Deny log on locally** on DC01
4. Ran `gpupdate /force`
5. Attempted interactive logon to DC01

---

## Result

Login failed with:

> “The user has not been granted the requested logon type at this machine.”

Security Log on DC01 recorded:

- Event ID: 4625  
- Status Code: 0xC000015B  
- Logon Type: 2 (Interactive)

Authentication succeeded. Authorization was denied due to User Rights Assignment policy.

User successfully authenticated on a domain workstation, confirming restriction was scoped specifically to the Domain Controller.

---

## Evidence

<p align="center">
  <img src="https://github.com/user-attachments/assets/de2f76f3-22c5-4ce6-9a7c-ba41e7b934de" width="512">
</p>

<p align="center">
<img width="512" height="769" alt="ticket001-p5" src="https://github.com/user-attachments/assets/73e6937f-c26f-4861-9cdb-a57398f617c9" />
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/1381c85d-74a4-4fac-803c-3e9296356020" width="512">
</p>


<p align="center">
<img width="512" height="765" alt="ticket001-p9" src="https://github.com/user-attachments/assets/78c00f3d-3561-4807-9433-16214ad71c41" />
</p>

<p align="center">
<img width="512" height="768" alt="ticket001-p4" src="https://github.com/user-attachments/assets/efff7ca6-988c-424b-96b0-497297d3cd33" />
</p>
---

## Concepts Demonstrated

- Least Privilege  
- Role-Based Access Control  
- Authentication vs Authorization  
- Domain Controller Hardening  
- Security Log Analysis
