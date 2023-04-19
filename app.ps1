<#
.SYNOPSIS
    A script to run a Docker application with environment variables.
.PARAMETER SettingsPath
    Path to the settings.json file (default: ./settings.json).
.PARAMETER SSEImagesPath
    Path to the SSE_IMAGES.
.PARAMETER AppPort
    Port for the application (APP_PORT environment variable).
.EXAMPLE
    .\Run-App.ps1 -SettingsPath .\settings.json -SSEImagesPath C:\Images -AppPort 3000
#>

param (
    [Parameter()]
    [string]$SettingsPath = "./settings.json",
    [Parameter(Mandatory = $true)]
    [string]$SSEImagesPath,
    [Parameter()]
    [string]$AppPort = "81"
)

# Load environment variables from .env file
if (Test-Path .env) {
    Get-Content .env | ForEach-Object {
        if ($_ -match '^\s*([^#=]+?)\s*=\s*(.*)$') {
            $name, $value = $matches[1..2]
            Set-Content -Path "env:$name" -Value $value
        }
    }
}

# Check if SSE_IMAGES environment variable exists
if ([string]::IsNullOrEmpty($SSEImagesPath)) {
    if (-not [string]::IsNullOrEmpty($env:SSE_IMAGES)) {
        $SSEImagesPath = $env:SSE_IMAGES
    }
    else {
        Write-Error "Error: SSE_IMAGES must be provided as an argument or set as an environment variable."
        exit 1
    }
}

# Check if APP_PORT is provided as an argument; if not, use the existing environment variable
if ([string]::IsNullOrEmpty($AppPort)) {
    $AppPort = $env:APP_PORT
}

# Validate that APP_PORT is set, either as an argument or as an environment variable
if ([string]::IsNullOrEmpty($AppPort)) {
    Write-Error "Error: APP_PORT must be provided with the -p flag or set as an environment variable."
    exit 1
}

# Read METEOR_SETTINGS from settings file
$METEOR_SETTINGS = Get-Content -Path $SettingsPath -Raw

# Set environment variables
$env:METEOR_SETTINGS = $METEOR_SETTINGS
$env:SSE_IMAGES = $SSEImagesPath
$env:APP_PORT = $AppPort

# Run the docker-compose command
docker compose up
