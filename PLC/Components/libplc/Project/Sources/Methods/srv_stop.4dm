//%attributes = {"invisible":true,"preemptive":"capable"}
If (This:C1470.socket#0)
	
	TCP Close (This:C1470.socket)
	
	For each ($workerName;This:C1470.workers)
		KILL WORKER:C1390($workerName)
	End for each 
	
	$workers:=New shared collection:C1527
	
	Use (This:C1470)
		This:C1470.workers:=$workers
		This:C1470.socket:=0
	End use 
	
End if 

C_OBJECT:C1216($0)

$0:=This:C1470