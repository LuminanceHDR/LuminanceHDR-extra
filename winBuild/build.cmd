@echo off
SETLOCAL
rmdir /S /Q output
mkdir output



REM Environment variables -----------------------------------------------------------------------------------------------------
set HUGIN_DIR=D:\Links\huginDir
set LUMINANCE_DIR=D:\Links\luminanceBuild
set LUMINANCE_SOURCE_DIR=D:\Links\luminanceSource
set QT_DIR=D:\Links\qtDir
set DLL_PACKAGE_DIR=D:\Links\dllPackage
set MINGW_DIR=D:\Links\mingwDir
REM Environment variables -----------------------------------------------------------------------------------------------------



echo Copying main .exe file ..................................................
copy %LUMINANCE_DIR%\luminance.exe output\luminance.exe

echo Copying QT dlls ..................................................
copy %QT_DIR%\bin\QtCore4.dll output\
copy %QT_DIR%\bin\QtGui4.dll output\
copy %QT_DIR%\bin\QtNetwork4.dll output\
copy %QT_DIR%\bin\QtWebKit4.dll output\
copy %QT_DIR%\bin\QtXml4.dll output\
copy %QT_DIR%\bin\QtXmlPatterns4.dll output\
copy %QT_DIR%\bin\phonon4.dll output\

echo Copying Dll package ..................................................
mkdir output\imageformats
rem copy %DLL_PACKAGE_DIR%\imageformats output\imageformats\
copy %QT_DIR%\plugins\imageformats\qjpeg4.dll output\imageformats\

copy %DLL_PACKAGE_DIR%\libHalf-6.dll output\
copy %DLL_PACKAGE_DIR%\libIex-6.dll output\
copy %DLL_PACKAGE_DIR%\libIlmImf-6.dll output\
copy %DLL_PACKAGE_DIR%\libIlmThread-6.dll output\
copy %DLL_PACKAGE_DIR%\zlib1.dll output\
copy %DLL_PACKAGE_DIR%\libexiv2-5.dll output\
rem copy %DLL_PACKAGE_DIR%\libstdc++_sjlj_6.dll output\
copy %DLL_PACKAGE_DIR%\libgcc_sjlj_1.dll output\
copy %DLL_PACKAGE_DIR%\libfftw3f-3.dll output\
copy %DLL_PACKAGE_DIR%\libgsl-0.dll output\
copy %DLL_PACKAGE_DIR%\libgslcblas-0.dll output\
copy %DLL_PACKAGE_DIR%\libtiff3.dll output\
copy %DLL_PACKAGE_DIR%\jpeg62.dll output\
copy %DLL_PACKAGE_DIR%\pthreadGC2.dll output\

echo Copying Mingw Dlls ..................................................
copy %MINGW_DIR%\bin\libgomp-1.dll output\
copy %MINGW_DIR%\bin\libgcc_s_dw2-1.dll output\

echo Copying translations ..................................................
copy %LUMINANCE_SOURCE_DIR%\LICENSE output\LICENSE.txt
copy %LUMINANCE_SOURCE_DIR%\AUTHORS output\AUTHORS.txt
copy %LUMINANCE_SOURCE_DIR%\README output\README.txt
%QT_DIR%\bin\lrelease.exe %LUMINANCE_SOURCE_DIR%\project.pro
mkdir output\i18n
copy %LUMINANCE_SOURCE_DIR%\i18n\*.qm output\i18n\
xcopy %LUMINANCE_SOURCE_DIR%\help\* output\help\ /E

echo Copying Hugin tools ..................................................
copy %HUGIN_DIR%\bin\align_image_stack.exe output\

echo Getting dcraw ..................................................
wget -O output/dcraw.exe http://www.insflug.org/raw/file_download/8/dcrawMS.exe

ENDLOCAL

output\luminance.exe
