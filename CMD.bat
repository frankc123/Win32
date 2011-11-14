@ECHO off
:start
cls
ECHO.
Echo **********	USE AT YOUR OWN RISK **********
ECHO Pick witch system to install
ECHO.
ECHO 1. Ubuntu
ECHO Q. Quit
set choice=
set /p choice=What do you want to do? 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto op5
if '%choice%'=='Q' goto end
if '%choice%'=='q' goto end
ECHO "%choice%" is not valid, try again
goto start

:op5
cls
cd files
Echo You are about to install Ubuntu. USE AT YOUR OWN RISK!
Pause
abootimg.exe --create linux.img -f purelinux.cfg -k 2636-zImage -r initrd-2.6.36.img
Echo.
Echo.
Echo Make sure your device is connected and in APX mode.
Echo.
pause
nvflash.exe --bct transformer.bct --setbct --configfile linux.cfg --create --bl bootloader.bin --odmdata 0x300d8011 --sbk 0x1682CCD8 0x8A1A43EA 0xA532EEB6 0xECFE1D98 --go
Echo.
Echo Part 1 complete. Put your device back in APX mode.
Pause
nvflash.exe --bct transformer.bct --setbct --configfile linux.cfg --bl bootloader.bin --odmdata 0x300d8011 --sbk 0x1682CCD8 0x8A1A43EA 0xA532EEB6 0xECFE1D98 --sync
nvflash.exe -r --download 8 ubuntu.img
Echo.
Echo Install Finished.
pause
goto start