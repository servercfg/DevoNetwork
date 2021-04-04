@echo off
@title Server #1
:iniServer
echo.
echo DEVONETWORK
echo.
echo.
echo Initiating Server 1 [Port:30001]
echo %date%
echo.
echo %time% : Searching for Cache...
rmdir /S /Q cache
timeout /t 2 >nul
echo %time% : Cache Cleared!
echo %time% : Starter serveren
FXServer +set citizen_dir %~dp0\citizen\ +exec server.cfg
echo %time% : Server was shut down..
timeout /t 2 >nul
echo %time% : Prøver at genstarte serveren...
timeout /t 3 >nul
echo.
goto iniServer