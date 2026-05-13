# ============================================================
# Data Deduplication – TechWork Solutions
# Windows Server 2025 Lab Project
# ============================================================

# Create test files for deduplication testing
$content = "This is a deduplication test file. TechWork Solutions GmbH. " * 3500000
1..5 | ForEach-Object {
    Set-Content -Path "E:\dedup-test-$_.txt" -Value $content
    Write-Host "Created: dedup-test-$_.txt" -ForegroundColor Green
}

# Run manual deduplication job
Start-DedupJob -Volume 'E:' -Type Optimization

# Wait for job to complete
Write-Host "Waiting for deduplication job to complete..." -ForegroundColor Yellow
while ((Get-DedupJob).State -eq "Running") {
    Start-Sleep -Seconds 10
    Write-Host "." -NoNewline
}

# Check deduplication status
Write-Host "`n`n=== Deduplication Status ===" -ForegroundColor Cyan
Get-DedupStatus | Format-List Volume, SavingsRate, SavedSpace, OptimizedFilesCount, LastOptimizationResult
