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
![Network Diagram](architecture/network-diagram.svg)

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
<details>
<summary>View screenshots</summary>

![A1.1](screenshots/A1-active-directory/A1.1.png)
![A1.2](screenshots/A1-active-directory/A1.2.png)

</details>

### A2 – NTFS & Share Permissions
<details>
<summary>View screenshots</summary>

![A2.1](screenshots/A2-ntfs-permissions/A2.1.png)
![A2.2](screenshots/A2-ntfs-permissions/A2.2.png)
![A2.3](screenshots/A2-ntfs-permissions/A2.3.png)

</details>

### A3 – GPO Desktop Wallpaper
<details>
<summary>View screenshots</summary>

![A3.1](screenshots/A3-gpo-wallpaper/A3.1.png)
![A3.2](screenshots/A3-gpo-wallpaper/A3.2.png)

</details>

### A4 – Storage Spaces / Mirror Pool
<details>
<summary>View screenshots</summary>

![A4.1](screenshots/A4-storage-spaces/A4.1.png)

</details>

### A5 – BitLocker & EFS
<details>
<summary>View screenshots</summary>

![A5.1](screenshots/A5-bitlocker-efs/A5.1.png)

</details>

### A6 – Data Deduplication
<details>
<summary>View screenshots</summary>

![A6.1](screenshots/A6-deduplication/A6.1.png)
![A6.2](screenshots/A6-deduplication/A6.2.png)

</details>

### A7 – FSRM Quota
<details>
<summary>View screenshots</summary>

![A7.1](screenshots/A7-fsrm-quota/A7.1.png)

</details>

### A8 – IIS Intranet Website
<details>
<summary>View screenshots</summary>

![A8.1](screenshots/A8-iis-intranet/A8.1.png)
![A8.2](screenshots/A8-iis-intranet/A8.2.png)

</details>

### A9 – Remote Desktop Services
<details>
<summary>View screenshots</summary>

![A9.1](screenshots/A9-rds/A9.1.png)
![A9.2](screenshots/A9-rds/A9.2.png)

</details>

### A10 – Print Server
<details>
<summary>View screenshots</summary>

![A10.1](screenshots/A10-print-server/A10.1.png)
![A10.2](screenshots/A10-print-server/A10.2.png)

</details>

### A11 – Windows Admin Center
<details>
<summary>View screenshots</summary>

![A11.1](screenshots/A11-wac/A11.1.png)
![A11.2](screenshots/A11-wac/A11.2.png)
![A11.3](screenshots/A11-wac/A11.3.png)

</details>

### A12 – Windows Server Backup
<details>
<summary>View screenshots</summary>

![A12.1](screenshots/A12-backup/A12.1.png)

</details>

### A13 ⭐ – Failover Cluster (Bonus)
<details>
<summary>View screenshots</summary>

![A13.1](screenshots/A13-failover-cluster/A13.1.png)
![A13.2](screenshots/A13-failover-cluster/A13.2.png)
![A13.3](screenshots/A13-failover-cluster/A13.3.png)
![A13.4](screenshots/A13-failover-cluster/A13.4.png)
![A13.5](screenshots/A13-failover-cluster/A13.5.png)
![A13.6](screenshots/A13-failover-cluster/A13.6.png)

</details>

---

## 📜 Key PowerShell Commands

<details>
<summary>A1 – Active Directory</summary>

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

# List all OUs
Get-ADOrganizationalUnit -Filter * | Select-Object Name, DistinguishedName | Format-Table -AutoSize

# List all security groups
Get-ADGroup -Filter * | Select-Object Name, GroupScope | Format-Table -AutoSize
```

</details>

<details>
<summary>A2 – NTFS Permissions</summary>

```powershell
# View NTFS permissions for all Freigaben folders
$folders = @("Geschaeftsfuehrung","IT","Buchhaltung","Alle")
foreach ($folder in $folders) {
    $path = "D:\Freigaben\$folder"
    Write-Host "`n========== $folder ==========" -ForegroundColor Cyan
    (Get-Acl $path).Access |
        Where-Object { $_.IdentityReference -notmatch "SYSTEM|CREATOR|Administrators" } |
        Select-Object @{N="Group";E={$_.IdentityReference}},
                      @{N="Permission";E={$_.FileSystemRights}},
                      @{N="Type";E={$_.AccessControlType}} |
        Format-Table -AutoSize
}

# List all network shares
Get-SmbShare | Select-Object Name, Path | Format-Table -AutoSize
```

</details>

<details>
<summary>A4 – Storage Spaces</summary>

```powershell
# Check storage pool
Get-StoragePool | Format-List FriendlyName, OperationalStatus, Size

# Check virtual disk
Get-VirtualDisk | Format-List FriendlyName, ResiliencySettingName, OperationalStatus

# Check volume
Get-Volume | Where-Object {$_.DriveLetter -eq "E"} | Format-List
```

</details>

<details>
<summary>A5 – BitLocker & EFS</summary>

```powershell
# Check BitLocker status
manage-bde -status F:

# Check EFS encrypted files
cipher /u /n
```

</details>

<details>
<summary>A6 – Data Deduplication</summary>

```powershell
# Run manual deduplication job
Start-DedupJob -Volume 'E:' -Type Optimization

# Check deduplication status
Get-DedupStatus | Format-List Volume, SavingsRate, SavedSpace, OptimizedFilesCount
```

</details>

<details>
<summary>A7 – FSRM Quota</summary>

```powershell
# Check quota status
Get-FSRMQuota -Path "D:\Freigaben\Buchhaltung" | Format-List

# List all quota templates
Get-FSRMQuotaTemplate | Select-Object Name, Size, SoftLimit | Format-Table -AutoSize
```

</details>

<details>
<summary>A12 – Windows Server Backup</summary>

```powershell
# Check backup job status
Get-WBJob -Previous 5

# Check backup policy
Get-WBPolicy
```

</details>

<details>
<summary>A13 – Failover Cluster</summary>

```powershell
# Check cluster nodes
Get-ClusterNode | Select-Object Name, State | Format-Table -AutoSize

# Check cluster roles
Get-ClusterGroup | Select-Object Name, State, OwnerNode | Format-Table -AutoSize

# Check cluster shared volumes
Get-ClusterSharedVolume | Format-List

# Check iSCSI target (on TW-STOR1)
Get-IscsiServerTarget | Select-Object TargetName, Status, InitiatorIds
```

</details>
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
