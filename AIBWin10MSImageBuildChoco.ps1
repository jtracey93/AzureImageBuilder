#Script to setup golden image with Azure Image Builder

#Create temp folder
New-Item -Path 'C:\temp' -ItemType Directory -Force | Out-Null

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

# Set Chocolatey Global Config Parameters
choco feature enable -n=allowGlobalConfirmation

# Install Apps Via Chocolately
chco install 7zip
chco install adobereader
chco install git
chco install notepadplusplus
chco install vscode
chco install putty
chco install vlc
chco install winscp
chco install pwsh