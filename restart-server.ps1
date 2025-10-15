# This script restarts the Jekyll Docker container.
# It ensures changes to _config.yml and other files are applied.

$ComposeFile = Join-Path $PSScriptRoot "docker-compose.yaml"

Write-Host "Stopping the server..."
docker compose -f $ComposeFile down

Write-Host "Starting the server in the background..."
docker compose -f $ComposeFile up -d

Write-Host "Server is restarting. Please wait a few moments for it to become available at http://localhost:4000"
