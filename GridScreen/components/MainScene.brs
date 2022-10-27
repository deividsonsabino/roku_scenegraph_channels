sub Init()
    m.top.backgroundColor = "0x6f1bb1"
    m.top.backgroundUri = ""
    m.loadingIndicator = m.top.FindNode("loadingIndicator")
    InitScreenStack()
    ShowGridScreen()
    RunContentTask()
end sub