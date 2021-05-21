//%attributes = {"invisible":true,"preemptive":"capable"}
C_VARIANT:C1683($1;$deviceNumber)
C_BLOB:C604($0;$data)

$deviceNumber:=$1

Case of 
	: (This:C1470.model="MELSEC-Q/L")
		
		If (This:C1470.useAscii)
			
			Case of 
				: (Value type:C1509($deviceNumber)=Is text:K8:3)
					
					$data:=ascii_to_data ($deviceNumber)
					
				: (Value type:C1509($deviceNumber)=Is real:K8:4)
					
					$data:=int_to_ascii_data ($deviceNumber;6)
					
				Else 
					  //not implemented
			End case 
			
		Else 
			
			Case of 
				: (Value type:C1509($deviceNumber)=Is text:K8:3)
					
					$deviceNumber:="000000"+$deviceNumber
					$deviceNumber:=Substring:C12($deviceNumber;Length:C16($deviceNumber)-5)
					
					$data:=int_to_hex_data ($deviceNumber)
					
				: (Value type:C1509($deviceNumber)=Is real:K8:4)
					
					$data:=int_to_data ($deviceNumber;6)
					
				Else 
					  //not implemented
			End case 
			
		End if 
		
	Else 
		  //not implemented
End case 

$0:=$data