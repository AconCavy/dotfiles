[System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
[System.Console]::InputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")

# PSReadLine
Set-PSReadLineOption -PredictionSource History -PredictionViewStyle ListView -HistoryNoDuplicates

# Terminal-Icons
Import-Module Terminal-Icons
Set-Alias l Get-ChildItem
function Get-ChildItemFormatWide { Invoke-Expression("Get-ChildItem $args | Format-Wide") }
Set-Alias ls Get-ChildItemFormatWide

# Starship
Invoke-Expression (&starship init powershell)
