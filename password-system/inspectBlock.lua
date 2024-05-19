function inspectBlock(direction)
    local success, data = nil, nil

    if direction == "forward" then
        success, data = turtle.inspect()
    elseif direction == "up" then
        success, data = turtle.inspectUp()
    elseif direction == "down" then
        success, data = turtle.inspectDown()
    end

    if success then
        print("Block: " .. data.name)
        if data.metadata then
            print("Metadata: " .. data.metadata)
        end
        if data.state then
            print("State: " .. textutils.serialize(data.state))
        end
        print("-----")
    else
        print("No block detected " .. direction)
    end
end

