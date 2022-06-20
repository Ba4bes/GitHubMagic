# Count the files in the directory



# If Else
$Files = Get-ChildItem -Recurse -File
if ($Files.count -gt 5) {
    Write-Host "There are more than 5 files in this directory"
}
