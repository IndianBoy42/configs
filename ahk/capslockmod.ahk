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
CapsLock & n::Home 
CapsLock & m::PgDn 
CapsLock & ,::PgUp 
CapsLock & .::End 
CapsLock & Space::Ctrl
CapsLock & g::WheelDown
CapsLock & t::WheelUp
CapsLock & Enter::^+P
CapsLock & ]::!+F
CapsLock & [::^+O
CapsLock & q::F13
CapsLock & w::F14
CapsLock & e::F15
CapsLock & r::F16
CapsLock & a::F17
CapsLock & s::F18
CapsLock & d::F19
CapsLock & f::F20
CapsLock & z::F21
CapsLock & x::F22
CapsLock & c::F23
CapsLock & v::F24
CapsLock & Tab::^+Esc
CapsLock & y::ShiftAltTab
CapsLock & u::AltTab
>!j::ShiftAltTab
>!k::AltTab
CapsLock & Alt::AltTab
CapsLock & i::^+Tab
CapsLock & o::^Tab
