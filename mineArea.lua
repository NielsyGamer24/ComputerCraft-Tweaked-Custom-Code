-- Function to refuel the turtle if it runs out of fuel
function refuelIfNeeded()
    if turtle.getFuelLevel() == 0 then
        for i = 1, 16 do
            turtle.select(i)
            local itemDetail = turtle.getItemDetail()
            if itemDetail and itemDetail.name == "minecraft:coal" then
                turtle.refuel()
                break
            end
        end
    end
end

-- Function to check and drop cobblestone
function dropCobblestone()
    for i = 1, 16 do
        local itemDetail = turtle.getItemDetail(i)
        if itemDetail and itemDetail.name == "minecraft:cobblestone" then
            turtle.select(i)
            turtle.drop()
        end
    end
end

-- Function to dig forward and move the turtle
function digAndMove()
    refuelIfNeeded()
    while turtle.detect() do
        turtle.dig()
    end
    turtle.forward()
    dropCobblestone()
end

-- Function to dig down and move the turtle
function digAndMoveDown()
    refuelIfNeeded()
    while turtle.detectDown() do
        turtle.digDown()
    end
    turtle.down()
    dropCobblestone()
end

-- Function to dig up and move the turtle
function digAndMoveUp()
    refuelIfNeeded()
    while turtle.detectUp() do
        turtle.digUp()
    end
    turtle.up()
    dropCobblestone()
end

-- Function to mine a single layer of specified width and depth
function mineLayer(width, depth)
    for i = 1, depth do
        for j = 1, width - 1 do
            digAndMove()
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
end

-- Function to return to the starting position of the current layer
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

-- Main mining function
function mineArea(width, height, depth)
    for h = 1, height do
        mineLayer(width, depth)
        if h < height then
            digAndMoveDown()
            returnToStart(width, depth)
        end
    end
end

-- Main program execution
print("Enter the width of the area to mine:")
local width = tonumber(read())
print("Enter the height of the area to mine:")
local height = tonumber(read())
print("Enter the depth of the area to mine:")
local depth = tonumber(read())

if not width or not height or not depth then
    print("Invalid input. Please enter valid numbers for width, height, and depth.")
else
    mineArea(width, height, depth)
    print("Mining complete!")
end