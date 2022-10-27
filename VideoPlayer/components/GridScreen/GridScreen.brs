sub Init()
    m.rowList = m.top.findNode("rowList")
    m.rowList.SetFocus(true)
    m.descriptionLabel = m.top.findNode("descriptionLabel")
    m.top.ObserveField("visible", "OnVisibleChange")
    m.titleLabel = m.top.findNode("titleLabel")
    m.rowList.ObserveField("rowItemFocused", "OnItemFocused")
end sub

sub OnVisibleChange()
    if m.top.visible = true
        m.RowList.SetFocus(true)
    end if
end sub

sub OnItemFocused()
    focusedIndex = m.rowList.rowItemFocused
    row = m.rowList.content.GetChild(focusedIndex[0])
    item = row.GetChild(focusedIndex[1])
    m.descriptionLabel.text = item.description
    m.titleLabel.text = item.title
    if item.lenght <> invalid
        m.titleLabel.text += " | " + GetTime(item.lenght)
    end if
end sub

function GetTime(lenght as integer)
    minutes = (lenght \ 60).toStr()
    seconds = lenght mod 60
    if seconds < 10
        seconds = "0" + seconds.toStr()
    else
        seconds = seconds.toStr()
    end if
    return minutes + ":" + seconds
end function

