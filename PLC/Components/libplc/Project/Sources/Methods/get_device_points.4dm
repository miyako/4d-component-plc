//%attributes = {"invisible":true,"preemptive":"capable"}
C_LONGINT:C283($1;$points)
C_BLOB:C604($0;$data)

$points:=$1 & 0xFFFF  //2 bytes

If (This:C1470.useAscii)
	
	$data:=This:C1470.fromAscii(int_to_hex ($points;4))
	
Else 
	
	INTEGER TO BLOB:C548($points;$data;PC byte ordering:K22:3)
	
End if 

$0:=$data