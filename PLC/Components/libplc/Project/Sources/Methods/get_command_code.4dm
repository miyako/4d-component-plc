//%attributes = {"invisible":true,"preemptive":"capable"}
C_TEXT:C284($1;$mode)
C_BLOB:C604($0;$data)

$mode:=$1

Case of 
	: (This:C1470.model="MELSEC-Q/L")
		
		Case of 
			: ($mode="read,word")
				
				If (This:C1470.useAscii)
					
					$data:=This:C1470.fromAscii("04010000")
					
				Else 
					
					$data:=This:C1470.fromHex("01040000")  //コマンド0401, サブコマンド0000; little endian intergerx2
					
				End if 
				
			: ($mode="read,bit")
				
				If (This:C1470.useAscii)
					
					$data:=This:C1470.fromAscii("04010001")
					
				Else 
					
					$data:=This:C1470.fromHex("01040100")  //コマンド0401, サブコマンド0001; little endian intergerx2
					
				End if 
				
			: ($mode="write,word")
				
				If (This:C1470.useAscii)
					
					$data:=This:C1470.fromAscii("14010000")
					
				Else 
					
					$data:=This:C1470.fromHex("01140000")  //コマンド1401, サブコマンド0000; little endian intergerx2
					
				End if 
				
			: ($mode="write,bit")
				
				If (This:C1470.useAscii)
					
					$data:=This:C1470.fromAscii("14010001")
					
				Else 
					
					$data:=This:C1470.fromHex("01140100")  //コマンド1401, サブコマンド0001; little endian intergerx2
					
				End if 
				
			Else 
				
				  //not implemented
				
		End case 
		
	Else 
		  //not implemented
End case 

$0:=$data