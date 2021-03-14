#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance Force
SetBatchLines -1
Menu, Tray, Icon, %A_ScriptDir%\icon.ico

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
Menu, Menu, Add, &Dogecoin, dogecoin
Menu, Menu, Add, &File Sorter, file_sorter
Menu, autocorrect, Add, Autocorrect &Enable, autocorrect_enable
Menu, autocorrect, Add, Autocorrect &Disable, autocorrect_disable
Menu, Menu, Add, &Autocorrect, :autocorrect
Menu, sticky_script, Add, Sticky Shift &Enable, sticky_script_enable
Menu, sticky_script, Add, Sticky Shift &Disable, sticky_script_disable
Menu, Menu, Add, &Sticky Script, :sticky_script
Menu, Menu, Default, temp&1
Menu, Menu, Show
return
} 	
sticky_script_enable()
{
    Run, %A_ScriptDir%\sticky_shift_script.ahk 
}
sticky_script_disable()
{
    SetTitleMatchMode, 1
    DetectHiddenWindows, on
    WinKill %A_ScriptDir%\sticky_shift_script.ahk
}
autocorrect_enable()
{
    Run, %A_ScriptDir%\autocorrect.ahk
}
autocorrect_disable()
{
    SetTitleMatchMode, 1
    DetectHiddenWindows, on
    WinKill %A_ScriptDir%\autocorrect.ahk
}
file_sorter()
{
FileMove, C:\Users\Kavin\Downloads\*.jpg, C:\Users\Kavin\Downloads\Sorted\Images\jpg
FileMove, C:\Users\Kavin\Downloads\*.png, C:\Users\Kavin\Downloads\Sorted\Images\png
FileMove, C:\Users\Kavin\Downloads\*.gif, C:\Users\Kavin\Downloads\Sorted\Images\gif
FileMove, C:\Users\Kavin\Downloads\*.exe, C:\Users\Kavin\Downloads\Sorted\Executables\exe
FileMove, C:\Users\Kavin\Downloads\*.msi, C:\Users\Kavin\Downloads\Sorted\Executables\msi
FileMove, C:\Users\Kavin\Downloads\*.rar, C:\Users\Kavin\Downloads\Sorted\Compressed\rar
FileMove, C:\Users\Kavin\Downloads\*.zip, C:\Users\Kavin\Downloads\Sorted\Compressed\zip
FileMove, C:\Users\Kavin\Downloads\*.pdf, C:\Users\Kavin\Downloads\Sorted\PDFs
FileMove, C:\Users\Kavin\Downloads\*.xlsx, C:\Users\Kavin\Downloads\Sorted\Excel
return
} 
dogecoin()
{
    Run, %A_ScriptDir%\dogecoin.ahk
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
        {
            Menu()
        }
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