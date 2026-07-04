local function getSalutation(charinfo)
    if not Config.formatting or not Config.formatting.useGenderSalutation then
        return ""
    end

    if charinfo and charinfo.gender == 0 then
        return (Config.salutation and Config.salutation.male) or "Mr. "
    elseif charinfo and charinfo.gender == 1 then
        return (Config.salutation and Config.salutation.female) or "Ms. "
    end

    return ""
end

local function formatMailTemplate(template, values)
    local formatted = template or ""

    for key, value in pairs(values) do
        formatted = string.gsub(formatted, "{" .. key .. "}", tostring(value))
    end

    return formatted
end

local function sendConfiguredMail(playerMail, sender, subjectTemplate, messageTemplate, values)
    local subject = formatMailTemplate(subjectTemplate, values)
    local message = formatMailTemplate(messageTemplate, values)

    exports["lb-phone"]:SendMail({
        sender = sender,
        to = playerMail,
        subject = subject,
        message = message
    })
end

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

    local values = {
        employeeName = employeeName,
        bossName = bossName,
        newGradeName = newGradeName,
        oldGradeName = initialPosition,
        jobLabel = bossPlayer.PlayerData.job.label,
        jobGradeName = bossPlayer.PlayerData.job.grade.name,
        salutation = getSalutation(employeePlayer.PlayerData.charinfo),
        lastname = employeePlayer.PlayerData.charinfo.lastname or ""
    }

    if type == 'Demotion' then
        local template = Config.mailTemplates and Config.mailTemplates.demotion or {}
        sendConfiguredMail(playerMail, employeePlayer.PlayerData.job.label, template.subject, template.message, values)
    elseif type == "Promotion" then
        local template = Config.mailTemplates and Config.mailTemplates.promotion or {}
        sendConfiguredMail(playerMail, employeePlayer.PlayerData.job.label, template.subject, template.message, values)
    else
        print("ERROR: This Server Event is used for gradeUpdates, check your sv_boss.lua file in qb-management and verify this event is called in the correct place.")
    end
end)

RegisterNetEvent('doge_jobmail:server:fireMail', function(bossSource, bossPlayer, employeePlayer, type, fireData)
    -- bossSource      -> contains the original 'src'
    -- bossPlayer      -> contains the original 'Player' object
    -- employeePlayer  -> contains the original 'Employee' object
    -- type            -> contains the type of change made to the employeePlayer job (Should return 'fire')
    -- initialPosition -> contains the initial rank of the employee
    -- promotionData   -> contains the original 'data' table
    local bossName = bossPlayer.PlayerData.charinfo.firstname .. " " .. bossPlayer.PlayerData.charinfo.lastname
    local employeeName = employeePlayer.PlayerData.charinfo.firstname .. " " .. employeePlayer.PlayerData.charinfo.lastname
    local phoneNumber = exports["lb-phone"]:GetEquippedPhoneNumber(employeePlayer.PlayerData.source)
    local playerMail = exports["lb-phone"]:GetEmailAddress(phoneNumber)

    local values = {
        employeeName = employeeName,
        bossName = bossName,
        jobLabel = employeePlayer.PlayerData.job.label,
        jobGradeName = bossPlayer.PlayerData.job.grade.name,
        salutation = getSalutation(employeePlayer.PlayerData.charinfo),
        lastname = employeePlayer.PlayerData.charinfo.lastname or ""
    }

    if type == 'fire' then
        local template = Config.mailTemplates and Config.mailTemplates.fire or {}
        sendConfiguredMail(playerMail, employeePlayer.PlayerData.job.label, template.subject, template.message, values)
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

    local values = {
        employeeName = employeeName,
        bossName = bossName,
        jobLabel = bossPlayer.PlayerData.job.label,
        jobGradeName = bossPlayer.PlayerData.job.grade.name,
        salutation = getSalutation(employeePlayer.PlayerData.charinfo),
        lastname = employeePlayer.PlayerData.charinfo.lastname or ""
    }

    local template = Config.mailTemplates and Config.mailTemplates.hire or {}
    sendConfiguredMail(playerMail, bossPlayer.PlayerData.job.label, template.subject, template.message, values)
end)