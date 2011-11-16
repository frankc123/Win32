cd files
nvflash.exe -w --bct transformer.bct --setbct --configfile linux.cfg --bl bootloader.bin --odmdata 0x300d8011 --sbk 0x1682CCD8 0x8A1A43EA 0xA532EEB6 0xECFE1D98 --sync
nvflash.exe -r -q --download 8 ubuntu.img
pause
