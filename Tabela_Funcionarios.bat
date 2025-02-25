@echo off
REM Inicia o json-server em um novo terminal
start cmd /k "json-server --watch database.json --port 3000"

REM Aguarda 5 segundos para garantir que o json-server esteja em execução
timeout /t 5 /nobreak

REM Executa o aplicativo Flutter
flutter run