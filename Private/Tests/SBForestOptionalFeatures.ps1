﻿$Script:SBForestOptionalFeatures = {
    # Imports all commands / including private ones from PSWinDocumentation.AD
    $ADModule = Import-Module PSWinDocumentation.AD -PassThru
    & $ADModule { Get-WinADForestOptionalFeatures -WarningAction SilentlyContinue }
}
<#
$Script:SBForestOptionalFeaturesTest1 = {
    Test-Value -TestName 'Recycle Bin Enabled' -Property 'Recycle Bin Enabled' @args
}
$Script:SBForestOptionalFeaturesTest2 = {
    Test-Value -TestName 'LAPS Schema Extended' -Property 'Laps Enabled' @args
}
$Script:SBForestOptionalFeaturesTest3 = {
    Test-Value -TestName 'Privileged Access Management Enabled' -Property 'Privileged Access Management Feature Enabled' @args
}
#>