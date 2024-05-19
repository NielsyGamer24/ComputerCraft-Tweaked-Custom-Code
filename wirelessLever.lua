function wirelessLever()
    local modemSide = "right"
    local channel = 123

    redstone.setOutput("back", false)

    while true do
        local _, _, sender, _, _, message = os.pullEvent("modem_message")

        if message == "toggle" then
            local currentState = redstone.getOutput("back")
            redstone.setOutput("back", not currentState)

        end
    end
end


function wirelessMessage()
    local modemSide = "top"  -- adjust based on modem location
    local channel = 123
    rednet.open(modemSide)
    rednet.send("ID", "toggle", channel) -- adjust ID to computerid
    rednet.close(modemSide)
end

