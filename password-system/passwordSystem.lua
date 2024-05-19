function passwordSystem()
    while true do
        term.clear()
        term.setCursorPos(1, 1)
        print("Password System")
        print("-----------------")
        print("1. Set Password")
        print("2. Login")
        print("3. Exit")

        write("Enter option: ")
        local option = tonumber(read())

        if option == 1 then
            term.clear()
            term.setCursorPos(1, 1)
            print("Set Password")
            print("----------------")

            write("Enter username: ")
            local username = read()

            write("Enter password")
            local password = read("*")

            setPassword(username, passwordSystem)
            sleep(1)
        elseif option == 2 then
            term.clear()
            term.setCursorPos(1, 1)
            print("Login")
            print("----------------")

            write("Enter username: ")
            local username = read()

            write("Enter password: ")
            local password = read("*")

            if checkPassword(username, password) then
                print("Login successful!")

            else
                print("Invalid username or password.")
            end

            sleep(2)

        elseif option == 3 then
            break
        else
            print("Invalid option. Please try again.")
            sleep(1)
        
        end


    end

end
