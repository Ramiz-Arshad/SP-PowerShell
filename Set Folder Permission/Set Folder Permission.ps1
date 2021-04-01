$SiteURL = "https://actgroupqa.sharepoint.com/sites/DEV"
Connect-PnPOnline –Url $SiteURL –Credentials (Get-Credential)

$csv = Import-Csv "C:\SP\Set Folder Permission\Add.csv"

foreach($Row in $csv)
{
  $ListName = $Row.ListName  
  $FolderURL = $Row.Folder
  $GroupName = $Row.Group 
  $Permission = $Row.Permission

  write-host $FolderURL "-" $GroupName "-" $Permission

  Set-PnPFolderPermission -Group $GroupName -Identity $FolderURL -List $ListName -AddRole $Permission
}
