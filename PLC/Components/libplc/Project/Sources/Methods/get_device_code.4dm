//%attributes = {"invisible":true,"preemptive":"capable"}
C_TEXT:C284($1;$code)
C_BLOB:C604($0;$data)

$code:=$1

Case of 
	: (This:C1470.model="MELSEC-Q/L")
		
		If (This:C1470.useAscii)
			
			Case of 
				: ($code="B")
					$data:=This:C1470.fromAscii("B*")
				: ($code="D")
					$data:=This:C1470.fromAscii("D*")
				: ($code="W")
					$data:=This:C1470.fromAscii("W*")
				Else 
					  //not implemented
			End case 
			
		Else 
			
			Case of 
				: ($code="B")
					
					$data:=This:C1470.fromHex("A0")
					
				: ($code="D")
					
					$data:=This:C1470.fromHex("A8")
					
				: ($code="W")
					
					$data:=This:C1470.fromHex("84")
					
				Else 
					  //not implemented
			End case 
			
		End if 
		
	: (This:C1470.model="MELSEC iQ-R")
		
		  //not implemented
		
End case 

$0:=$data