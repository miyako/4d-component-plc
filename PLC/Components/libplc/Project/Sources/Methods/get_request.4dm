//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($1;$params)
C_BLOB:C604($payload;$request;$response;$buf)

$params:=$1

If ($params=Null:C1517)
	$params:=New object:C1471
End if 

If (Value type:C1509($params.data)=Is text:K8:3)
	$payload:=This:C1470.getData($params.data)  //送信データ
End if 

If (Value type:C1509($params.wait)#Is real:K8:4)
	$params.wait:=This:C1470.wait
End if 

If (Value type:C1509($params.mode)#Is text:K8:3)
	$params.mode:=This:C1470.mode
End if 

If (Value type:C1509($params.deviceCode)#Is text:K8:3)
	$params.deviceCode:=This:C1470.deviceCode
End if 

Case of 
	: (Value type:C1509($params.deviceNumber)=Is text:K8:3)
	: (Value type:C1509($params.deviceNumber)=Is real:K8:4)
	Else 
		$params.deviceNumber:=This:C1470.deviceNumber
End case 

If (Value type:C1509($params.points)#Is real:K8:4)
	$params.points:=0
End if 

$subheader:=This:C1470.getRequestSubheader()  //サブヘッダ
$networkCode:=This:C1470.getNetworkCode()  //アクセス経路（ネットワーク番号・局番）
$interfaceCode:=This:C1470.getInterfaceCode()  //アクセス経路（要求先ユニットI/O番号・要求先ユニット局番号）
$wait:=This:C1470.getWait($params.wait)  //監視タイマ
$command:=This:C1470.getCommandCode($params.mode)  //コマンド・サブコマンド
$deviceNumber:=This:C1470.getDeviceNumber($params.deviceNumber)  //先頭デバイス番号
$deviceCode:=This:C1470.getDeviceCode($params.deviceCode)  //デバイスコード
$points:=This:C1470.getDevicePoints($params.points)  //デバイス点数

$length:=This:C1470.getLength(\
BLOB size:C605($wait)+\
BLOB size:C605($command)+\
BLOB size:C605($deviceNumber)+\
BLOB size:C605($deviceCode)+\
BLOB size:C605($points)+\
BLOB size:C605($payload))  //要求データ長（監視タイマから要求データまでのデータ長）

This:C1470.append(->$request;->$subheader)
This:C1470.append(->$request;->$networkCode)
This:C1470.append(->$request;->$interfaceCode)
This:C1470.append(->$request;->$length)
This:C1470.append(->$request;->$wait)
This:C1470.append(->$request;->$command)
This:C1470.append(->$request;->$deviceNumber)
This:C1470.append(->$request;->$deviceCode)
This:C1470.append(->$request;->$points)
This:C1470.append(->$request;->$payload)

If (Value type:C1509($params.timeout)#Is real:K8:4)
	$params.timeout:=This:C1470.timeout
End if 

$start:=Milliseconds:C459

$socket:=TCP Open ($params.host;$params.port)

If ($socket#0)
	
	$bytesSend:=TCP Send Blob ($socket;$request)
	
	While ((Milliseconds:C459-$start)<($params.timeout*1000)) & (TCP Get State ($socket)#TCP Connection Closed)
		
		$received:=TCP Receive Blob ($socket;$buf)
		
		If ($received>0)
			This:C1470.append(->$response;->$buf)
			CLEAR VARIABLE:C89($buf)
		End if 
		
	End while 
	
	TCP Close ($socket)
	
End if 

C_VARIANT:C1683($0)

If (Bool:C1537($params.returnText))
	If (This:C1470.useAscii)
		$0:=data_to_text ($response)
	Else 
		$0:=data_to_hex ($response)
	End if 
Else 
	$0:=$response
End if 