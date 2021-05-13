//%attributes = {"invisible":true,"preemptive":"capable"}
If (Count parameters:C259=0)
	
	CALL WORKER:C1389("fake PLC controller";Current method name:C684;New object:C1471)
	
Else 
	
	C_OBJECT:C1216($1)
	
	$MELSEC:=MELSEC ("127.0.0.1";5000)  //fake PLC controller
	
	$MELSEC.start()
	
End if 