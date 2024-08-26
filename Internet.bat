@echo off
Setlocal
::EchoANSI.cmd
cls
:: Display a sample of all the ANSI colours.
:: Requires windows 1909 or newer

:: Define foreground and background ANSI colors:
Set _fBlack=[30m
Set _bBlack=[40m
Set _fRed=[31m
Set _bRed=[41m
Set _fGreen=[32m
Set _bGreen=[42m
Set _fYellow=[33m
Set _bYellow=[43m
Set _fBlue=[34m
Set _bBlue=[44m
Set _fMag=[35m
Set _bMag=[45m
Set _fCyan=[36m
Set _bCyan=[46m
Set _fLGray=[37m
Set _bLGray=[47m
Set _fDGray=[90m
Set _bDGray=[100m
Set _fBRed=[91m
Set _bBRed=[101m
Set _fBGreen=[92m
Set _bBGreen=[102m
Set _fBYellow=[93m
Set _bBYellow=[103m
Set _fBBlue=[94m
Set _bBBlue=[104m
Set _fBMag=[95m
Set _bBMag=[105m
Set _fBCyan=[96m
Set _bBCyan=[106m
Set _fBWhite=[97m
Set _bBWhite=[107m
Set _RESET=[0m

:check_Permissions
cls
echo Administrative permissions required. Detecting permissions...

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed.
	set _admin="yes"
	title Internet Cleaning Program
) else (
    echo Failure: Current permissions inadequate.
	set _admin="no"
	title Normal: Internet Cleaning Program
)
echo.
echo 
goto real_start

:real_start
cls
echo THIS IS A WARNING SCREEN AND PROMPT!!
echo.
Echo:
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                           ³
Echo  ³ Would you like to use IP Renew for your computer?                         ³
Echo  ³ If (yes) this may cause most if not all download to be interupted.        ³
Echo  ³ This may also make some downloads currupted.                              ³
Echo  ³                                                                           ³
if %_admin%=="no" (
	Echo  ³ %_fBWhite%%_bBRed%THIS PROGRAM IS CURRENTLY NOT RAN WITH ADMIN PRIVLIGES!!%_RESET%                  ³
	Echo  ³ %_fBWhite%%_bBRed%PLEASE RUN THIS PROGRAM AGAIN WITH ADMIN PRIVLIGES!!%_RESET%                      ³
	Echo  ³                                                                           ³
)
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo:
echo.
echo This is a ONE TIME prompt (for this session ONLY).
set /p scramble=Y/N: || set scramble=Y
if /i "%scramble%"=="y" (
	goto start
) else if /i "%scramble%"=="yes" (
	goto start
) else if /i "%scramble%"=="n" (
	goto start
) else if /i "%scramble%"=="no" (
	goto start
) else (
	goto real_start
)


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