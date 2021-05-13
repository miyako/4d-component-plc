//%attributes = {"invisible":true,"preemptive":"capable"}
C_POINTER:C301($1;$pNetworkCode;$2;$interfaceCode;$3;$pExitCode;$4;$pData)
C_BLOB:C604($0;$response)


$subheader:=This:C1470.getResponseSubheader()  //サブヘッダ
$pNetworkCode:=$1  //アクセス経路（ネットワーク番号・局番）
$pInterfaceCode:=$2  //アクセス経路（要求先ユニットI/O番号・要求先ユニット局番号）
$pExitCode:=$3  //終了コード
$pData:=$4  //応答データ

$length:=This:C1470.getLength(\
BLOB size:C605($pExitCode->)+\
BLOB size:C605($pData->))  //要求データ長（終了コードから応答データまでのデータ長）

This:C1470.append(->$response;->$subheader)
This:C1470.append(->$response;$pNetworkCode)
This:C1470.append(->$response;$pInterfaceCode)
This:C1470.append(->$response;->$length)
This:C1470.append(->$response;$pExitCode)
This:C1470.append(->$response;$pData)

$0:=$response