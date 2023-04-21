#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%



F3::
{
    InputBox, bond_page, Page, Is the bond on the first or second page (enter 1`, 2`, or 3)
    InputBox, bond_row, Row, What row is the bond in (enter a number between 1-7)
    InputBox, glimmer_height, Glimmer, Is the glimmer option at the very top or down one row (enter 1 or 2)
    WinActivate, Destiny 2
    Sleep, 200
    loop,
    {
        loop, 45
            get_shards(bond_page, bond_row)
        get_glimmer(glimmer_height)
    }
}
Return

get_shards(bond_page, bond_row) 
{
    bond_y := 0.25 + (0.095*(bond_row-1))

    ; open collections
    Send, {Blind}/
    Sleep, 1000
    ; click armor
    Click, % A_ScreenWidth*0.46992 " " A_ScreenHeight*0.33264
    Sleep, 300
    Click, % A_ScreenWidth*0.46992 " " A_ScreenHeight*0.33264
    Sleep, 1000
    ; click events
    Click, % A_ScreenWidth*0.18008 " " A_ScreenHeight*0.58889
    Sleep, 200
    Click, % A_ScreenWidth*0.18008 " " A_ScreenHeight*0.58889
    Sleep, 500
    ; go right to bond page
    loop, % bond_page
    {
        Send, {Right}
        Sleep, 300
    }
    ; hover over bond
    Click, % A_ScreenWidth*0.37578 " " A_ScreenHeight*bond_y " " 0
    Sleep, 200
    Click, % A_ScreenWidth*0.37578 " " A_ScreenHeight*bond_y " " 0
    Sleep, 500

    ; reacquire 9 bonds
    loop, 9 
    {
        Send, {LButton Down}
        Sleep, 3100
        Send, {LButton Up}
        Sleep, 250
    }

    ; open inventory
    Send, i
    Sleep, 1500
    ; hover over bond
    Click, % A_ScreenWidth*0.72813 " " A_ScreenHeight*0.71250 " " 0
    Sleep, 200
    ; hover over bonds to delete 
    Click, % A_ScreenWidth*0.78438 " " A_ScreenHeight*0.71389 " " 0
    Sleep, 100

    ; delete all bonds 
    loop, 9 
    {
        Send, {f Down}
        Sleep, 1100
        Send, {f Up}
        Sleep, 750
    }
    Return
}

get_glimmer(glimmer_height)
{
    glimmer_y := glimmer_height * 0.16181
    Send, {Esc}
    Sleep, 1000
    ; Send, {Right}
    ; Sleep, 600
    Click, % A_ScreenWidth*0.60586 " " A_ScreenHeight*glimmer_y " " 0
    Sleep, 3100

    Loop, 24
    {
        Click
        Sleep, 800
    }
    Return
}

F4::Reload
