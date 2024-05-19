function setPassword(username, password)
    local file = fs.open("passwords.txt", "a")
    file.writeLine(username .. ":" .. password)
    file.close()
    print("Password set for user: " .. username)
end


function checkPassword(username, password)
    if fs.exists("passwords.txt") then
        local file = fs.open("passwords.txt", "r")
        local line = file.readLine()
    

    while line do
        local storedUsername, storedPassword = line:match("([^:]+):([^:]+)")

        if storedUsername == username and storedPassword == password then
            file.close()
            return true
        end

        line = file.readLine()

    end
        file.close()
    end
    return false
end



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

            setPassword(username, password)
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

passwordSystem()
