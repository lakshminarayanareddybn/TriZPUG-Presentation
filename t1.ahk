apps := {}
apps["01-PP"] := ["Kivy.pptx", "N:\Kivy\TriZPUG\Kivy.pptx"]
apps["02-PG"] := ["cmd", "pong"]
apps["03-EX"] := ["cmd", "ex"] ; apps["04-CT"] := ["cmd", "main"]
apps["11-E3"] := ["cmd", "tutorial.3"]
apps["51-NP"] := ["Notepad", "Notepad"]
apps["53-UB"] := ["Tiger", "n:\kivy\trizpug\vncviewer"]
apps["52-DX"] := ["Droid4X", "C:\Program Files (x86)\Droid4X\Droid4X.exe"]
apps["60-QT"] := ""
l := "" ; string of keys separated by | for ListBox
r := 0  ; # of keys
for k in apps {
	l := l k "|" 
	r += 1
}
l := SubStr(l, 1, strlen(l)-1)
SetTitleMatchMode 2

Gui, New,  AlwaysOnTop -caption
Gui, Add, ListBox, vApp gLsub Sort R%r% W37 x0 y0, %l%
gui, margin, 0, 0
Gui, Show, x0 y0 NoActivate
return

Lsub:
GuiControlGet, app  
if (App = "60-QT") 
	ExitApp
w := apps[App]
if (w.length() = 1) 
  runwait % w[1] 
else {
  IfWinExist % w[1]
    WinActivate % w[1]
  else {
	send ^#d   ; add a desktop to the task views
	If substr(w[1], 1, 3) = "cmd" 
		run % "n:\kivy\trizpug\cmd_as_admin.lnk"
	else
		run % w[2]
	WinWait % w[1]
  }
}
If substr(w[1], 1, 3) = "cmd" 
	send % "c:\python35\python n:\kivy\trizpug\" w[2] ".py{Enter}"
