[CmdletBinding()]
param(
    [Parameter(ParameterSetName='CustomUser')]
    [string] $UserName = 'artifactInstaller',
    [Parameter(ParameterSetName='CustomUser')]
    [string] $Password,
    [int] $PSVersionRequired = 3
)
 

#$username = "greendale\adm_pat"
#$pass= 'F00tball'
$secpassword = ConvertTo-SecureString $password -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential ($username,$secpassword)
$server = "10.10.10.5"
$source = "\\10.10.10.5\greendaleshare\test_file.txt"
$destination = "C:\WorkingFolder"

if (!(Test-Path $destination)) {

    New-Item -ItemType Directory -Path "C:\" -Name "WorkingFolder"

   }




New-PSDrive -Name P -PSProvider Microsoft.Powershell.core\Filesystem -Root "\\$server\greendaleshare" -Credential $credentials

Copy-Item $source -Destination $destination


Remove-PSDrive -Name P 
