//%attributes = {"invisible":true,"preemptive":"capable"}
C_BLOB:C604($0;$data)

Case of 
	: (This:C1470.model="MELSEC-Q/L")
		
		Case of 
			: (True:C214)  //固定値
				
				If (This:C1470.useAscii)
					
					$data:=This:C1470.fromAscii("000000")
					
				Else 
					
					$data:=This:C1470.fromHex("000000")
					
				End if 
				
			Else 
				  //not implemented
		End case 
		
	Else 
		  //not implemented
End case 


$0:=$data