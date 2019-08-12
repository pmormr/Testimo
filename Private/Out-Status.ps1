﻿function Out-Status {
    param(
        [string] $Text,
        [nullable[bool]] $Status,
        [string] $Section,
        [string] $ExtendedValue,
        [string] $Domain,
        [string] $DomainController
    )
    if ($Status -eq $true) {
        [string] $TextStatus = 'Pass'
        [ConsoleColor[]] $Color = [ConsoleColor]::Cyan, [ConsoleColor]::Green, [ConsoleColor]::Cyan, [ConsoleColor]::Cyan, [ConsoleColor]::Green, [ConsoleColor]::Cyan
    } elseif ($Status -eq $false) {
        [string] $TextStatus = 'Fail'
        [ConsoleColor[]] $Color = [ConsoleColor]::Cyan, [ConsoleColor]::Red, [ConsoleColor]::Cyan, [ConsoleColor]::Cyan, [ConsoleColor]::Red, [ConsoleColor]::Cyan
    } else {
        [string] $TextStatus = 'Informative'
        [ConsoleColor[]] $Color = [ConsoleColor]::Cyan, [ConsoleColor]::DarkGray, [ConsoleColor]::Cyan, [ConsoleColor]::Cyan, [ConsoleColor]::DarkGray, [ConsoleColor]::Cyan
    }
    if ($ExtendedValue) {
        Write-Color -Text ' [', $TextStatus, ']', " [", $ExtendedValue, "]" -Color $Color
    } else {
        Write-Color -Text ' [', $TextStatus, ']' -Color $Color
    }
    if ($Domain -and $DomainController) {
        $TestType = 'Domain Controller'
    } elseif ($Domain) {
        $TestType = 'Domain'
    } elseif ($DomainController) {
        $TestType = 'Should not happen. Find an error.'
    } else {
        $TestType = 'Forest Wide'
    }
    if ($null -ne $Status) {
        $Script:TestResults.Add(
            [PSCustomObject]@{
                Test             = $Text
                TestType         = $TestType
                Section          = $Section
                Domain           = $Domain
                DomainController = $DomainController
                Status           = $Status
                Extended         = $ExtendedValue
            }
        )
    }
}