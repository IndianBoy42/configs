#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
;//////////////////////////////////////////////////////////////
; initialization
; env variables
;//////////////////////////////////////////////////////////////
#SingleInstance Force ; Allow only one running instance of script.
CoordMode, ToolTip, Screen ; Place ToolTips at absolute screen coordinates:
SetCapsLockState, alwaysoff

CapsLock & h::Left 
CapsLock & j::Down 
CapsLock & k::Up 
CapsLock & l::Right 
CapsLock & y::Home 
CapsLock & u::PgDn 
CapsLock & i::PgUp 
CapsLock & o::End 
CapsLock & Space::Ctrl
CapsLock & g::WheelDown
CapsLock & t::WheelUp
CapsLock & Enter::^+P
CapsLock & [::^+O