sub OnContentSet()
    content = m.top.itemContent
    if content <> invalid
        m.top.findNode("poster").uri = content.hdPosterUrl
    end if
end sub