# 🖥️ Windows Server 2025 –  Lab Project

![Windows Server 2025](https://img.shields.io/badge/Windows%20Server-2025-0078D4?style=flat-square&logo=windows&logoColor=white)
![Active Directory](https://img.shields.io/badge/Active%20Directory-Domain%20Services-0078D4?style=flat-square&logo=microsoft&logoColor=white)
![VMware](https://img.shields.io/badge/VMware-Workstation%2025-607078?style=flat-square&logo=vmware&logoColor=white)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1-5391FE?style=flat-square&logo=powershell&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-success?style=flat-square)

> A fully functional Windows Server 2025 infrastructure built from scratch in a virtualized environment.  
> Covers Active Directory, Group Policy, Storage, Security, IIS, RDS, Failover Clustering and more.

---

## 📋 Project Overview

This lab simulates a real-world IT infrastructure for a small company — **TechWork Solutions GmbH** (Wien, Austria).  
All tasks were completed on **Windows Server 2025** running inside **VMware Workstation** on a Linux host.

| Detail | Value |
|--------|-------|
| 🏢 Scenario | TechWork Solutions GmbH – Wien |
| 🌐 Domain | techwork.local |
| 🖥️ Host OS | Ubuntu 24 (Linux) |
| ⚙️ Hypervisor | VMware Workstation Pro 25 |
| 🪟 Guest OS | Windows Server 2025 Standard Evaluation |
| 📅 Completed | May 2026 |

---

## 🏗️ Lab Architecture

```
VMware NAT Network: 192.168.100.0/24
│
├── TW-DC01        192.168.100.10   Domain Controller, DNS, DHCP, IIS, RDS, Print Server
├── TW-CLIENT01    192.168.100.50+  Windows 11 Pro – Domain Client
├── TW-CL1         192.168.100.21   Failover Cluster Node 1
├── TW-CL2         192.168.100.22   Failover Cluster Node 2
└── TW-STOR1       192.168.100.30   iSCSI Shared Storage
```

---

## ✅ Completed Tasks

| # | Task | Topic | Status |
|---|------|-------|--------|
| A1 | Active Directory Structure | AD DS, OUs, Users, Groups | ✅ |
| A2 | NTFS & Share Permissions | File Server, Security Groups | ✅ |
| A3 | GPO – Desktop Wallpaper | Group Policy, Computer Config | ✅ |
| A4 | Storage Spaces / RAID-1 | Mirror Pool, Virtual Disk | ✅ |
| A5 | BitLocker & EFS | Drive Encryption, File Encryption | ✅ |
| A6 | Data Deduplication | Storage Optimization (79% savings) | ✅ |
| A7 | FSRM Quota | File Server Resource Manager | ✅ |
| A8 | IIS – Intranet Website | Web Server, Port 8080 | ✅ |
| A9 | Remote Desktop Services | RDS Session Host, RDP | ✅ |
| A10 | Print Server | TCP/IP Network Printer | ✅ |
| A11 | Windows Admin Center | Web-based Server Management | ✅ |
| A12 | Windows Server Backup | Manual + Scheduled Backup | ✅ |
| A13 ⭐ | Failover Cluster (Bonus) | iSCSI, CSV, HA File Server | ✅ |

---

## 🔧 Technologies Used

- **Active Directory Domain Services (AD DS)**
- **Group Policy Objects (GPO)**
- **NTFS Permissions & Share Management**
- **Windows Storage Spaces (Mirror/RAID-1)**
- **BitLocker Drive Encryption & EFS**
- **Data Deduplication**
- **File Server Resource Manager (FSRM)**
- **Internet Information Services (IIS)**
- **Remote Desktop Services (RDS)**
- **Print and Document Services**
- **Windows Admin Center (WAC)**
- **Windows Server Backup**
- **Failover Clustering with iSCSI Shared Storage**
- **PowerShell (automation & verification)**

---

## 📁 Repository Structure

```
windows-server-2025-final-project/
├── README.md
├── architecture/
│   └── network-diagram.png
├── screenshots/
│   ├── A1-active-directory/
│   ├── A2-ntfs-permissions/
│   ├── A3-gpo-wallpaper/
│   ├── A4-storage-spaces/
│   ├── A5-bitlocker-efs/
│   ├── A6-deduplication/
│   ├── A7-fsrm-quota/
│   ├── A8-iis-intranet/
│   ├── A9-rds/
│   ├── A10-print-server/
│   ├── A11-wac/
│   ├── A12-backup/
│   └── A13-failover-cluster/
└── scripts/
    ├── AD-users-groups.ps1
    ├── NTFS-permissions.ps1
    ├── deduplication-test.ps1
    └── fsrm-quota.ps1
```

---

## 🖼️ Screenshots

### A1 – Active Directory Structure
> OU hierarchy, user accounts and group memberships

### A4 – Storage Spaces / Mirror Pool
> Storage pool with 2 physical disks, VDisk-Mirror layout

### A6 – Data Deduplication
> 79% savings rate achieved on Mirror-Data (E:\)

### A13 – Failover Cluster
> TW-CLUSTER with iSCSI shared storage – failover test: CL1 offline, role moved to CL2

---

## 📜 Key PowerShell Commands

```powershell
# View AD users and group memberships
Get-ADUser -Filter * -Properties MemberOf | Where-Object {
    $_.Name -in ("Maria Huber","Thomas Berger","Sandra Wagner")
} | ForEach-Object {
    [PSCustomObject]@{
        User   = $_.Name
        Groups = ($_.MemberOf | ForEach-Object { ($_ -split ',')[0] -replace 'CN=' }) -join ' | '
    }
} | Format-Table -AutoSize

# Check Data Deduplication status
Get-DedupStatus | Format-List

# Check FSRM Quota
Get-FSRMQuota -Path "D:\Freigaben\Buchhaltung" | Format-List

# Check Failover Cluster nodes
Get-ClusterNode

# Check BitLocker status
manage-bde -status F:
```

---

## 🌍 About This Project

This project was completed as the **final project (Abschlussprojekt)** of a Windows Server 2025 course.  
The goal was to simulate a realistic IT infrastructure deployment for a small Austrian company,  
covering all major Windows Server administration topics in a hands-on lab environment.

---

## 📬 Contact

Feel free to connect on [LinkedIn](https://linkedin.com) or reach out via GitHub Issues.

---

*Built with 💙 on Ubuntu + VMware + Windows Server 2025*
