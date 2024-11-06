Write-Host "[JPizxeL RT] Installer/Updater";
iwr -Uri https://github.com/IImoxi/JpizxelRtTextures/archive/refs/heads/main.zip -OutFile ./main.zip
$appdata = [Environment]::GetFolderPath('ApplicationData')
$resourcePacks = Join-Path $appdata "Local\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\resource_packs";
Expand-Archive -LiteralPath './main.zip' -DestinationPath $resourcePacks
Remove-Item ./main.zip
Write-Host "[JPizxeL RT] Resource pack is now installed.";
Start-Sleep -Seconds 5
exit