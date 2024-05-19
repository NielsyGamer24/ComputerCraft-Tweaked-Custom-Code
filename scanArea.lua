-- Function to inspect and print block details
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

-- Function to scan an area
function scanArea(width, length)
    for i = 1, length do
        for j = 1, width do
            inspectBlock("forward")
            if j < width then
                turtle.forward()
            end
        end
        if i < length then
            if i % 2 == 1 then
                turtle.turnRight()
                inspectBlock("forward")
                turtle.forward()
                turtle.turnRight()
            else
                turtle.turnLeft()
                inspectBlock("forward")
                turtle.forward()
                turtle.turnLeft()
            end
        end
    end

    -- Return to starting position
    if length % 2 == 1 then
        turtle.turnRight()
        turtle.turnRight()
        for i = 1, width - 1 do
            turtle.forward()
        end
        turtle.turnRight()
        for i = 1, length - 1 do
            turtle.forward()
        end
        turtle.turnRight()
    else
        for i = 1, width - 1 do
            turtle.forward()
        end
        turtle.turnRight()
        turtle.turnRight()
    end
end

-- Main function to run the block scanner
function blockScanner()
    local width = 5 -- Define the width of the scanning area
    local length = 5 -- Define the length of the scanning area

    -- Start scanning
    scanArea(width, length)
end

blockScanner()