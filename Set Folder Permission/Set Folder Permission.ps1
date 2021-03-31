$SiteURL = "https://actgroupqa.sharepoint.com/sites/DEV"
Connect-PnPOnline –Url $SiteURL –Credentials (Get-Credential)

$csv = Import-Csv "C:\SP\Add.csv"

foreach($Row in $csv)
{
  $FolderURL = $Row.Folder
  $GroupName = $Row.Group 
  $Permission = $Row.Permission

  Set-PnPFolderPermission -Group $GroupName -Identity $FolderURL -List MyDocuments -AddRole $Permission
}
