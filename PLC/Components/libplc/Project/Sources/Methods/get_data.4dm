//%attributes = {"invisible":true,"preemptive":"capable"}
C_TEXT:C284($1)
C_BLOB:C604($0;$data)

If (This:C1470.useAscii)
	
	$data:=This:C1470.fromAscii($1)
	
Else 
	
	$data:=This:C1470.fromHex($1)
	
End if 

$0:=$data