#include <ButtonConstants.au3>
#include <MsgBoxConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Misc.au3>
#include <StaticConstants.au3>

Global $aPos, $X, $Y, $OrgX, $OrgY, $MouseRevert

$MouseRevert = 0

#Region ### START Koda GUI section ### Form=
Global $ClickHack = GUICreate("ClickHack", 309, 232, 308, 252, -1, BitOR($WS_EX_TOPMOST,$WS_EX_WINDOWEDGE))
GUISetBkColor(0x00FFFF)
Global $Button2 = GUICtrlCreateButton("Start The Hack!", 16, 24, 273, 73)
GUICtrlSetBkColor(-1, 0x00FF00)
GUICtrlSetTip(-1, "Start ClickHack")
GUICtrlSetCursor (-1, 0)
Global $Label1 = GUICtrlCreateLabel("Click start hack and then mouse over the area where you", 16, 96, 274, 17)
Global $Label2 = GUICtrlCreateLabel("would like to click and hit space to begin clicking!", 32, 112, 238, 17)
Global $Label3 = GUICtrlCreateLabel("HIT ESCAPE TO STOP THE HACK", 24, 144, 254, 24)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
Global $Label4 = GUICtrlCreateLabel("Ceated by: Vort3chs", 0, 0, 100, 17)
Global $Button1 = GUICtrlCreateButton("GitHub", 248, 0, 57, 17)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x000000)
GUICtrlSetCursor (-1, 0)
Global $Button3 = GUICtrlCreateButton("About", 192, 0, 57, 17)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetBkColor(-1, 0x000000)
GUICtrlSetCursor (-1, 0)
Global $Label5 = GUICtrlCreateLabel("Hold P to pause the hack, release to resume!", 40, 128, 217, 17)
GUICtrlSetFont(-1, 5, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
Global $Label6 = GUICtrlCreateLabel("NOT CLICKING!", 104, 0, 80, 18)
GUICtrlSetColor(-1, 0x001F40)
Global $Slider1 = GUICtrlCreateSlider(24, 168, 265, 17)
GUICtrlSetLimit(-1, 1000, 10)
GUICtrlSetData(-1, 10)
Global $Label7 = GUICtrlCreateLabel("Hit '+' or '-' to change the slider while clicking!", 48, 207, 225, 17)
Global $Label8 = GUICtrlCreateLabel("This slider changes the hack's clicking speed.", 46, 192, 221, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			ShellExecute("http://github.com/vort3chs")
		Case $Button2
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
	While 1
		GUICtrlSetData($Label6, "CLICKING")
		GUICtrlSetColor($Label6, 0xFF0000)
		MouseClick("Left")
		Sleep(1)
		If _IsPressed("1B") Then
			GUICtrlSetData($Label6, "NOT CLICKING")
			GUICtrlSetColor($Label6, 0x008000)
			Return
		EndIf
		While _IsPressed("50")
			Sleep(1)
			GUICtrlSetData($Label6, "NOT CLICKING")
			GUICtrlSetColor($Label6, 0x008000)
		WEnd
	WEnd
	Return
EndFunc   ;==>StartClick

Func HackWait()
	HotKeySet("{SPACE}", "StartClick")
	If _IsPressed("1B") Then
		HotKeySet("{SPACE}")
	EndIf
EndFunc   ;==>HackWait
