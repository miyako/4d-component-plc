//%attributes = {"invisible":true}
$bin:=hex_to_data ("540012340000")  //シリアル番号が"1234"の場合

C_BLOB:C604($data)
SET BLOB SIZE:C606($data;6)
$data{0}:=0x0054
$data{1}:=0x0000
$data{2}:=0x0012
$data{3}:=0x0034
$data{4}:=0x0000
$data{5}:=0x0000

ASSERT:C1129(Generate digest:C1147($bin;SHA256 digest:K66:4)=Generate digest:C1147($data;SHA256 digest:K66:4))