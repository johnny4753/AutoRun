#include <Array.au3>
#include <File.au3>
#include <GUIConstantsEx.au3>
#NoTrayIcon
Global $pidAry[100]
Global $pidPointer
_CreateGUI()

Func _CreateGUI()
   Opt ("GUIOnEventMode", 1);; 開啟OnEventMode
   GUICreate ("Test", 250, 100);; 建立GUI視窗
   GUISetOnEvent ( $GUI_EVENT_CLOSE, "_CLOSE");; 按下 右上角 CLOSE 會執行 _CLOSE

   GUICtrlCreateButton("Start", 10, 30, 100)
   GUICtrlSetOnEvent(-1, "OnStartPressed")
   GUICtrlCreateButton("CloseAll", 130, 30, 100)
   GUICtrlSetOnEvent(-1, "OnCloseAllPressed")

   GUISetState (@SW_SHOW);; 顯示GUI
   While True;; 無窮迴圈
        Sleep(10);等待 10ms 減少CPU 使用
   WEnd
EndFunc

Func _CLOSE()
   GUIDelete()
   Exit
EndFunc


Func OnStartPressed()
   Local $inputLines
   Local $sArray
   $settingFile = "AutoRunFileSetting.txt"
   _FileReadToArray($settingFile, $inputLines)		;將 $file 讀進 $inputLines 陣列，$inputLines[$i]為第i行的值
   For $i = 1 to UBound($inputLines) -1      ;走訪 $file 的所有line
	   If StringInStr($inputLines[$i], "wait") Then		;如果該行有子字串wait
		 $sArray = StringSplit($inputLines[$i], " ")		;將該行以空白切割
		 $waitTime = $sArray[2]							;$sArray[0]為切割後的元素數量，所以wait 2000的2000為$sArray[2]
		 Sleep($waitTime)
	   EndIf

	   If StringInStr($inputLines[$i], '"') Then
		  $aLine = StringTrimRight($inputLines[$i], 1)	;去掉最右邊的"
		  $aLine = StringTrimLeft($aLine, 1)			;去掉最左邊的"
		  $sArray = StringSplit($aLine, "\")			;將該行檔案路徑以\切割
		  $fileName = $sArray[UBound($sArray) - 1]		;取得最後面的元素，即[檔案名稱]
		  $fileNameLength = StringLen($fileName)		;取得[檔案名稱] 的字串長度，此長度用來去掉後面，以取得工作目錄
		  $workDir = StringTrimRight($aLine, $fileNameLength)	;去掉該行最右邊的[檔案名稱]，取得工作目錄
		  $pidAry[$pidPointer] = ShellExecute($fileName, "", $workDir)
		  $pidPointer = $pidPointer + 1
	   EndIf
	Next
EndFunc

Func OnCloseAllPressed()
   For $i = 0 to UBound($pidAry) -1
	  If ProcessExists($pidAry[$i]) Then
		 ProcessClose($pidAry[$i])
	  EndIf
   Next
EndFunc



