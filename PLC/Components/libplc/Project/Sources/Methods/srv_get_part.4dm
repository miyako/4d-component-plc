//%attributes = {"invisible":true,"preemptive":"capable"}
C_POINTER:C301($1;$2)
C_LONGINT:C283($3)
C_BOOLEAN:C305($4)
C_BLOB:C604($0)

COPY BLOB:C558($1->;$0;$2->;0;$3*Choose:C955($4;2;1))

$2->:=$2->+BLOB size:C605($0)