echo 'Install Mozc With Qt'

echo 'Install Mozc (64-bit)'
copy out_win\Release\mozc_broker32.exe             %ProgramFiles(x86)%\Mozc
copy out_win\Release\mozc_cache_service.exe        %ProgramFiles(x86)%\Mozc
copy out_win\Release\mozc_renderer.exe             %ProgramFiles(x86)%\Mozc
copy out_win\Release\mozc_server.exe               %ProgramFiles(x86)%\Mozc

mkdir %ProgramFiles(x86)%\Mozc\platforms
copy out_win\ReleaseDynamic\mozc_tool.exe          %ProgramFiles(x86)%\Mozc
copy out_win\ReleaseDynamic\Qt5Core.dll            %ProgramFiles(x86)%\Mozc
copy out_win\ReleaseDynamic\Qt5Gui.dll             %ProgramFiles(x86)%\Mozc
copy out_win\ReleaseDynamic\Qt5Widgets.dll         %ProgramFiles(x86)%\Mozc
copy out_win\ReleaseDynamic\platforms\qwindows.dll %ProgramFiles(x86)%\Mozc\platforms

copy out_win\Release_x64\mozc_broker64.exe         %ProgramFiles(x86)%\Mozc

echo 'Register Mozc for IMM32 into 64-bit environment
copy out_win\Release_x64\mozc_ja.ime               %windir%\System32
copy out_win\Release\mozc_ja.im                    %windir%\SysWOW64

"%ProgramFiles(x86)%\Mozc\mozc_broker64.exe" --mode=register_ime

echo 'Register Mozc for TSF into 64-bit environment'
copy out_win\Release\mozc_ja_tip32.dll             %ProgramFiles(x86)%\Mozc
copy out_win\Release_x64\mozc_ja_tip64.dll         %ProgramFiles(x86)%\Mozc

regsvr32 "%ProgramFiles(x86)%\Mozc\mozc_ja_tip32.dll"
regsvr32 "%ProgramFiles(x86)%\Mozc\mozc_ja_tip64.dll"

