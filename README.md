# Description
This simple and customizable script enables the use of the LB-Phone SendMail exports to send email to players when they are Promoted/Demoted/Hired/Fired from their jobs in a qb-core server. This script is compatible only with qb-core and qb-management, however, it can be quickly changed to support other resources by the server developers.

# Dependencies
  lb-phone
 <br> qb-core 
 <br> qb-management

# Installation

Step 1: Download the resource from the releases page.
<br>Step 2: Extract the files and place them in your server resources directory
<br>Step 3: Add the following code to your qb-management\sv_main.lua:

  <br>Find the ```qb-bossmenu:server:GradeUpdate``` event around line 76
    <br>Add this block of code to the ```if Employee.PlayerData.source then``` statement
   <br> ```TriggerEvent('doge_jobmail:server:gradeUpdateMail', src, Player, Employee, type, initialPosition, data)```

<br>  Find the ```qb-bossmenu:server:FireEmployee``` event around line 132
   <br> Add this block of code to the ```if Employee.PlayerData.source then``` statement
   <br> ```TriggerEvent('doge_jobmail:server:fireMail', src, Player, Employee, type, target)```

<br> Step 4: ensure doge_jobmail at the end of your server.cfg after lb-phone and your qb

# Preview
  Hiring Email:
  
**TBA**

  Promotion Email:

**TBA**

  Demotion Email:

**TBA**

  Termination Email:

**TBA**



  # Customization:

You can customize every email subject and body from the config file in [config.lua](config.lua). Edit the templates under the mailTemplates section and change the placeholders to suit your server.

Supported placeholders:

- `{employeeName}`: the full name of the employee receiving the mail
- `{bossName}`: the full name of the boss/sender
- `{newGradeName}`: the new job rank name after promotion or demotion
- `{oldGradeName}`: the previous job rank name before promotion or demotion
- `{jobLabel}`: the job label or department name
- `{jobGradeName}`: the boss's current grade name
- `{salutation}`: the gendered prefix from config (e.g. `Mr. ` or `Ms. `)
- `{lastname}`: the employee's last name

Example subject:

- `Congratulations {salutation}{lastname}`

Example message line:

- `Hello {employeeName},`


