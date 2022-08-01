@ECHO off
REM Make the OID folder
cd\
if %cd% NEQ C:\ (
	echo ERR: In %cd% and not C:\
	pause>nul
	exit>nul
) else (
	echo In C:\
)
mkdir "C:\OID"
cd "C:\OID"
echo %CD%
echo Moved!
mkdir "EXTRACTED"
CD "C:\OID\EXTRACTED"
echo Downloading extractor [0%]
REM Download 7z & Its DLL file
curl -L -O https://github.com/SurvExE-Pc/text-game/releases/download/7zexedownloader/7z.exe -O %CD%\7z.exe
echo Downloading... [50%]
curl -L -O https://github.com/SurvExE-Pc/text-game/releases/download/7zdlldownloader/7z.dll -O %CD%\7z.dll
echo Finished! [100%]
echo Downloading packages [0%]
REM Download the zip file with the packages in it
curl -L -O https://github.com/SurvExE-Pc/OID/raw/main/file.zipr -O %CD%\file.zipr
echo Downloading packages [100%]
echo Unzipping [0%]
echo Unzipping [25%]
REM Rename the zip file with the packages in it so 7z can use it
rename "./file.zipr" "./OID.zip"
echo Unzipping [50%]
REM Unzip the packages
7z.exe x -y OID.zip
echo Unzipping [75%]
REM Delete the zip file
del /f OID.zip
echo Unzipping [100%]
echo Unzipped!
echo Copying [0%]
REM Copy all the packages to "C:\OID"
xcopy ".\MEDIA" "C:\OID"
echo Copying [7.14285714286%]
xcopy ".\FILE.json" "C:\OID"
echo Copying [14.2857142857%]
xcopy ".\NewOID.cmd" "C:\OID"
echo Copying [21.4285714286%]
xcopy ".\NewOID.py" "C:\OID"
echo Copying [28.5714285714%]
xcopy ".\NewOID_NOLONG.SED" "C:\OID"
echo Copying [35.7142857143%]
xcopy ".\OID.CMD" "C:\OID"
echo Copying [42.8571428572%]
xcopy ".\OID.EXE.CONFIG.JSON.json" "C:\OID"
echo Copying [50%]
xcopy ".\OIDCreator.exe" "C:\OID"
echo Copying [57.1428571429%]
xcopy ".\OIDLogo.ico" "C:\OID"
echo Copying [64.2857142857%]
xcopy ".\OIDLogo.png" "C:\OID"
echo Copying [71.4285714286%]
xcopy ".\OIDVeiwer.exe" "C:\OID"
echo Copying [78.5714285715%]
xcopy ".\OIDVeiwer.SED" "C:\OID"
echo Copying [85.7142857143%]
xcopy ".\OIDVeiwer_NOLONG.SED" "C:\OID"
echo Copying [92.8571428572%]
xcopy ".\parser.py" "C:\OID"
echo Copying [100%]
echo Copied!
@echo off
echo Making shortcuts [0%]
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%HOMEDRIVE%%HOMEPATH%\Desktop\OIDVeiwer.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "C:\OID\OIDVeiwer.exe" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
wscript CreateShortcut.vbs
del CreateShortcut.vbs
echo Making shortcuts [50%]
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%HOMEDRIVE%%HOMEPATH%\Desktop\OIDCreator.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "C:\OID\OIDCreator.exe" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
wscript CreateShortcut.vbs
del CreateShortcut.vbs
echo Making shortcuts [100%]
echo Done!
echo 
echo Done installing.
pause>nul