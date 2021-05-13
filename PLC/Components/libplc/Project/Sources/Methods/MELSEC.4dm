//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($0;$EXPORT)

$name:=Current method name:C684

If (Storage:C1525[$name]=Null:C1517)
	Use (Storage:C1525)
		$EXPORT:=New shared object:C1526
		Storage:C1525[$name]:=$EXPORT
	End use 
Else 
	$EXPORT:=Storage:C1525[$name]
End if 

If ($EXPORT[$name]=Null:C1517)
	
	Use ($EXPORT)
		
		$workers:=New shared collection:C1527
		
		  //member methods
		
		$EXPORT.start:=Formula:C1597(srv_start )
		$EXPORT.stop:=Formula:C1597(srv_stop )
		
		  //properties (default settings)
		
		$EXPORT.socket:=0
		$EXPORT.workers:=$workers
		$EXPORT.workerName:="srv_process"
		
		$EXPORT.timeout:=30  //送受信タイムアウト/秒
		
		$EXPORT[$name]:=Formula:C1597(This:C1470)
		
	End use 
	
End if 

Use ($EXPORT)
	
	If (Count parameters:C259=0)
		$EXPORT.address:=""  //default
	Else 
		C_TEXT:C284($1)
		$EXPORT.address:=$1
	End if 
	
	If (Count parameters:C259<2)
		$EXPORT.port:=5000  //default
	Else 
		C_LONGINT:C283($2)
		$EXPORT.port:=$2
	End if 
	
End use 

$0:=$EXPORT