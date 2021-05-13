//%attributes = {"invisible":true,"preemptive":"capable"}
C_LONGINT:C283($1;$socket;$2;$timeout)

$socket:=$1
$timeout:=$2

$append:=Formula:C1597(COPY BLOB:C558($2->;$1->;0;BLOB size:C605($1->);BLOB size:C605($2->)))

C_BLOB:C604($request;$response;$buf)

SET BLOB SIZE:C606($response;100)

$start:=Milliseconds:C459

While ((Milliseconds:C459-$start)<($timeout*1000)) & ($socket#0) & (TCP Get State ($socket)#TCP Connection Closed)
	
	$received:=TCP Receive Blob ($socket;$buf)
	
	If ($received>0)
		$append.call(Null:C1517;->$request;->$buf)
		CLEAR VARIABLE:C89($buf)
	End if 
	
	If (BLOB size:C605($request)>9)
		
		C_BLOB:C604($subheader)
		COPY BLOB:C558($request;$subheader;0;0;2)
		C_BOOLEAN:C305($isRequest;$useAscii)
		
		If ($subheader{0}=0x0050) & ($subheader{1}=0x0000)  //3E; 要求伝文
			
			$isRequest:=True:C214
			$useAscii:=False:C215
			
		Else 
			
			COPY BLOB:C558($request;$subheader;0;0;4)
			
			If ($subheader{0}=0x0035) & ($subheader{1}=0x0030) & ($subheader{2}=0x0030) & ($subheader{3}=0x0030)  //3E; 要求伝文
				
				$isRequest:=True:C214
				$useAscii:=True:C214
				
			End if 
		End if 
		
		If ($isRequest)
			
			$offset:=BLOB size:C605($subheader)
			$pOffset:=->$offset
			$pRequest:=->$request
			
			$networkCode:=srv_get_part ($pRequest;$pOffset;2;$useAscii)
			$interfaceCode:=srv_get_part ($pRequest;$pOffset;3;$useAscii)
			
			$lengthCode:=srv_get_part ($pRequest;$pOffset;2;$useAscii)
			$length:=srv_get_int ($lengthCode;$useAscii)
			
			If (BLOB size:C605($request)=($length+(9*Choose:C955($useAscii;2;1))))
				
				$waitCode:=srv_get_part ($pRequest;$pOffset;2;$useAscii)
				$wait:=srv_get_int ($waitCode;$useAscii)
				
				$commandCode:=srv_get_part ($pRequest;$pOffset;4;$useAscii)
				
				If ($useAscii)
					$command:=data_to_text ($commandCode)
				Else 
					$command:=data_to_hex ($commandCode)
				End if 
				
				$positionCode:=srv_get_part ($pRequest;$pOffset;3;$useAscii)
				
				$deviceCode:=srv_get_part ($pRequest;$pOffset;1;$useAscii)
				
				If ($useAscii)
					$device:=data_to_text ($deviceCode)
				Else 
					$device:=data_to_hex ($deviceCode)
				End if 
				
				$pointsCode:=srv_get_part ($pRequest;$pOffset;2;$useAscii)
				$points:=srv_get_int ($pointsCode;$useAscii)
				
				$payloadData:=srv_get_part ($pRequest;$pOffset;BLOB size:C605($request)-$offset;$useAscii)
				
				If ($useAscii)
					$payload:=data_to_text ($payloadData)
				Else 
					$payload:=data_to_hex ($payloadData)
				End if 
				
				$PLC:=PLC ("MELSEC-Q/L";$useAscii)
				
				If ($useAscii)
					$exitCode:=ascii_to_data ("0000")
				Else 
					$exitCode:=hex_to_data ("0000")
				End if 
				
				If ($useAscii)
					$data:=ascii_to_data (bits_to_ascii ("0001 0010 0011 0100 0000 0000 0000 0010"))
				Else 
					$data:=bits_to_data ("00110100 00010010 00000010 00000000")
				End if 
				
				$response:=$PLC.response(->$networkCode;->$interfaceCode;->$exitCode;->$data)
				
				If ($useAscii)
					
					Case of 
						: ($command="04010000")
							
						: ($command="04010001")
							
						: ($command="14010000")
							
						: ($command="14010001")
							
					End case 
					
				Else 
					
					Case of 
						: ($command="01040000")
							
						: ($command="01040100")
							
						: ($command="01140000")
							
						: ($command="01140100")
							
					End case 
				End if 
				
				$sent:=TCP Send Blob ($socket;$response)
				TCP Close ($socket)
				$socket:=0
				
			End if 
			
		End if 
		
	End if 
	
End while 

If ($socket#0)
	TCP Close ($socket)
End if 

KILL WORKER:C1390