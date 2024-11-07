$resourcePack = Join-Path "$($env:LOCALAPPDATA)" "Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\resource_packs\JpizxelRtTextures-main";
$resourcePacks = Join-Path "$($env:LOCALAPPDATA)" "Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\resource_packs";
Write-Host "[JPizxeL RT] Installer";

if (Test-Path -Path $resourcePacks) {
} else {
    Write-Host "[JPizxeL RT] Install failed: Cannot find resource pack folder at $resourcePacks";
	Start-Sleep -Seconds 5
	exit
}

iwr -Uri https://github.com/IImoxi/JpizxelRtTextures/archive/refs/heads/main.zip -OutFile ./main.zip
Expand-Archive -LiteralPath './main.zip' -DestinationPath $resourcePacks -Force
Remove-Item ./main.zip
Write-Host "[JPizxeL RT] Resource pack is now installed.";
Start-Sleep -Seconds 5
exit