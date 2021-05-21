![version](https://img.shields.io/badge/version-18%2B-EB8E5F)
[![license](https://img.shields.io/github/license/miyako/4d-component-plc)](LICENSE)

# 4d-component-plc
三菱電機汎用シーケンサ MELSEC シリーズのPLC実装サンプル

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
$params.port:=5000  //ポート
$params.deviceCode:="B"  //B=リンクリレー|D=データレジスタ|W=リンクレジスタ
$params.mode:="read,word"  //read=読込|write=書込; word|bit
$params.deviceNumber:=100  //先頭デバイス番号（テキスト=16進数|数値=10進数）
$params.deviceNumber:="100"
$params.points:=20  //デバイス点数
$params.timeout:=3  //秒
$params.returnText:=True //FalseでBLOBをそのまま返す

$response:=$PLC.request($params)
```
