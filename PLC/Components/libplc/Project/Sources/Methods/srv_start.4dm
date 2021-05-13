//%attributes = {"invisible":true,"preemptive":"capable"}
If (This:C1470.socket=0)
	
	Use (This:C1470)
		This:C1470.socket:=TCP Listen (This:C1470.address;This:C1470.port)
	End use 
	
	If (This:C1470.socket#0)
		
		While (TCP Get State (This:C1470.socket)=TCP Listening)
			
			$socket:=TCP Accept (This:C1470.socket)
			
			If ($socket#0)
				
				$workerName:=New collection:C1472("$";This:C1470.workerName;"@";Generate UUID:C1066).join()
				
				Use (This:C1470)
					This:C1470.workers.push($workerName)
				End use 
				
				CALL WORKER:C1389($workerName;This:C1470.workerName;$socket;This:C1470.timeout)
				
			End if 
			
			DELAY PROCESS:C323(Current process:C322;30)
			
		End while 
		
		This:C1470.stop()
		
	End if 
	
End if 

C_OBJECT:C1216($0)

$0:=This:C1470