Param(
    [Hashtable]$parameters
)

Write-Host $parameters.project
Write-Host $parameters.projectName
$parameters.RepoSettings | Out-Host
$parameters.ProjectSettings | Out-Host
$parameters.Context.ToUpper() | Out-Host
