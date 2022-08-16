echo 'Uninstall Mozc With Qt'

"%ProgramFiles(x86)%\Mozc\mozc_broker64.exe" --mode=unregister_ime
del /q "%windir%\System32\mozc_ja.ime"
del /q "%windir%\SysWOW64\mozc_ja.ime"

regsvr32 /u "%ProgramFiles(x86)%\Mozc\mozc_ja_tip32.dll"
regsvr32 /u "%ProgramFiles(x86)%\Mozc\mozc_ja_tip64.dll"

del /s /q "%ProgramFiles(x86)%\Mozc\"
rmdir /s /q "%ProgramFiles(x86)%\Mozc\"