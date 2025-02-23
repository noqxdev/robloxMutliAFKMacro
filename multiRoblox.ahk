#Requires AutoHotkey v2.0

RobloxWindow := "ahk_exe RobloxPlayerBeta.exe"
WindowCount := WinGetCount(RobloxWindow)

screenClick(x, y, LR := "Left") { 
    MouseMove(x, y)
    MouseMove(1, 0, , "R")
    MouseClick(LR, -1, 0, , , , "R")
    Sleep(50)
}

F3:: {
    openRoblox()
    
}

F8:: {
    ExitApp
}

openRoblox() {
    if WinExist(RobloxWindow) {
        amountWindows := getAmountOfRobloxWindows()
        i := 1
        while WinExist(RobloxWindow) {
            loop amountWindows {
                WinActivate(RobloxWindow " ahk_id " WinGetList(RobloxWindow)[i])
                if checkboxFullScreen.Value = true {
                    WinMove(0, 0, 1920, 1080, RobloxWindow " ahk_id " WinGetList(RobloxWindow)[i])
                } else if checkboxFullScreen.Value = false {
                    WinMove(20, 15, 800, 600, RobloxWindow " ahk_id " WinGetList(RobloxWindow)[i])
                }
                clickOnWindow(101, 210) 
                Sleep(1000)
                i++
            }
            i := 1
        }
    }
}

getAmountOfRobloxWindows() {
    return WinGetCount(RobloxWindow)
}

clickOnWindow(x, y) {
    screenClick(x, y)
}


/* GUI */

MyGui := Gui()
MyGui.BackColor := "0x101014"
Tabs := MyGui.AddTab3("cWhite", ["Hub","Info", "Settings"])
MyGui.SetFont("s20 Bold", "Gotham Bold.otf")
MyGui.AddText("w500 cWhite", "Multiple Window Change | Roblox")
MyGui.AddText("w250 cWhite", "Roblox Windows: " WinGetCount(RobloxWindow))
MyGui.AddText("w150 cWhite", "F3: Start")
MyGui.AddText("w150 cWhite", "F8: Exit")

Tabs.UseTab(2)
MyGui.AddText("w500 Center cWhite", "Multiple Window Change | Roblox")
MyGui.AddText("w250 cWhite", "Made by noqx")
MyGui.AddText("w250 cWhite", "Macro Version: 0.1Beta")
MyGui.AddLink(, '<a href="https://discord.gg/5aDKtfFzfn">discord</a>')

Tabs.UseTab(3)
checkboxFullScreen := MyGui.AddCheckBox("vFullScreen x20 y100 cWhite", "FullScreen")

MyGui.Show("w640 h365")

hwnd := MyGui.Hwnd

DllCall("SetWindowPos", "Ptr", hwnd, "Ptr", -1, "Int", 0, "Int", 0, "Int", 0, "Int", 0, "UInt", 0x3)

DllCall("dwmapi\DwmSetWindowAttribute", "Ptr", hwnd, "UInt", 20, "Int*", 1, "UInt", 4)

reconnectMacroSettingsGUI := Gui()
reconnectMacroSettingsGUI.BackColor := "0x101014"
reconnectMacroSettingsGUI.SetFont("s20 Bold", "Gotham Bold.otf")
hwnd := reconnectMacroSettingsGUI.Hwnd

customEggWayY := reconnectMacroSettingsGUI.Add("Edit", "w200 Number x10 y10", "1750")
reconnectMacroSettingsGUI.AddText("w100 Center x220 y10 cWhite", "customEggWayY")

customEggWayX := reconnectMacroSettingsGUI.Add("Edit", "w200 Number x10 y50", "1500")
reconnectMacroSettingsGUI.AddText("w100 Center x220 y50 cWhite", "customEggWayX")

reconnectMacroSettingsGUI.AddText("w1500 Left x10 y120 cWhite", "1000 = 1 second | Basic Settings: 1750, 1500")

customEggWayEnable := reconnectMacroSettingsGUI.AddCheckBox("vActiveCustomWay x10 y90 cWhite", "Active Custom Way")

DllCall("SetWindowPos", "Ptr", hwnd, "Ptr", -1, "Int", 0, "Int", 0, "Int", 0, "Int", 0, "UInt", 0x3)
DllCall("dwmapi\DwmSetWindowAttribute", "Ptr", hwnd, "UInt", 20, "Int*", 1, "UInt", 4)

return