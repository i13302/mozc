# インストールを確認

## マシン
- OS 名	Microsoft Windows 10 Education
- バージョン	10.0.19044 ビルド 19044
- システムの種類	x64-ベース PC
- システムモデル	VirtualBox

## コンパイル
- Visual Studo 2019 Community
```コンポーネント(まだ減らせるかも)
{
  "version": "1.0",
  "components": [
    "Microsoft.VisualStudio.Component.CoreEditor",
    "Microsoft.VisualStudio.Workload.CoreEditor",
    "Microsoft.VisualStudio.Component.Roslyn.Compiler",
    "Microsoft.VisualStudio.ComponentGroup.WebToolsExtensions",
    "Microsoft.Component.MSBuild",
    "Microsoft.VisualStudio.Component.TextTemplating",
    "Microsoft.VisualStudio.Component.VC.CoreIde",
    "Microsoft.VisualStudio.Component.VC.Tools.x86.x64",
    "Microsoft.VisualStudio.Component.Windows10SDK.19041",
    "Microsoft.VisualStudio.Component.VC.Redist.14.Latest",
    "Microsoft.VisualStudio.ComponentGroup.NativeDesktop.Core",
    "Microsoft.VisualStudio.ComponentGroup.WebToolsExtensions.CMake",
    "Microsoft.VisualStudio.Component.VC.CMake.Project",
    "Microsoft.VisualStudio.Component.VC.ATL",
    "Microsoft.VisualStudio.Component.VC.ATLMFC",
    "Microsoft.Component.VC.Runtime.UCRTSDK",
    "Microsoft.VisualStudio.Workload.NativeDesktop"
  ]
```
- Qt 5.15.2 MSVC2019 32bit
- Python 3.10.6

## env path
- `C:\Program Files (x86)\Windows Kits\10\bin\10.0.19041.0\x86`
`mt.exe`と`rc.exe`がビルドに必要なようなので，`C:\Program Files (x86)\Windows Kits\10\bin\`配下にVSのコンポーネントに合わせたディレクトリが生成されている．
当該ファイルがあるコンポーネントを選び，`PATH`を設定する．

- `C:\Work\depot_tools`
Pythonを別途インストールするのなら，Gitぐらいしか使わない．
なお，本ツールのPythonでは文字コード周りにエラー(警告かも？)が出るようだ．

## 実行コマンド
```
cd C:\Work\mozc\src
chcp 932
python build_mozc.py gyp --qtdir=C:\Qt\5.15.2\msvc2019
python build_mozc.py build -c Release package >> %homepath%\Desktop\log-11.log
```

```
python build_mozc.py clean
```

## 原本から変更したソース
- `C:\Work\mozc\src\third_party\gyp\pylib\gyp\win_tool.py`
	- UTF-8 with BOMへの対応
- `C:\Work\mozc\src\build_mozc.py`
	- VS2017を探してエラーを吐くため，VS2019に書き換えた．
	- 将来的に，同じ理由で書き換えが必要である．

## memo
VSを用いてコンパイルするため，`Developer Command Prompt for VS 2019`を用いる．

