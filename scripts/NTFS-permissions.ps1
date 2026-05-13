# ============================================================
# NTFS Permissions – TechWork Solutions
# Windows Server 2025 Lab Project
# ============================================================

# View NTFS permissions for all Freigaben folders
$folders = @("Geschaeftsfuehrung", "IT", "Buchhaltung", "Alle")

foreach ($folder in $folders) {
    $path = "D:\Freigaben\$folder"
    Write-Host "`n========== $folder ==========" -ForegroundColor Cyan
    (Get-Acl $path).Access |
        Where-Object { $_.IdentityReference -notmatch "SYSTEM|CREATOR|Administrators" } |
        Select-Object @{N="Group";      E={ $_.IdentityReference }},
                      @{N="Permission"; E={ $_.FileSystemRights }},
                      @{N="Type";       E={ $_.AccessControlType }} |
        Format-Table -AutoSize
}

# View all network shares
Get-SmbShare | Select-Object Name, Path, Description | Format-Table -AutoSize

# Test access to a specific share
# Run this from the client machine:
# Test-Path "\\TW-DC01\Buchhaltung"
