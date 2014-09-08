#RequireAdmin

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Zip.au3>

MainGUI()

Func MainGUI()
	ConsoleWrite('@@ (11) :(' & @MIN & ':' & @SEC & ') MainGUI()' & @CR) ;### Function Trace
	Global $Main_GUI = GUICreate("Gmod texture Installer 1.0", 397, 263, 617, 387)
	Global $Title = GUICtrlCreateLabel("Gmod CS:S texture installer", 8, 24, 376, 36)
	GUICtrlSetFont(-1, 20, 400, 0, "Bookman Old Style")
	Global $Subtitle = GUICtrlCreateLabel("Installs all needed CS:S textures to play Gmod.", 88, 72, 223, 17)
	Global $Install = GUICtrlCreateButton("Install", 112, 120, 177, 41)
	GUICtrlSetTip(-1, "Install Textures")
	Global $About = GUICtrlCreateButton("About", 304, 0, 89, 25)
	Global $Createdby = GUICtrlCreateLabel("Created by: Vort3chs", 0, 0, 103, 17)
	Global $InstallProg = GUICtrlCreateProgress(8, 200, 377, 41)
	Global $Status = GUICtrlCreateLabel("Status:", 112, 176, 173, 17, $SS_CENTER)
	GUICtrlSetState($Status, $GUI_HIDE)
	Global $Label1 = GUICtrlCreateLabel("Press ESCAPE to cancel the installation", 104, 96, 192, 17)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				Exit
			Case $Install
				GUICtrlSetState($Install, $GUI_DISABLE)
				InstallTextures()
				GUICtrlSetState($Install, $GUI_ENABLE)
			Case $About
				GUICtrlSetState($About, $GUI_DISABLE)
				AboutGUI()
				GUICtrlSetState($About, $GUI_ENABLE)
		EndSwitch
	WEnd
EndFunc   ;==>MainGUI

Func AboutGUI()
	ConsoleWrite('@@ (43) :(' & @MIN & ':' & @SEC & ') AboutGUI()' & @CR) ;### Function Trace
	$About_GUI = GUICreate("About!", 620, 438, 262, 223)
	$Label24 = GUICtrlCreateLabel("All code, and main GUI design by: Vort3chs", 160, 24, 310, 24)
	GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
	$Label70 = GUICtrlCreateLabel("Thank you for checking out StatCheck, if you have any questions or comments, please contact me @ my github.", 40, 248, 535, 17)
	GUICtrlSetColor(-1, 0x0000FF)
	GUICtrlSetCursor(-1, 0)
	$Button68 = GUICtrlCreateButton("http://github.com/vort3chs", 232, 56, 177, 33)
	GUICtrlSetColor(-1, 0x0000FF)
	GUICtrlSetTip(-1, "Go to Vort3chs' GitHub")
	GUISetState()

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				GUIDelete($About_GUI)
				ExitLoop
			Case $Button68
				ShellExecute("http://github.com/vort3chs")
		EndSwitch
	WEnd
EndFunc   ;==>AboutGUI

