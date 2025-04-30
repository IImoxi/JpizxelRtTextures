@echo off
:: Fast GitHub ZIP Downloader - JPizxeL RT Textures
setlocal
set "RESOURCE_PACK_FOLDER=%LOCALAPPDATA%\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\resource_packs"
set "RESOURCE_PACK=%RESOURCE_PACKS%\JpizxelRtTextures-main"
set "RESOURCE_PACK_REPO=https://github.com/IImoxi/JpizxelRtTextures/archive/refs/heads/main.zip"
set "TEMP_ZIP=%TEMP%\JpizxelRT_%time:~0,2%%time:~3,2%%time:~6,2%.zip"

echo [JPizxeL RT] Installer


:: Check if resource packs directory exists
if not exist "%RESOURCE_PACK_FOLDER%" (
    echo msgbox "[JPizxeL RT] Installer failed: Cannot find resource pack folder at %RESOURCE_PACK_FOLDER%. Make sure minecraft Bedrock edition is installed!" > %tmp%\tmp.vbs
	cscript /nologo %tmp%\tmp.vbs
	del %tmp%\tmp.vbs
	exit /b 0
)
:: Check if resource packs directory exists


:: Download the pack
where curl >nul 2>&1
if %errorlevel% equ 0 (
    echo [JPizxeL RT] Using fastest available downloader #1...
	curl -L -o "%TEMP_ZIP%" "%RESOURCE_PACK_REPO%" --connect-timeout 10 --retry 1
	if %errorlevel% equ 0 goto download_pass
)

echo [JPizxeL RT] Using fallback downloader...
powershell -nologo -noprofile -command "Invoke-WebRequest '%RESOURCE_PACK_REPO%' -OutFile '%TEMP_ZIP%' -UseBasicParsing -TimeoutSec 30"
if %errorlevel% neq 0 (
	echo msgbox "[JPizxeL RT] Installer failed: Check your internet connection..." > %tmp%\tmp.vbs
	cscript /nologo %tmp%\tmp.vbs
	del %tmp%\tmp.vbs
	exit /b 0
)
:: Download the pack

:download_pass

:: Install the pack
if exist "%RESOURCE_PACK%" (
    rmdir /s /q "%RESOURCE_PACK%"
)
powershell -nologo -noprofile -command "Expand-Archive -LiteralPath '%TEMP_ZIP%' -DestinationPath '%RESOURCE_PACK_FOLDER%' -Force"
:: Install the pack

:finish
echo msgbox "[JPizxeL RT] Installer Complete! Run minecraft and go to resource packs to enable it." > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
exit /b 0