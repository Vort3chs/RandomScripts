#include <ButtonConstants.au3>
#include <MsgBoxConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Misc.au3>
#include <StaticConstants.au3>
#include <SliderConstants.au3>

Global $Speed, $aPos, $X, $Y, $OrgX, $OrgY, $MouseRevert, $SpeedReturn

$MouseRevert = 0
$Speed = 1

#Region ### START Koda GUI section ### Form=
Global $ClickHack = GUICreate("ClickHack", 308, 237, 407, 202, -1, BitOR($WS_EX_TOPMOST,$WS_EX_WINDOWEDGE))
GUISetBkColor(0x00FFFF)
Global $Button2 = GUICtrlCreateButton("Start The Hack!", 18, 24, 273, 73, BitOR($BS_VCENTER,$BS_MULTILINE))
GUICtrlSetBkColor(-1, 0x00FF00)
GUICtrlSetTip(-1, "Start ClickHack")
GUICtrlSetCursor (-1, 0)
Global $Label4 = GUICtrlCreateLabel("Ceated by: Vort3chs", 0, 0, 100, 17)
Global $Button1 = GUICtrlCreateButton("GitHub", 249, 0, 57, 17)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x000000)
GUICtrlSetCursor (-1, 0)
Global $Button3 = GUICtrlCreateButton("About", 193, 0, 57, 17)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x000000)
GUICtrlSetCursor (-1, 0)
Global $Label5 = GUICtrlCreateLabel("Hold P to pause the hack, release to resume!", 44, 98, 217, 17)
GUICtrlSetFont(-1, 5, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
Global $Label6 = GUICtrlCreateLabel("NOT CLICKING!", 104, 0, 80, 18)
GUICtrlSetColor(-1, 0x001F40)
Global $Slider1 = GUICtrlCreateSlider(26, 192, 265, 25, BitOR($GUI_SS_DEFAULT_SLIDER,$WS_BORDER))
GUICtrlSetLimit(-1, 1000, 1)
GUICtrlSetData(-1, 1)
Global $Label8 = GUICtrlCreateLabel("This slider changes the hack's clicking speed.", 48, 218, 221, 17)
Global $Label9 = GUICtrlCreateLabel("30ms", 2, 196, 23, 17)
Global $Label10 = GUICtrlCreateLabel("1s", 292, 196, 15, 17)
Global $Button4 = GUICtrlCreateButton("How to use?", 82, 113, 145, 25)
GUICtrlSetBkColor(-1, 0x00FF00)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###



While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			ShellExecute("http://github.com/vort3chs")
		Case $Button2
			GUICtrlSetState($Button2,$GUI_Disable)
			GUICtrlSetData($Button2,"Hit SPACE at desired location to begin clicking!" & @CRLF & "Hit ESCAPE to cancel")
			HackWait()
		Case $Button3
			GUICtrlSetState($Button3, $GUI_Disable)
			MsgBox($mb_iconinformation, "About the Developer:", "Created by: Austen Lage (Vort3chs)" & @CRLF & @CRLF & _
					"This version was released on 9-7-2014" & @CRLF & @CRLF & _
					"All of the code, the README, updated download links, my other programs, etc. are available on my GitHub!" & @CRLF & @CRLF & _
					"Thanks for using my program! :)")
			GUICtrlSetState($Button3, $GUI_Enable)
	EndSwitch
WEnd

Func StartClick()
	HotKeySet("{SPACE}")
	GUICtrlSetData($Button2,"Hit ESCAPE at any time to stop clicking!")
	While 1
		$SpeedReturn = TimerInit()
		WinSetTitle($ClickHack, "", "[ClickHack] Status: Clicking!")
		MouseClick("Left")
		$Speed = GUICtrlRead($Slider1)
		Sleep($Speed)
		If _IsPressed("BD") Then
			GUICtrlSetData($Slider1, $Speed - 15)
		EndIf
		If _IsPressed("BB") Then
			GUICtrlSetData($Slider1, $Speed + 15)
		EndIf
		If _IsPressed("1B") Then
			WinSetTitle($ClickHack, "", "[ClickHack] Status: Off")
			GUICtrlSetData($Button2,"Start Hack!")
			GUICtrlSetData($Label6,"NOT CLICKING!")
			GUICtrlSetState($Button2,$GUI_Enable)
			Return
		EndIf
		While _IsPressed("50")
			Sleep(100)
			GUICtrlSetData($Label6,"Hack Paused!")
			WinSetTitle($ClickHack, "", "[ClickHack] Status: Paused")
		WEnd
		GUICtrlSetData($Label6, "Speed: " & Int(TimerDiff($SpeedReturn)))
	WEnd
	Return
EndFunc   ;==>StartClick

Func HackWait()
	HotKeySet("{SPACE}", "StartClick")
	If _IsPressed("1B") Then
		HotKeySet("{SPACE}")
	EndIf
EndFunc   ;==>HackWait


