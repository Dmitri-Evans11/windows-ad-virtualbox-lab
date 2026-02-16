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





---

## Concepts Demonstrated

- Least Privilege  
- Role-Based Access Control  
- Authentication vs Authorization  
- Domain Controller Hardening  
- Security Log Analysis