Func InstallTextures()
	ConsoleWrite('@@ (67) :(' & @MIN & ':' & @SEC & ') InstallTextures()' & @CR) ;### Function Trace
	GUICtrlSetState($Status, $GUI_SHOW)
	HotKeySet("{ESC}", "_StopInstall")
	GUICtrlSetData($Status, "Status: Creating Directories")
	DirCreate("C:\Program Files (x86)\Steam\SteamApps\common\GarrysMod\garrysmod\addons\CSS Content Addon (Dec2013)")
	GUICtrlSetData($InstallProg, 5)
	DirCreate("C:\Program Files (x86)\Steam\SteamApps\common\GarrysMod\garrysmod\addons\CSS Maps Addon (Dec2013)")
	GUICtrlSetData($InstallProg, 10)
	FileInstall("C:\Users\Austen\Desktop\GMODTEXTURES\addons.txt", "C:\Program Files (x86)\Steam\SteamApps\common\GarrysMod\garrysmod\addons\addons.txt")
	GUICtrlSetData($Status, "Status: Creating materials.zip")
	FileInstall("C:\Users\Austen\Desktop\GMODTEXTURES\CSS Content Addon (Dec2013)\materials.zip", @TempDir & "\materials.zip")
	GUICtrlSetData($InstallProg, 15)
	GUICtrlSetData($Status, "Status: Creating models.zip")
	FileInstall("C:\Users\Austen\Desktop\GMODTEXTURES\CSS Content Addon (Dec2013)\models.zip", @TempDir & "\models.zip")
	GUICtrlSetData($InstallProg, 20)
	GUICtrlSetData($Status, "Status: Creating particles.zip")
	FileInstall("C:\Users\Austen\Desktop\GMODTEXTURES\CSS Content Addon (Dec2013)\particles.zip", @TempDir & "\particles.zip")
	GUICtrlSetData($InstallProg, 25)
	GUICtrlSetData($Status, "Status: Creating scripts.zip")
	FileInstall("C:\Users\Austen\Desktop\GMODTEXTURES\CSS Content Addon (Dec2013)\scripts.zip", @TempDir & "\scripts.zip")
	GUICtrlSetData($InstallProg, 30)
	GUICtrlSetData($Status, "Status: Creating sound.zip")
	FileInstall("C:\Users\Austen\Desktop\GMODTEXTURES\CSS Content Addon (Dec2013)\sound.zip", @TempDir & "\sound.zip")
	GUICtrlSetData($InstallProg, 35)
	FileInstall("C:\Users\Austen\Desktop\GMODTEXTURES\CSS Content Addon (Dec2013)\addon.txt", "C:\Program Files (x86)\Steam\SteamApps\common\GarrysMod\garrysmod\addons\CSS Content Addon (Dec2013)\addon.txt")
	GUICtrlSetData($InstallProg, 40)
	GUICtrlSetData($Status, "Status: Unzipping materials.zip")
	_Zip_Unzip(@TempDir & "\materials.zip", "materials", "C:\Program Files (x86)\Steam\SteamApps\common\GarrysMod\garrysmod\addons\CSS Content Addon (Dec2013)")
	GUICtrlSetData($InstallProg, 45)
	GUICtrlSetData($Status, "Status: Unzipping models.zip")
	_Zip_Unzip(@TempDir & "\models.zip", "models", "C:\Program Files (x86)\Steam\SteamApps\common\GarrysMod\garrysmod\addons\CSS Content Addon (Dec2013)")
	GUICtrlSetData($InstallProg, 50)
	GUICtrlSetData($Status, "Status: Unzipping particles.zip")
	_Zip_Unzip(@TempDir & "\particles.zip", "particles", "C:\Program Files (x86)\Steam\SteamApps\common\GarrysMod\garrysmod\addons\CSS Content Addon (Dec2013)")
	GUICtrlSetData($InstallProg, 55)
	GUICtrlSetData($Status, "Status: Unzipping scripts.zip")
	_Zip_Unzip(@TempDir & "\scripts.zip", "scripts", "C:\Program Files (x86)\Steam\SteamApps\common\GarrysMod\garrysmod\addons\CSS Content Addon (Dec2013)")
	GUICtrlSetData($InstallProg, 60)
	GUICtrlSetData($Status, "Status: Unzipping sound.zip")
	_Zip_Unzip(@TempDir & "\sound.zip", "sound", "C:\Program Files (x86)\Steam\SteamApps\common\GarrysMod\garrysmod\addons\CSS Content Addon (Dec2013)")
	GUICtrlSetData($InstallProg, 65)
	GUICtrlSetData($Status, "Status: Deleting temp files. . .")
	FileDelete(@TempDir & "\materials.zip")
	GUICtrlSetData($InstallProg, 70)
	FileDelete(@TempDir & "\models.zip")
	GUICtrlSetData($InstallProg, 75)
	FileDelete(@TempDir & "\particles.zip")
	GUICtrlSetData($InstallProg, 80)
	FileDelete(@TempDir & "\scripts.zip")
	GUICtrlSetData($InstallProg, 85)
	FileDelete(@TempDir & "\sound.zip")
	GUICtrlSetData($InstallProg, 92)
	FileInstall("C:\Users\Austen\Desktop\GMODTEXTURES\CSS Maps Addon (Dec2013)\maps.zip", @TempDir & "\maps.zip")
	GUICtrlSetData($InstallProg, 96)
	FileInstall("C:\Users\Austen\Desktop\GMODTEXTURES\CSS Maps Addon (Dec2013)\addon.txt", "C:\Program Files (x86)\Steam\SteamApps\common\GarrysMod\garrysmod\addons\CSS Maps Addon (Dec2013)\addon.txt")
	GUICtrlSetData($InstallProg, 98)
	GUICtrlSetData($Status, "Status: Unzipping maps.zip")
	_Zip_Unzip(@TempDir & "\maps.zip", "maps", "C:\Program Files (x86)\Steam\SteamApps\common\GarrysMod\garrysmod\addons\CSS Maps Addon (Dec2013)")
	FileDelete(@TempDir & "\maps.zip")
	GUICtrlSetData($InstallProg, 100)
	GUICtrlSetData($Status, "Status: Finished!")
	MsgBox(0, "FINISHED!", "All of the CS:S maps and textures were installed properly!")
	If @error Then MsgBox(0, "ERROR!", "There was an error with the error number of: " & @error)
	HotKeySet("{ESC}")
EndFunc   ;==>InstallTextures

Func _StopInstall()
	ConsoleWrite('@@ (134) :(' & @MIN & ':' & @SEC & ') _StopInstall()' & @CR) ;### Function Trace
	FileDelete(@TempDir & "\materials.zip")
	FileDelete(@TempDir & "\models.zip")
	FileDelete(@TempDir & "\particles.zip")
	FileDelete(@TempDir & "\scripts.zip")
	FileDelete(@TempDir & "\sound.zip")
	DirRemove("C:\Program Files (x86)\Steam\SteamApps\common\GarrysMod\garrysmod\addons\CSS Maps Addon (Dec2013)")
	DirRemove("C:\Program Files (x86)\Steam\SteamApps\common\GarrysMod\garrysmod\addons\CSS Content Addon (Dec2013)")
	Exit
EndFunc   ;==>_StopInstall
