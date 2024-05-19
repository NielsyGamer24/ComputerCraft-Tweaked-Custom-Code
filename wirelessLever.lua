function wirelessLever()
    local modemSide = "right"
    local channel = 123

    redstone.setOutput("back", false)

    while true do
        local senderID, message, protocol = rednet.receive(channel)

        if message == "toggle" then
            local currentState = redstone.getOutput("back")
            redstone.setOutput("back", not currentState)
        end
    end
end

wirelessLever() -- calls function to be executed


