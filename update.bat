@echo off
echo [*] Checking for Packwiz...
where packwiz >nul 2>nul || (
    echo [!] Packwiz not found. Installing...
    curl -sSL https://packwiz.infra.link/install.bat | cmd
)

REM === Set modpack source ===
SET PACKWIZ_URL=https://raw.githubusercontent.com/KavisCorea/Coalition-of-Chaos/master/pack.toml

echo [*] Setting up modpack...
if not exist pack.toml (
    echo [*] Downloading pack.toml...
    curl -L -o pack.toml %PACKWIZ_URL%
)

echo [*] Updating modpack...
packwiz update

echo [*] Launching Minecraft...
packwiz serve
pause