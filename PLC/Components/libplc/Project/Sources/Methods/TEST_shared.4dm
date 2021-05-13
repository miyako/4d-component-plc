//%attributes = {"invisible":true}
$PLC:=PLC_shared ("MELSEC-Q/L";True:C214)  //ASCII形式

$params:=New object:C1471
$params.host:="192.168.1.30"  //IPアドレス
$params.port:=5000  //ポート
$params.deviceCode:="B"  //B=リンクリレー|D=データレジスタ|W=リンクレジスタ
$params.mode:="read"  //read=読込|write=書込
$params.points:=20  //デバイス点数
$params.data:="0105"  //送信データ

$response:=$PLC.request($params)