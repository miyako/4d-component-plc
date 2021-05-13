![version](https://img.shields.io/badge/version-18%2B-EB8E5F)
[![license](https://img.shields.io/github/license/miyako/4d-component-plc)](LICENSE)

# 4d-component-plc
三菱電機汎用シーケンサ MELSEC シリーズのPLC実装

#### 依存ライブラリ等

[NTK Plugin](https://www.pluggers.nl/product/ntk-plugin/)

* TCP Open
* TCP Send Blob
* TCP Get State
* TCP Receive Blob
* TCP Close

#### 要求/応答

```4d
$PLC:=PLC ("MELSEC-Q/L";False)  //バイナリ形式; TrueでASCII形式

$params:=New object
$params.host:="192.168.1.30"  //IPアドレス

$params.host:="127.0.0.1"  //IPアドレス（テスト用; fake PLC controller）

$params.port:=5000  //ポート
$params.deviceCode:="B"  //B=リンクリレー|D=データレジスタ|W=リンクレジスタ
$params.mode:="read,word"  //read=読込|write=書込; word|bit
$params.points:=20  //デバイス点数
$params.timeout:=10
$params.returnText:=True

$response:=$PLC.request($params)

/*
	binary response: D00000FFFF03000600000034120200
	ascii  response: D00000FF03FF00000C000012340002
*/

$params.returnText:=False

$response:=$PLC.request($params)
```
