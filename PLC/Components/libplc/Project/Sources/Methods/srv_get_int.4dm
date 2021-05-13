//%attributes = {"invisible":true,"preemptive":"capable"}
C_BLOB:C604($1)
C_BOOLEAN:C305($2;$useAscii)
C_LONGINT:C283($0)

$useAscii:=$2

If ($useAscii)
	$0:=hex_to_int ($1)
Else 
	$0:=BLOB to integer:C549($1;PC byte ordering:K22:3)
End if 