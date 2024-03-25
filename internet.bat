@echo off

:start
	cls
	echo INTERNET CLEANING PROGRAM HAS BEEN STARTED!!!
	echo The following will not alter nor delete your files...
	echo This program may cause some downloads to fail!
	echo.
	echo.
	cd "C:\EMPTYSTANDBYLIST"
	del /q /f /s %TEMP%\*
	goto forloop

:forloop
	FOR %%G IN (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) DO IF EXIST "%%G:\$RECYCLE.BIN\S-1-5-21-3255149829-3976585364-830875472-1001\*" del "%%G:\$RECYCLE.BIN\S-1-5-21-3255149829-3976585364-830875472-1001\*" /q /f /s
	goto continue


:continue
	del /q /f /s "%USERPROFILE%\AppData\Local\Temp\*.*"
	del /q /f /s "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*"
	del /q /f /s "%USERPROFILE%\AppData\Local\Temp\Excel8.0\*.exd”
	del /q /f /s "%USERPROFILE%\AppData\Roaming\Microsoft\Office\*.tmp"
	ipconfig /FlushDNS
	cd "%USERPROFILE%\Desktop\EMPTYSTANDBYLIST\EMPTYSTANDBYLIST.EXE" WORKINGSETS
	timeout 45
	goto start
