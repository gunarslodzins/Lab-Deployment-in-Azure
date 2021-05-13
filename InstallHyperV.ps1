<# 
Microsoft Lab Environment
.File Name
 - InstallHyperV.ps1
 
.What calls this script?
 - This is a PowerShell DSC run as a Custom Script extention called by VMdeploy.json

.What does this script do?  
 - Downloads NuGet package provider
    
 - Installs the DscResource and xHyper-V PS modules in support of the upcoming DSC Extenion run in HyperVHostConfig.ps1

 - Installs Hyper-V with all Features and Management Tools and then Restarts the Machine

#>

Set-ExecutionPolicy Unrestricted -Force
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls1
Install-PackageProvider -Name NuGet -Force
Find-Module -Includes DscResource -Name xHyper-v | Install-Module -Force

#Install Hyper-V and Reboot
Install-WindowsFeature -Name Hyper-V `
                       -IncludeAllSubFeature `
                       -IncludeManagementTools `
                       -Verbose `
                       -Restart
