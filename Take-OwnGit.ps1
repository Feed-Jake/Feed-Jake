#  Testing THIS
#testing Folder Ownership on \\Servername

$NewAcl = Get-Acl -Path "\\Servername\P$\Profiles\user1\"
# Set properties
    $identity = "DOMAIN\user1"
    $fileSystemRights = "FullControl"
    $type = "Allow"
# Create new rule
    $fileSystemAccessRuleArgumentList = $identity, $fileSystemRights, $type
    $fileSystemAccessRule = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $fileSystemAccessRuleArgumentList
# Apply new rule
    $NewAcl.SetAccessRule($fileSystemAccessRule)
    $UserPath = "\\servername\P$\Profiles\user2\"
    Set-Acl -Path "Microsoft.PowerShell.Core\FileSystem::$UserPath" -AclObject $NewAcl
