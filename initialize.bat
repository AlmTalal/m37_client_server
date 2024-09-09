@echo off
:: Start Docker Desktop
start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"

:: Wait for Docker to start completely (you can adjust the timeout based on your system)
timeout /t 50 /nobreak

:: Navigate to the folder where docker-compose.yml is located
cd /d C:\Users\almta\OneDrive\Escritorio\Servidor

:: Run the docker-compose up command
docker-compose up
