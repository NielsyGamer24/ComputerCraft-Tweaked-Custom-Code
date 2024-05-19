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
