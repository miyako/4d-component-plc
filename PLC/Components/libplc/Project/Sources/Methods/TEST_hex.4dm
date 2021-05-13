//%attributes = {"invisible":true}
C_BLOB:C604($data)
SET BLOB SIZE:C606($data;4)
$data{0}:=0x0030
$data{1}:=0x0030
$data{2}:=0x0046
$data{3}:=0x0046

$int:=hex_to_int ($data)

$data:=ascii_to_data ("B*")

$text:=data_to_text ($data)

$data:=hex_to_data ("A0")

$hex:=data_to_hex ($data)

$data:=hex_to_data ("01040100")

$hex:=data_to_hex ($data)