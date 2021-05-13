//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
C_OBJECT:C1216($0;$EXPORT)

$EXPORT:=New object:C1471

  //member methods

$EXPORT.request:=Formula:C1597(get_request )
$EXPORT.response:=Formula:C1597(set_response )

$EXPORT.getRequestSubheader:=Formula:C1597(get_request_subheader )
$EXPORT.getResponseSubheader:=Formula:C1597(get_response_subheader )

$EXPORT.getDeviceCode:=Formula:C1597(get_device_code )
$EXPORT.getCommandCode:=Formula:C1597(get_command_code )
$EXPORT.getNetworkCode:=Formula:C1597(get_network_code )
$EXPORT.getInterfaceCode:=Formula:C1597(get_interface_code )
$EXPORT.getWait:=Formula:C1597(get_wait )
$EXPORT.getDevicePosition:=Formula:C1597(get_device_position )
$EXPORT.getData:=Formula:C1597(get_data )
$EXPORT.getLength:=Formula:C1597(get_length )
$EXPORT.getDevicePoints:=Formula:C1597(get_device_points )

$EXPORT.fromHex:=Formula:C1597(hex_to_data )
$EXPORT.fromAscii:=Formula:C1597(ascii_to_data )

$EXPORT.append:=Formula:C1597(COPY BLOB:C558($2->;$1->;0;BLOB size:C605($1->);BLOB size:C605($2->)))  //$1+=$2

  //properties (default settings)

$EXPORT.mode:="read"
$EXPORT.deviceCode:="B"
$EXPORT.wait:=16  //監視タイマ; 16x250ms=4秒)
$EXPORT.timeout:=3  //送受信タイムアウト/秒

If (Count parameters:C259=0)
	$EXPORT.model:="MELSEC-Q/L"  //default
Else 
	C_TEXT:C284($1)
	$EXPORT.model:=$1
End if 

If (Count parameters:C259<2)
	$EXPORT.useAscii:=False:C215  //default
Else 
	C_BOOLEAN:C305($2)
	$EXPORT.useAscii:=$2
End if 

If (Count parameters:C259<3)
	$EXPORT.frame:="3E"  //default
Else 
	C_TEXT:C284($3)
	$EXPORT.frame:=$3
End if 

$0:=$EXPORT