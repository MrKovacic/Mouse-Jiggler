#include <GUIConstantsEx.au3>
#include <EditConstants.au3>

Opt("GUIOnEventMode", 1)  ; Change to OnEvent mode 
$i = 1
$m = 0
$mainwindow = GUICreate("Mouse Jiggler 1.0", 250, 100)
GUISetOnEvent($GUI_EVENT_CLOSE, "CLOSEClicked")
GUICtrlCreateLabel ("Jiggle every", 10, 10, 80, 20)
$input = GUICtrlCreateInput("1", 70, 10, 50, 20, $ES_READONLY)
$updown = GUICtrlCreateUpdown($input)
GUICtrlSetLimit(-1, 15, 1)
GUICtrlCreateLabel ("minutes", 130, 10, 50, 20)
$jiggle =   GUICtrlCreateButton ( "jiggle it!", 10, 40 , 150 , 30) 
GUICtrlSetOnEvent($jiggle, "OKButton")
GUISetState(@SW_SHOW)

While 1
    if GUICtrlRead ($jiggle) = "cancel or wait" Then
        MouseMove ( $m[0]+5, $m[1]+5 , 3 )
        MouseMove ( $m[0], $m[1] , 3 )
        For $i = $i to 1 Step -1
            GUICtrlSetData ($jiggle, "cancel or wait " & $i & " seconds")
            sleep(900)
        next
        if $i >= 0 then GUICtrlSetData ($jiggle, "cancel or wait")
        $m = MouseGetPos ( )
        $i = GUICtrlRead ($input) * 60
    endif
    Sleep(100)  ; Idle around
WEnd

Func OKButton()
    if GUICtrlRead ($jiggle) = "jiggle it!" Then
        $m = MouseGetPos ( )
        $i = GUICtrlRead ($input) * 60
        GUICtrlSetData ($jiggle, "cancel or wait")
    Else
        $i = -1
        GUICtrlSetData ($jiggle, "jiggle it!")
    endif
EndFunc

Func CLOSEClicked()
    Exit
EndFunc