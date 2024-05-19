function setPassword(username, password)
    local file = fs.open("passwords.txt", "a")
    file.writeLine(username .. ":" .. password)
    file.close()
    print("Password set for user: " .. username)
end
