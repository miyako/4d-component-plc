//%attributes = {"invisible":true,"preemptive":"capable"}
C_BLOB:C604($0;$data)

Case of 
	: (This:C1470.frame="3E")
		
		If (This:C1470.useAscii)
			
			$data:=This:C1470.fromAscii("D000")
			
		Else 
			
			$data:=This:C1470.fromHex("D000")
			
		End if 
		
	Else 
		
		  //not implemented
		
End case 

$0:=$data