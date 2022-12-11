Import-Module ServerManager; 
Import-Module AWSPowerShell;

Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName 'IIS-WebServerRole', 'IIS-WebServer', 'IIS-ManagementConsole';
Install-WindowsFeature -IIS Web-Server -IncludeManagementTools

Set-Location \inetpub\wwwroot         
remove-item iisstart.*   
New-Item index.html 
$filename = 'index.html'
Add-Content $filename "<h2><b>"hello world"</b></h2>"
$instance = "v1"
Get-EC2Instance $instance | Stop-EC2Instance -Terminate
Remove-EC2KeyPair SecretKey.pem
Remove-EC2SecurityGroup -GroupName Security-nbl
