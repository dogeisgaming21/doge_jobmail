RegisterNetEvent('doge_jobmail:server:gradeUpdateMail', function(bossSource, bossPlayer, employeePlayer, type, initialPosition, promotionData)
    -- bossSource      -> contains the original 'src'
    -- bossPlayer      -> contains the original 'Player' object
    -- employeePlayer  -> contains the original 'Employee' object
    -- type            -> contains the type of grade update performed (Promotion/Demotion)
    -- initialPosition -> contains the initial rank of the employee
    -- promotionData   -> contains the original 'data' table    
    local bossName = bossPlayer.PlayerData.charinfo.firstname .. " " .. bossPlayer.PlayerData.charinfo.lastname
    local employeeName = employeePlayer.PlayerData.charinfo.firstname .. " " .. employeePlayer.PlayerData.charinfo.lastname
    local newGradeName = promotionData.gradename
    local phoneNumber = exports["lb-phone"]:GetEquippedPhoneNumber(employeePlayer.PlayerData.source)
    local playerMail = exports["lb-phone"]:GetEmailAddress(phoneNumber)

    if type == 'Demotion' then
        local message = string.format([[
Hello %s,

  I hope this message finds you well. 
  I regret to inform you that after a through review of your performance and other factors,
  you have been demoted to %s from your previous rank of %s
                        
Regards, 

    %s
    %s
    %s
        
    ]], employeeName, newGradeName, initialPosition, bossName, bossPlayer.PlayerData.job.grade.name, bossPlayer.PlayerData.job.label)
      local success, id =   exports["lb-phone"]:SendMail({
        sender = employeePlayer.PlayerData.job.label,
        to = playerMail,
        subject = 'Notice of Demotion',
        message = message
    })
else if type == "Promotion" then
        local gender = employeePlayer.PlayerData.charinfo.gender
        local salutation
        if gender == 0 then salutation = 'Mr. ' end
        if gender == 1 then salutation = 'Ms. ' end
        local message2 = string.format([[
Hello %s,

I hope this message finds you well.
I am pleased to inform you that, 
you have been promoted to %s!
I cannot wait to see all you do in this new role!
            
Regards, 

    %s
    %s
    %s
        
    ]], employeeName, newGradeName, bossName, bossPlayer.PlayerData.job.grade.name, bossPlayer.PlayerData.job.label)
        local success, id = exports["lb-phone"]:SendMail({
        sender = employeePlayer.PlayerData.job.label,
        to = playerMail,
        subject = 'Congratulations ' .. salutation .. employeePlayer.PlayerData.charinfo.lastname,
        message = message2,


        })
    
        else
        print("ERROR: This Server Event is used for gradeUpdates, check your sv_boss.lua file in qb-management and verify this event is called in the correct place.")
        end
    
    end



end)

RegisterNetEvent('doge_jobmail:server:fireMail', function(bossSource, bossPlayer, employeePlayer, type, fireData)
    -- bossSource      -> contains the original 'src'
    -- bossPlayer      -> contains the original 'Player' object
    -- employeePlayer  -> contains the original 'Employee' object
    -- type            -> contains the type of chenge made to the employeePlayer job (Should return 'fire')
    -- initialPosition -> contains the initial rank of the employee
    -- promotionData   -> contains the original 'data' table 
    local bossName = bossPlayer.PlayerData.charinfo.firstname .. " " .. bossPlayer.PlayerData.charinfo.lastname
    local employeeName = employeePlayer.PlayerData.charinfo.firstname .. " " .. employeePlayer.PlayerData.charinfo.lastname
    local phoneNumber = exports["lb-phone"]:GetEquippedPhoneNumber(employeePlayer.PlayerData.source)
    local playerMail = exports["lb-phone"]:GetEmailAddress(phoneNumber)

    if type == 'fire' then
        local gender = employeePlayer.PlayerData.charinfo.gender
        local salutation
        if gender == 0 then salutation = 'Mr. ' end
        if gender == 1 then salutation = 'Ms. ' end
        local message3 = string.format([[
Hello %s,

I hope this message finds you well. 
I regret to inform you that after a through review of your performance and other factors,
you have been terminated from your position at %s
            
Regards, 

    %s
    %s
    %s
        
    ]], employeeName, employeePlayer.PlayerData.job.label, bossName, bossPlayer.PlayerData.job.grade.name, bossPlayer.PlayerData.job.label)
        local success, id = exports["lb-phone"]:SendMail({
            sender = employeePlayer.PlayerData.job.label,
            to = playerMail,
            subject = 'Notice of Termination from ' .. employeePlayer.PlayerData.job.label,
            message = message3

        })

    else
        print("ERROR: This Server Event is used for firing, check your sv_boss.lua file in qb-management and verify this event is called in the correct place.")

    end


end)

RegisterNetEvent('doge_jobmail:server:hireMail', function(bossSource, bossPlayer, employeePlayer, recruit)
    -- bossSource      -> contains the original 'src'
    -- bossPlayer      -> contains the original 'Player' object
    -- employeePlayer  -> contains the original 'Employee' object
    -- recruit         -> contains the original 'data' table
local bossName = bossPlayer.PlayerData.charinfo.firstname .. " " .. bossPlayer.PlayerData.charinfo.lastname
local employeeName = employeePlayer.PlayerData.charinfo.firstname .. " " .. employeePlayer.PlayerData.charinfo.lastname
local phoneNumber = exports["lb-phone"]:GetEquippedPhoneNumber(employeePlayer.PlayerData.source)
local playerMail = exports["lb-phone"]:GetEmailAddress(phoneNumber)
        local message = string.format([[
Hello %s,

This message is to congratulate you on your employment at %s
I cannot wait to see you succeed!
            
Regards, 

    %s
    %s
    %s
        
    ]], employeeName, bossPlayer.PlayerData.job.label, bossName, bossPlayer.PlayerData.job.grade.name, bossPlayer.PlayerData.job.label)
local success, id = exports["lb-phone"]:SendMail({
            sender = bossPlayer.PlayerData.job.label,
            to = playerMail,
            subject = 'Welcome to ' .. bossPlayer.PlayerData.job.label,
            message = message
})



end)