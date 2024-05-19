function calculator()
    while true do
        term.clear()
        term.setCursorPos(1, 1)
        print("Calculator")
        print("Enter 'exit' to quit")


        -- User input
        write("Enter expression: ")
        local input = read()

        -- Exit check

        if input == "exit" then
            break
        end
        
        -- calculator does calculator things

        local success, result = pcall(load("return " .. input))

        if success then
            print("Result:" .. tostring(result))
        else
            print("Error: Doh." .. result)
        end
        print("Press Enter to continue")
        read()
    end
end
