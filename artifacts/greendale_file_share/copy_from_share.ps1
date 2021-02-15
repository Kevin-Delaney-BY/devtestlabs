[CmdletBinding()]
    param(
        [string] $UserName,
        [string] $Password
        #[string] $Description = 'DevTestLab artifact installer',
        #[switch] $Overwrite = $true
        )
 

#$username = "greendale\adm_pat"
#$pass= 'F00tball'
#$password = ConvertTo-SecureString $pass -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential ($username,$password)
$server = "10.10.10.5"
$source = "\\10.10.10.5\greendaleshare\test_file.txt"
$destination = "C:\WorkingFolder"

if (!(Test-Path $destination)) {

    New-Item -ItemType Directory -Path "C:\" -Name "WorkingFolder"

   }




New-PSDrive -Name P -PSProvider Microsoft.Powershell.core\Filesystem -Root "\\$server\greendaleshare" -Credential $credentials

Copy-Item $source -Destination $destination


Remove-PSDrive -Name P 
