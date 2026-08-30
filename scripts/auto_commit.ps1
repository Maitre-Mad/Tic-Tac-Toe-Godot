# Auto-Commit script for Tic-Tac-Toe Godot Project
param(
    [string]$CommitMessage = "auto: periodic project commit"
)

# Ensure Git credentials match GitHub activity account
git config user.name "Maitre-Mad"
git config user.email "dickomahamane.md@gmail.com"

# Check for modified or untracked files
$status = git status --porcelain
if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Host "No changes detected to commit." -ForegroundColor Yellow
} else {
    Write-Host "Staging changes..." -ForegroundColor Green
    git add -A
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $msg = "$CommitMessage ($timestamp)"
    
    Write-Host "Creating commit with user identity Maitre-Mad <dickomahamane.md@gmail.com>..." -ForegroundColor Green
    git commit -m "$msg"
    
    Write-Host "Pushing to GitHub (origin main)..." -ForegroundColor Green
    git push origin main
}
