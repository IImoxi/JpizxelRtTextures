# JPizxeL RT Textures Installer

# Set paths
$RESOURCE_PACK_FOLDER = "$env:APPDATA\Minecraft Bedrock\Users\Shared\games\com.mojang\resource_packs"
$RESOURCE_PACK = "$RESOURCE_PACK_FOLDER\JpizxelRtTextures-main"
$RESOURCE_PACK_REPO = "https://github.com/IImoxi/JpizxelRtTextures/archive/refs/heads/main.zip"
$TEMP = [System.IO.Path]::GetTempPath()
$TEMP_DESTINATION = Join-Path -Path $TEMP -ChildPath "JpizxelRT.zip"

Write-Host "[JPizxeL RT] Installer for JPizxelRT"
Write-Host "___________________________________________________"

# Check if resource packs directory exists
if (-not (Test-Path -Path $RESOURCE_PACK_FOLDER)) {
    $wshell = New-Object -ComObject WScript.Shell
    $wshell.Popup("[JPizxeL RT] Installer failed! Cannot find resource pack folder at $RESOURCE_PACK_FOLDER. Make sure Minecraft Bedrock edition is installed!", 0, "Error", 16)
    exit
}

# Download
Write-Host "[JPizxeL RT] Starting download... Do not close this window."
$wc = New-Object net.webclient
$wc.Downloadfile($RESOURCE_PACK_REPO, $TEMP_DESTINATION)
Expand-Archive -LiteralPath $TEMP_DESTINATION -DestinationPath $RESOURCE_PACK_FOLDER -Force
Write-Host "[JPizxeL RT] Download complete!"
Remove-Item $TEMP_DESTINATION

# Success
Write-Host "[JPizxeL RT] Complete"
$wshell = New-Object -ComObject WScript.Shell
$wshell.Popup("[JPizxeL RT] Installer Complete! Run Minecraft and go to resource packs to enable it.", 0, "Success", 64)