sub ShowVideoScreen(content as object, itemIndex as integer)
    m.videoPlayer = CreateObject("roSGNode", "Video")
    if itemIndex <> 0
        numberOfChildren = content.GetChildCount()
        children = content.GetChildren(numberOfChildren - itemIndex, itemIndex)
        childrenClone = []
        for each child in children
            childrenClone.Push(child.Clone(false))
        end for
        node = CreateObject("roSGNode", "ContentNode")
        node.Update({ children: childrenClone }, true)
        m.videoPlayer.content = node
    else
        m.videoPlayer.content = content.Clone(true)
    end if
    m.videoPlayer.contentIsPlaylist = true
    ShowScreen(m.videoPlayer)
    m.videoPlayer.control = "play"
    m.videoPlayer.ObserveField("state", "OnVidePlayerStateChange")
    m.videoPlayer.ObserveField("visible", "OnVidePlayerVisibleChange")
end sub

sub OnVidePlayerStateChange()
    state = m.videoPlayer.state
    if state = "error" or state = "finished"
        CloseScreen(m.videoPlayer)
    end if
end sub

sub OnVidePlayerVisibleChange()
    if m.videoPlayer.visible = false and m.top.visible = true
        currentIndex = m.videoPlayer.contentIndex
        m.videoPlayer.control = "stop"
        m.videoPlayer.content = invalid
        m.GridScreen.SetFocus(true)
        m.GridScreen.jumpToRowItem = [m.selectedIndex[0], currentIndex + m.selectedIndex[1]]
    end if
end sub