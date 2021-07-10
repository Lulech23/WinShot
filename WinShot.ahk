; //////////////////////////////////////
; //    WINSHOT by LULECH23 [v1.0]    //
; //////////////////////////////////////
;
; Turn the Windows key into a global "Share" button for PC games!
;
; HOW-TO:
; * Long-press Win key to take a screenshot
; * Double-press Win key to start/stop recording video
; * Single-press Win key for normal functionality
;
; All functionality is handled by the Xbox Game Bar. Configure in
; Windows Settings for best results.
;

#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Initialize screenshot function
ScreenShot() {
    Loops := 0
    Loop {
        Sleep, 100
        If (Loops < 5) {
            If (!GetKeyState("LWin", "P")) {
                Return False
            }
        }
        If (Loops = 5) {
            SoundBeep, 16000, 150
            Send, {LWin down}{Alt down}{PrintScreen down}{PrintScreen up}{Alt up}{LWin up}
            Return True
        }
        Loops++
    }
}

; Initialize video record function
VideoRecord() {
    Send, {LWin down}{Alt down}{r down}{r up}{Alt up}{LWin up}
}

; Assign functions to key
LWin::
If (ScreenShot() = True) {
    ; Take screenshot, if long-pressed
    KeyWait, LWin
    Return
} Else {
    KeyWait, LWin
    KeyWait, LWin, D T0.15
    If (!ErrorLevel) {
        ; Take video, if double-pressed
        VideoRecord()
    } Else {
        ; Otherwise passthrough if single-pressed
        Send, {LWin}
    }
    Return
}