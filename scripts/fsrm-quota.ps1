# ============================================================
# FSRM Quota – TechWork Solutions
# Windows Server 2025 Lab Project
# ============================================================

# Check FSRM Quota status
Get-FSRMQuota -Path "D:\Freigaben\Buchhaltung" | Format-List

# List all FSRM Quota templates
Get-FSRMQuotaTemplate | Select-Object Name, Size, SoftLimit | Format-Table -AutoSize

# Check all applied quotas
Get-FSRMQuota | Select-Object Path, Size, Usage, SoftLimit, Template | Format-Table -AutoSize

# Check BitLocker status on F:
manage-bde -status F:

# Check EFS encrypted files
cipher /u /n

# Check Failover Cluster nodes
Get-ClusterNode | Select-Object Name, State | Format-Table -AutoSize

# Check Failover Cluster roles
Get-ClusterGroup | Select-Object Name, State, OwnerNode | Format-Table -AutoSize
