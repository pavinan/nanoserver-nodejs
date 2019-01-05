
Param(
    # Nodejs version
    [Parameter(Mandatory = $true)]
    [string]
    $nodeVersion
)

$downloadURL = "https://nodejs.org/dist/v$nodeVersion/node-v$nodeVersion-win-x64.zip"

Write-Output "nodejs-download-url: $downloadURL"

If(test-path "temp") {
    Get-ChildItem "temp\*" -Recurse  | Remove-Item
    Get-Item "temp" | Remove-Item
}

mkdir "temp"

Invoke-WebRequest -Uri $downloadURL -OutFile "temp\node-v$nodeVersion-win-x64.zip"

Expand-Archive -Path "temp\node-v$nodeVersion-win-x64.zip" -DestinationPath "temp"

Write-Output "Download and extraction completed."