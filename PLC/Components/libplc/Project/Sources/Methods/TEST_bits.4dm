//%attributes = {"invisible":true}
C_BLOB:C604($data)
SET BLOB SIZE:C606($data;4)
$data{0}:=0x0034
$data{1}:=0x0012
$data{2}:=0x0002
$data{3}:=0x0000

$bits:=data_to_bits ($data)  //binary
$data:=bits_to_data ($bits)
$data:=bits_to_data ("00110100 00010010 00000010 00000000")

$ascii:=bits_to_ascii ("0001 0010 0011 0100 0000 0000 0000 0010")
$data:=ascii_to_data ($ascii)