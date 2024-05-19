function wirelessMessage()
    local modemSide = "top"  -- adjust based on modem location
    local channel = 123
    rednet.open(modemSide)
    rednet.send("ID", "toggle", channel) -- adjust ID to computerid
    rednet.close(modemSide)
end

wirelessMessage() --calls function to be executed
