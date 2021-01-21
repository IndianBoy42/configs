; Modal_Vim.ahk
; Initial Build: Rich Alesi
; Friday, May 29, 2009
;
; Modified for AHK_L by Andrej Mitrovic
; August 11, 2010

;; globals
inputNumber := " "
modal = 0

#SingleInstance force
#MaxHotkeysPerInterval 800000
SetWinDelay, 0
CoordMode, Mouse
#Persistent
SetKeyDelay, -1
; CoordMode, Tooltip, Screen

;;; GUI
notify(text, time = 0)
{
   Progress, y989 b2 fs10 zh0 W150 WS700, %text%, , , Verdana
   if (time != 0)
   {
      Sleep, %time%
      Progress, Off
   }
   return
}

;;; Mode-Switch key
CAPSLOCK::
{
   if (modal == 0)
   {
      vimize()
      notify("vim mode", 400)
   }
   else
   {
      unvimize()
      notify("insert mode", 400)
   }
   return
}

;;; Mode-Switch and Cleanup Functions
vimize()    ;; Enter Vim mode
{
   global
   modal := true
   resetGUI()
   return
}

unvimize()  ;; Exit Vim mode, do cleanup
{
   global
   modal := false
   resetGUI()
   resetInputNumber()
   return
}

resetInputNumber()
{
   global
   resetGUI()
   inputNumber := " "
}

resetGUI()
{
   Progress, Off
}

;;; Vim Commands
#If (modal == true)

Esc::   ;; Exit Vim mode
{
   unvimize()
   return
}

;;; The following allows appending numbers before a command, 
;;; e.g. 2, 4, w == 24w which can then be used throughout the rest of the commands.
;;; The number is usually reset to 0 by a move/modify command or ESC.
$0::
{
   inputNumber = %inputNumber%0
   notify(inputNumber)
   return
}

$1::
{
   inputNumber = %inputNumber%1
   notify(inputNumber)
   return
}

$2::
{
   inputNumber = %inputNumber%2
   notify(inputNumber)
   return
}

$3::
{
   inputNumber = %inputNumber%3
   notify(inputNumber)
   return
}

$4::
{
   inputNumber = %inputNumber%4
   notify(inputNumber)
   return
}

$5::
{
   inputNumber = %inputNumber%5
   notify(inputNumber)
   return
}

$6::
{
   inputNumber = %inputNumber%6
   notify(inputNumber)
   return
}

$7::
{
   inputNumber = %inputNumber%7
   notify(inputNumber)
   return
}

$8::
{
   inputNumber = %inputNumber%8
   notify(inputNumber)
   return
}

$9::
{
   inputNumber = %inputNumber%9
   notify(inputNumber)
   return
}

;;; Navigation
h::
{
   Send, {Left %inputNumber%} 
   resetInputNumber()
   return
}

l::
{
   Send, {Right %inputNumber%} 
   resetInputNumber()
   return
}

k::
{
   Send, {Up %inputNumber%} 
   resetInputNumber()
   return
}

j::
{
   Send, {Down %inputNumber%} 
   resetInputNumber()
   return
}

^j::
{
   Send, {PgUp}
   return
}

^K::
{
   Send, {PgDn}
   return
}

^H::Send, {Home}
^L::Send, {End}

w::     ;; Move # words forward
{
   Send, ^{Right %inputNumber%}
   resetInputNumber()
   return
}

b::     ;; Move # words back
{
   Send, ^{Left %inputNumber%}
   resetInputNumber()
   return
}   

[::     ;; Set cursor to previous block
{
   Send, ^[
   return
}

]::     ;; Set cursor to next block
{
   Send, ^]
   return
}

;;; Selections
+k::    ;; Select Up
{
   Send, {shift down}{Up %inputNumber%}{shift up}
   resetInputNumber()
   return
}

+j::    ;; Select Down
{
   Send, {shift down}{Down %inputNumber%}{shift up}
   resetInputNumber()
   return
}

+h::    ;; Select Left
{
   Send, {shift down}{Left %inputNumber%}{shift up}
   resetInputNumber()
   return
}

+l::    ;; Select Right
{
   Send, {shift down}{Right %inputNumber%}{shift up}
   resetInputNumber()
   return
}

^+k::    ;; Select Page Up
{
   Send, {shift down}{PgUp}{shift up}
   return
}

^+j::    ;; Select Page Down
{
   Send, {shift down}{PgDn}{shift up}
   return
}

+w::    ;; Select # Next Word
{
   Send, +^{Right %inputNumber%}
   resetInputNumber()
   return
}

+b::    ;; Select # Previous Words
{
   Send, +^{Left %inputNumber%}
   resetInputNumber()
   return
}

+[::    ;; Select to previous block
{
   Send, {ctrl down}{shift down}[{ctrl up}{shift up}
   return
}

+]::    ;; Select to next block
{
   Send, {ctrl down}{shift down}]{ctrl up}{shift up}
   return
}

;;; Search & Replace
/::     ;; Search
{
   Send, ^f             ;; Call the search dialog
   unvimize()           ;; Switch to insert mode
   KeyWait, Enter, D    ;; Enter exits search dialog
   vimize()             ;; Return back to vim mode
   return
}

^/::    ;; Replace
{
   Send, ^h         ;; Call the replace dialog
   unvimize()       ;; Switch to insert mode
   KeyWait, Esc, D  ;; Esc exits replace dialog
   vimize()         ;; Return back to vim mode
   return
}

n::Send {F3}    ;; Search next
+n::Send +{F3}  ;; Search previous


; Editing
$c::     ;; Copy selection
{
   Send ^c
   notify("Selection copied.", 1000)
   return
}

d::     ;; Forward delete # characters
{
   Send, {DEL %inputNumber%}
   resetInputNumber()
   return
}

+d::    ;; Backward delete # characters
{
   Send, {Backspace %inputNumber%}
   resetInputNumber()
   return
}

q::     ;; Comment a line or selected lines
{
   Send, ^q
   return
}

u::Send, ^z     ;; Undo
y::Send, ^y     ;; Redo

^u::    ;; Reopen last closed tab
{
   Send, {alt down}f{1}{alt up}
   return
}

; :*C:wd::    ;; Delete # words
; {
   ; Send, {CTRL down}DEL %inputNumber%}{CTRL up}
   ; resetInputNumber()
   ; return

; }

;;; Pasting
p::     ;; Paste at new line
IfInString, clipboard, `n
{
   Send, {END}{ENTER}^v{DEL}
}
Else
{
   Send, {END}{ENTER}^v ;^v
}
return

+p::    ;; Paste at beginning of line (does not work for some reason)
IfInString, clipboard, `n
{
   Send, {Home}^v{Enter}
}
Else
{
   Send, ^v
}
return

;;; Indenting
+.::Send, {Home}`t                      ;; Indent  
+,::Send, {Home}{Shift Down}{Tab}{Shift Up}   ;; Un-indent

;;; Miscellanous Scite commands
^[::    ;; Select previous file
{
   Send, {ctrl down}{shift down}{Tab}{shift up}{ctrl up}
   return
}

^]::    ;; Select next file
{
   Send, ^{Tab}
   return
}

x::     ;; Close tab
{
   Send, ^w
   return
}

#If