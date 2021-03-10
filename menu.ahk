#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance Force
SetBatchLines -1

Menu()
{
Menu, Menu, Add
Menu, Menu, Delete
Menu, Menu, Add, temp&1, temp1
Menu, Menu, Add,
Menu, Menu, Add, temp&2, temp2
Menu, Menu, Add, temp&3, temp3
Menu, Menu, Add,
Menu, Menu, Add, temp&4, temp4
Menu, Menu, Add, temp&5, temp5
Menu, Menu, Add, temp&6, temp6
Menu, Menu, Add, temp&7, temp7
Menu, Menu, Add,
Menu, InsertLineMenu, Add, temp&9, temp9
Menu, InsertLineMenu, Add, temp&10, temp10
Menu, Menu, Add, temp&8, :InsertLineMenu
Menu, Menu, Default, temp&1
Menu, Menu, Show
return
}
temp1()
{
    MsgBox, temp1
}
temp2()
{
    MsgBox, temp2
}
temp3()
{
    MsgBox, temp3
}
temp4()
{
    MsgBox, temp4
}
temp5()
{
    MsgBox, temp5
}
temp6()
{
    MsgBox, temp6
}
temp7()
{
    MsgBox, temp7
}
temp8()
{
    MsgBox, temp8
}
temp9()
{
    MsgBox, temp9
}
temp10()
{
    MsgBox, temp10
}

page_scroll(direction)
{
    if (direction == "PgDn"){
        if WinExist("ahk_exe AcroRd32.exe"){
            ControlFocus,,ahk_exe AcroRd32.exe
            sleep 10
            ControlSend,ahk_parent , {PgDn}, ahk_exe AcroRd32.exe
        }
        else if WinExist("ahk_exe chrome.exe"){
            ControlFocus,,ahk_exe chrome.exe
            sleep 10
            ControlSend,ahk_parent , {PgDn}, ahk_exe chrome.exe
        }
        else if WinExist("ahk_exe opera.exe"){
            ControlFocus,,ahk_exe opera.exe
            sleep 10
            ControlSend,ahk_parent , {PgDn}, ahk_exe opera.exe
        }
    }
    else if (direction == "PgUp"){
        if WinExist("ahk_exe AcroRd32.exe"){
            ControlFocus,,ahk_exe AcroRd32.exe
            sleep 10
            ControlSend,ahk_parent , {PgUp}, ahk_exe AcroRd32.exe
        }
        else if WinExist("ahk_exe chrome.exe"){
            ControlFocus,,ahk_exe chrome.exe
            sleep 10
            ControlSend,ahk_parent , {PgUp}, ahk_exe chrome.exe
        }
        else if WinExist("ahk_exe opera.exe"){
            ControlFocus,,ahk_exe opera.exe
            sleep 10
            ControlSend,ahk_parent , {PgUp}, ahk_exe opera.exe
        }
    }
}

$F2::
    KeyWait F2, T0.25
        if ErrorLevel
            Menu()
        else
        {
            KeyWait F2, D T0.10
            if ErrorLevel
                page_scroll("PgDn")
            else
                page_scroll("PgUp")
        }
    KeyWait F2
return