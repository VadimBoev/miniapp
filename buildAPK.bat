@echo off

rem by Vadim Boev 08.11.2022
rem please, call this file in folder project, else its not working.

rem variables
set BUILD-TOOLS=C:\Users\VadimPC\AppData\Local\Android\Sdk\build-tools\33.0.0
set NDK=C:\Users\VadimPC\AppData\Local\Android\Sdk\ndk\25.1.8937393
set ANDROIDSDK=C:\Users\VadimPC\AppData\Local\Android\Sdk

set APKNAME=miniapp

rem android version
set ANDROIDVERSION=31
set ANDROIDTARGET=31

echo [%date% %time%] Compilation %APKNAME%
echo [%date% %time%] Going to the folder project

echo [%date% %time%] If file lib%APKNAME%.so exist, then delete...

if exist "%cd%\bin\%APKNAME%.apk" del %cd%\bin\%APKNAME%.apk && echo [%date% %time%] %APKNAME%.apk has been deleted!

cd %cd%

rem infinite loop
:loop

if exist "%cd%\libs\armeabi-v7a\lib%APKNAME%.so" ( 
	goto continue
)

goto loop

:continue

echo [%date% %time%] Sending resources to %APKNAME%.apk

rem packing resources for APK
rem and build APK

rem delete temporary file 
del /Q %cd%\resources\temp.apk

"%BUILD-TOOLS%/aapt.exe" package -f -F %cd%/resources/temp.apk -I %ANDROIDSDK%/platforms/android-%ANDROIDVERSION%/android.jar -M %cd%/resources/AndroidManifest.xml -S %cd%/resources/res -A %cd%/resources/assets -v --target-sdk-version %ANDROIDTARGET%
"C:\Program Files\7-Zip\7z.exe" x -y %cd%/resources/temp.apk -o"%cd%/bin/"

start /min WinRAR A -r "%cd%\resources\temp.apk" "libs\*"

timeout /T 2

start /min WinRAR rn "resources\temp.apk" libs lib

cd "%cd%/bin/" && "C:\Program Files\7-Zip\7z.exe" a -tzip -mx9 %APKNAME%.apk . && "C:\Program Files\7-Zip\7z.exe" a -tzip -mx0 %APKNAME%.apk ./resources.arsc ./AndroidManifest.xml

cd ..

rem Sign
"C:\Program Files\Java\jre1.8.0_351\bin\java" -jar "%cd%\resources\signapk.jar" "%cd%\resources\testkey.x509.pem" "%cd%\resources\testkey.pk8" "%cd%\resources\temp.apk" %cd%/bin/%APKNAME%.apk

rem remove please useless files!
del /Q "%cd%\bin\resources.arsc"
del /Q "%cd%\bin\AndroidManifest.xml"
rmdir /Q /S "%cd%\bin\res"
rmdir /Q /S "%cd%\bin\assets"

rem pause