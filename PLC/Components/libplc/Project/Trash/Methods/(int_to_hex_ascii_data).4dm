//%attributes = {"invisible":true,"preemptive":"capable"}
C_TEXT:C284($1;$hex)
C_BLOB:C604($0;$bytes)

$data:=ascii_to_data ($1)

  //下位バイトから送信

SET BLOB SIZE:C606($bytes;BLOB size:C605($data))

For ($i;1;BLOB size:C605($data))
	
	$bytes{$i-1}:=$data{BLOB size:C605($data)-$i}
	
End for 

$0:=$bytes