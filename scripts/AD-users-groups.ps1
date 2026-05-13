# ============================================================
# AD Users & Groups – TechWork Solutions
# Windows Server 2025 Lab Project
# ============================================================

# View all domain users and their group memberships
Get-ADUser -Filter * -Properties MemberOf |
    Where-Object { $_.Name -in ("Maria Huber", "Thomas Berger", "Sandra Wagner") } |
    ForEach-Object {
        [PSCustomObject]@{
            User   = $_.Name
            Groups = ($_.MemberOf | ForEach-Object {
                ($_ -split ',')[0] -replace 'CN='
            }) -join ' | '
        }
    } | Format-Table -AutoSize

# List all OUs
Get-ADOrganizationalUnit -Filter * | Select-Object Name, DistinguishedName | Format-Table -AutoSize

# List all security groups
Get-ADGroup -Filter * | Select-Object Name, GroupScope, GroupCategory | Format-Table -AutoSize

# List all users in a specific group
Get-ADGroupMember -Identity "GG_IT_Admin" | Select-Object Name, SamAccountName
