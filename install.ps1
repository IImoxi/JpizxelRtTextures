Write-Host "[JPizxeL RT] Installer/Updater";
iwr -Uri https://github.com/IImoxi/JpizxelRtTextures/archive/refs/heads/main.zip -OutFile ./main.zip
$resourcePacks = Join-Path "$($env:LOCALAPPDATA)" "Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\resource_packs";
Expand-Archive -LiteralPath './main.zip' -DestinationPath $resourcePacks -Force
Remove-Item ./main.zip
Write-Host "[JPizxeL RT] Resource pack is now installed.";
Start-Sleep -Seconds 5
exit