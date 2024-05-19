if rs.getInput("back") then
    while rs.getInput("back") do
        rs.setOutput("front", true)
        sleep(0.01)
        rs.setOutput("front", false)
        sleep(0.01) 
    end 
end