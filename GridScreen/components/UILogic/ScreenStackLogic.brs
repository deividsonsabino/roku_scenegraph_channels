sub InitScreenStack()
    m.screenStack = []
end sub

sub ShowScreen(node as object)
    prev = m.screenStack.Peek()
    if prev <> invalid
        prev.visible = false
    end if

    m.Top.AppendChild(node)
    node.visible = true
    node.SetFocus(true)
    m.screenStack.Push(node)
end sub

sub CloseScreen(node as object)
    if node = invalid or (m.screenStack.Peek() <> invalid and m.screenStack.Peek().IsSameNode(node))
        last = m.screenStack.Pop()
        last.visible = false
        m.top.removeChild(node)

        prev = m.screenStack.Peek()
        if prev <> invalid
            prev.visible = true
            prev.SetFocus(true)
        end if
    end if
end sub