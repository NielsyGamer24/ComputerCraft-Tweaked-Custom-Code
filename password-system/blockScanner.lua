function blockScanner()
    local scannerSide = "back"
    local range = 5

    if not peripheral.isPresent(scannerSide) then
        print("Scanner not found on side: " .. scannerSide)
        return
    end

    local scanner = peripheral.wrap(scannerSide)

    local scanResults = scanner.scan(range)

    if scanResults then
        for _, block in ipairs(scanResults) do
            print("Block: " .. block.name)
            print("Position: x=" .. block.x .. " , y=" .. block.y .. " , z=" .. block.z)
            print("Metadata: " .. block.metadata)
            print("NBT: " .. textutils.serialize(block.nbt))
            print("-----")
        end
    else
        print("No blocks found in range.")
    end
end

blockScanner()