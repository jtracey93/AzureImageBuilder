#Script to setup golden image with Azure Image Builder

#Create temp folder
New-Item -Path 'C:\temp' -ItemType Directory -Force | Out-Null

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

# Set Chocolatey Global Config Parameters
choco feature enable -n=allowGlobalConfirmation

# Install Apps Via Chocolately
choco install 7zip
choco install adobereader
choco install git
choco install notepadplusplus
choco install vscode
choco install putty
choco install vlc
choco install winscp
