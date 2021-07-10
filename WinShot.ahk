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
    Loops := 5 ; Time to wait for hold
    Loop {
        Sleep, 100
        If (Loops > 0) {
            If (!GetKeyState("LWin", "P")) {
                Return False
            }
        }
        If (Loops = 0) {
            Send, {LWin down}{Alt down}{PrintScreen down}{PrintScreen up}{Alt up}{LWin up}
            Return True
        }
        Loops--
    }
}

; Initialize video record function
VideoRecord() {
    Loops := 15 ; Time to wait for double-press
    Loop {
        Sleep, 1
        If (Loops > 0) {
            If (GetKeyState("LWin", "P")) {
                Send, {LWin down}{Alt down}{r down}{r up}{Alt up}{LWin up}
                Return True
            }
        }
        If (Loops = 0) {
            ; Otherwise passthrough if single-pressed
            Return False
        }
        Loops--
    }
}

; Assign functions to key
LWin::
If (ScreenShot()) {
    ; Take screenshot, if long-pressed
    KeyWait, LWin
    Return
} Else {
    KeyWait, LWin
    ; Take video, if double-pressed
    If (!VideoRecord()) {
        ; Otherwise passthrough if single-pressed
        Send, {LWin}
    }
    Return
}