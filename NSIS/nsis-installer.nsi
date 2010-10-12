# define name of installer
outFile "LuminanceHDR-Win32-v2.0.1-1.exe"
 
# define installation directory
installDir $PROGRAMFILES\LuminanceHDR-2.0.1
 
# start default section
section
 
    # set the installation directory as the destination for the following actions
    setOutPath $INSTDIR
 
    # create the uninstaller
    writeUninstaller "$INSTDIR\uninstall.exe"
 
    # create a shortcut named "new shortcut" in the start menu programs directory
    # point the new shortcut at the program uninstaller
    CreateDirectory "$SMPROGRAMS\LuminanceHDR"
    CreateShortCut "$SMPROGRAMS\LuminanceHDR\uninstall.lnk" "$INSTDIR\uninstall.exe"

    file luminance.exe
    file align_image_stack.exe
    file dcraw.exe

    CreateShortCut "$SMPROGRAMS\LuminanceHDR\LuminanceHDR 2.0.1.lnk" "$INSTDIR\luminance.exe"

    file QtCore4.dll
    file QtGui4.dll
    file QtNetwork4.dll
    file QtWebKit4.dll
    file QtXml4.dll
    file QtXmlPatterns4.dll
    file phonon4.dll

    file jpeg62.dll
    file libexiv2-5.dll
    file libfftw3f-3.dll
    file libgcc_s_dw2-1.dll
    file libgcc_sjlj_1.dll
    file libgomp-1.dll
    file libgsl-0.dll
    file libgslcblas-0.dll
    file libHalf-6.dll
    file libIex-6.dll
    file libIlmImf-6.dll
    file libIlmThread-6.dll
    file libstdc++_sjlj_6.dll
    file libtiff3.dll
    file mingwm10.dll
    file pthreadGC2.dll
    file zlib1.dll
    file AUTHORS.txt
    file LICENSE.txt
    file README.txt

    setOutPath $INSTDIR\i18n

    file i18n\lang_cs.qm
    file i18n\lang_de.qm
    file i18n\lang_es.qm
    file i18n\lang_fr.qm
    file i18n\lang_hu.qm
    file i18n\lang_id.qm
    file i18n\lang_it.qm
    file i18n\lang_pl.qm
    file i18n\lang_ru.qm
    file i18n\lang_tr.qm

    setOutPath $INSTDIR\imageformats

    file imageformats\qjpeg4.dll

sectionEnd
 
# uninstaller section start
section "uninstall"
 
    # first, delete the uninstaller
    delete "$INSTDIR\uninstall.exe"
 
    # second, remove the link from the start menu
    delete "$SMPROGRAMS\LuminanceHDR\uninstall.lnk"
    delete "$SMPROGRAMS\LuminanceHDR\LuminanceHDR 2.0.1.lnk"
    RMDIR "$SMPROGRAMS\LuminanceHDR"

    delete "$INSTDIR\luminance.exe"
    delete "$INSTDIR\align_image_stack.exe" 
    delete "$INSTDIR\dcraw.exe"

    delete "$INSTDIR\QtCore4.dll"
    delete "$INSTDIR\QtGui4.dll"
    delete "$INSTDIR\QtNetwork4.dll"
    delete "$INSTDIR\QtWebKit4.dll"
    delete "$INSTDIR\QtXml4.dll"
    delete "$INSTDIR\QtXmlPatterns4.dll"
    delete "$INSTDIR\phonon4.dll"

    delete "$INSTDIR\jpeg62.dll"
    delete "$INSTDIR\libexiv2-5.dll"
    delete "$INSTDIR\libfftw3f-3.dll"
    delete "$INSTDIR\libgcc_s_dw2-1.dll"
    delete "$INSTDIR\libgcc_sjlj_1.dll"
    delete "$INSTDIR\libgomp-1.dll"
    delete "$INSTDIR\libgsl-0.dll"
    delete "$INSTDIR\libgslcblas-0.dll"
    delete "$INSTDIR\libHalf-6.dll"
    delete "$INSTDIR\libIex-6.dll"
    delete "$INSTDIR\libIlmImf-6.dll"
    delete "$INSTDIR\libIlmThread-6.dll"
    delete "$INSTDIR\libstdc++_sjlj_6.dll"
    delete "$INSTDIR\libtiff3.dll"
    delete "$INSTDIR\mingwm10.dll"
    delete "$INSTDIR\pthreadGC2.dll"
    delete "$INSTDIR\zlib1.dll"
    delete "$INSTDIR\AUTHORS.txt"
    delete "$INSTDIR\LICENSE.txt"
    delete "$INSTDIR\README.txt"

    delete "$INSTDIR\i18n\lang_cs.qm"
    delete "$INSTDIR\i18n\lang_de.qm"
    delete "$INSTDIR\i18n\lang_es.qm"
    delete "$INSTDIR\i18n\lang_fr.qm"
    delete "$INSTDIR\i18n\lang_hu.qm"
    delete "$INSTDIR\i18n\lang_id.qm"
    delete "$INSTDIR\i18n\lang_it.qm"
    delete "$INSTDIR\i18n\lang_pl.qm"
    delete "$INSTDIR\i18n\lang_ru.qm"
    delete "$INSTDIR\i18n\lang_tr.qm"

    delete "$INSTDIR\imageformats\qjpeg4.dll"

    RMDIR "$INSTDIR\i18n"
    RMDIR "$INSTDIR\imageformats"
    RMDIR "$INSTDIR"

# uninstaller section end
sectionEnd