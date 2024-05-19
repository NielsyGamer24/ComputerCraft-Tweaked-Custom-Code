function detectFire()
    local success, data = turtle.inspect()
    if success and data.name == "minecraft:fire" then
        print("Fire detected in front of turtle.")
        return true
    end

    success, data = turtle.inspectUp()
    if success and data.name == "minecraft:fire" then
        print("Fire detected over turtle.")
        return true
    end

    success, data = turtle.inspectDown()
    if success and data.name == "minecraft:fire" then
        print("Fire detected below turtle.")
        return true
    end

    print("No fire detected around the turtle.")
    return false
end

