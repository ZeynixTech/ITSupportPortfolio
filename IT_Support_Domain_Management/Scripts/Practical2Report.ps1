# Part D PowerShell Script
$reportFolder = "$HOME\Reports"
$reportFile = "$reportFolder\Practical2Report.log"

# Check if Reports folder exists
if (!(Test-Path $reportFolder)) {
    New-Item -ItemType Directory -Path $reportFolder
}

# Report Header
$title = "PRINTER REPORT"
$date = Get-Date
$server = $env:COMPUTERNAME
$user = $env:USERNAME

$title | Out-File -FilePath $reportFile
"Date: $date" | Out-File -Append -FilePath $reportFile
"Server: $server" | Out-File -Append -FilePath $reportFile
"User: $user" | Out-File -Append -FilePath $reportFile
"" | Out-File -Append -FilePath $reportFile

# Get Printer Info
Get-Printer | Format-Table Name, PortName, Shared -AutoSize | Out-String | Out-File -Append $reportFile

# Confirmation Message
Write-Host "Report has been created at $reportFile"
