//%attributes = {"invisible":true,"preemptive":"capable"}
$PLC:=PLC ("MELSEC-Q/L";False:C215)  //バイナリ形式; TrueでASCII形式

$params:=New object:C1471
$params.host:="192.168.1.30"  //IPアドレス

$params.host:="127.0.0.1"  //IPアドレス（テスト用; fake PLC controller）

$params.port:=5000  //ポート
$params.deviceCode:="B"  //B=リンクリレー|D=データレジスタ|W=リンクレジスタ
$params.mode:="read,word"  //read=読込|write=書込; word|bit
$params.deviceNumber:=100  //先頭デバイス番号（テキスト=16進数|数値=10進数）
$params.deviceNumber:="100"
$params.points:=20  //デバイス点数
$params.timeout:=10
$params.returnText:=False:C215

$response:=$PLC.request($params)

/*
binary response: D00000FFFF03000600000034120200
ascii  response: D00000FF03FF00000C000012340002
*/

$params.returnText:=True:C214

$response:=$PLC.request($params)