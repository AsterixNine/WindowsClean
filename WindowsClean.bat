@echo off
color 0a
title Otimizador de Sistema - Windows Clean
echo =========================================
echo INICIANDO OTIMIZACAO E LIMPEZA DO SISTEMA
echo =========================================
echo.
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if %errorlevel% NEQ 0 (
    echo Por favor, execute este script como ADMINISTRADOR!
    pause
    exit
)
echo Limpando arquivos temporarios...
del /s /f /q %temp%\*.*
rmdir /s /q %temp%
mkdir %temp%
echo Limpando pasta Prefetch...
del /s /f /q C:\Windows\Prefetch\*.*
echo Limpando cache de Internet...
del /s /f /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*.*"
del /s /f /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*"
echo Limpando lixeira...
rd /s /q %systemdrive%\$Recycle.Bin
echo Limpando arquivos de atualizacao do Windows...
del /s /f /q C:\Windows\SoftwareDistribution\Download\*.*
echo Limpando arquivos de log...
del /s /f /q C:\Windows\Logs\*.*
echo Limpando cache de miniaturas...
del /s /f /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\thumbcache_*"
echo =========================================
echo OTIMIZANDO CONEXAO DE INTERNET
echo =========================================
echo.
echo Liberando cache de DNS...
ipconfig /flushdns
echo Renovando IP...
ipconfig /release
ipconfig /renew
echo Resetando configuracoes de TCP/IP...
netsh int ip reset
echo Resetando Winsock...
netsh winsock reset
echo Ajustando performance de rede...
netsh interface tcp set global autotuninglevel=highlyrestricted
echo =========================================
echo DESABILITANDO SERVIÇOS DESNECESSÁRIOS
echo =========================================
echo.
sc config Spooler start=disabled
sc config DPS start=disabled
sc config WerSvc start=disabled
sc stop DiagTrack
sc config DiagTrack start=disabled
sc config lfsvc start=disabled
sc config WSearch start=disabled
echo =========================================
echo APLICANDO AJUSTES DE SISTEMA
echo =========================================
echo.
echo Diminuindo tempo de desligamento...
reg add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "2000" /f
reg add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f
reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
echo Desabilitando aplicativos em segundo plano...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f
echo Desativando atualizações automáticas (pode reativar depois)...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
echo =========================================
echo FINALIZANDO
echo =========================================
echo.
echo Recomendado: Reinicie o computador para aplicar todas as alterações!
pause
exit
