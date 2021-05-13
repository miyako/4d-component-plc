//%attributes = {"invisible":true,"preemptive":"capable"}
C_BLOB:C604($0;$data)

Case of 
	: (True:C214)  //接続局(自局)にアクセスする場合
		
		If (This:C1470.useAscii)
			
			$data:=This:C1470.fromAscii("00FF")
			
		Else 
			
			$data:=This:C1470.fromHex("00FF")
			
		End if 
		
	Else 
		
		  //not implemented
		
End case 

$0:=$data