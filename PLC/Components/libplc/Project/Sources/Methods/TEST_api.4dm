//%attributes = {"invisible":true}
$PLC:=PLC ("MELSEC-Q/L")  //バイナリ形式
$data:=$PLC.getWait(16)

$PLC:=PLC ("MELSEC-Q/L";True:C214)  //ASCII形式
$data:=$PLC.getWait(16)

$PLC:=PLC ("MELSEC-Q/L")  //バイナリ形式
$data:=$PLC.getInterfaceCode()

$PLC:=PLC ("MELSEC-Q/L";True:C214)  //ASCII形式
$data:=$PLC.getInterfaceCode()

$PLC:=PLC ("MELSEC-Q/L")  //バイナリ形式
$data:=$PLC.getNetworkCode()

$PLC:=PLC ("MELSEC-Q/L";True:C214)  //ASCII形式
$data:=$PLC.getNetworkCode()

$PLC:=PLC ("MELSEC-Q/L")  //バイナリ形式
$data:=$PLC.getDevicePoints(5)
$data:=$PLC.getDevicePoints(20)

$PLC:=PLC ("MELSEC-Q/L";True:C214)  //ASCII形式
$data:=$PLC.getDevicePoints(5)
$data:=$PLC.getDevicePoints(20)

$PLC:=PLC ("MELSEC-Q/L")  //バイナリ形式
$data:=$PLC.getDeviceCode("B")
$data:=$PLC.getDeviceCode("D")
$data:=$PLC.getDeviceCode("W")

$PLC:=PLC ("MELSEC-Q/L";True:C214)  //ASCII形式
$data:=$PLC.getDeviceCode("B")
$data:=$PLC.getDeviceCode("D")
$data:=$PLC.getDeviceCode("W")

$PLC:=PLC ("MELSEC-Q/L")  //バイナリ形式
$subheader:=$PLC.getRequestSubheader()
$subheader:=$PLC.getResponseSubheader()

$PLC:=PLC ("MELSEC-Q/L";True:C214)  //ASCII形式
$subheader:=$PLC.getRequestSubheader()
$subheader:=$PLC.getResponseSubheader()

