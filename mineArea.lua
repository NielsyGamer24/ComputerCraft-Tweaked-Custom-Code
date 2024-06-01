function refuelIfNeeded()
    if turtle.getFuelLevel() == 0 and turtle.select(1) == "minecraft:coal" then
        turtle.select(1)
        turtle.refuel()
    end
end

function digAndMove()
    refuelIfNeeded()
    while turtle.detect() do
        turtle.dig()
    end
    turtle.forward()
end

function digAndMoveDown()
    refuelIfNeeded()
    while turtle.detectDown() do
        turtle.digDown()
    end
    turtle.down()
end

function digAndMoveUp()
    while turtle.detectUp() do
        turtle.digUp()
    end
    turtle.up()
    end

function mineLayer(width, depth)
    for i = 1, depth do
        for j = 1, width - 1 do
            digAndMove()
        end
    end
    if i < depth then
        if i % 2 == 1 then
            turtle.turnRight()
            digAndMove()
            turtle.turnRight()
        else
            turtle.turnLeft()
            digAndMove()
            turtle.turnLeft()
        end
    end
end

function returnToStart(width, depth)
    if depth % 2 == 1 then
        turtle.turnRight()
        for i = 1, width - 1 do
            turtle.forward()
    end
    turtle.turnRight()
else
    turtle.turnLeft()
    for i = 1, width - 1 do
        turtle.forward()
    end
    turtle.turnLeft()
    end
    for i = 1, depth - 1 do
        turtle.forward()
    end
    turtle.turnRight()
    turtle.turnRight()
    end
    function mineArea(width, height, depth)
        for h = 1, height do
            mineLayer(width, depth)
            if h < height then
                digAndMoveDown()
                returnToStart(width, depth)
            end
        end
    end

    print("Enter the width of the area to mine:")
    local width = tonumber(read())
    print("Enter the height of the area to mine:")
    local height = tonumber(read())
    print("Enter the depth of the area to mine:")
    local depth = tonumber(read())

    mineArea(width, height, depth)

    print("Mining complete!")
    