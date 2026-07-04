Config = {
    formatting = {
        useGenderSalutation = true
    },

    salutation = {
        male = "Mr. ",
        female = "Ms. "
    },

    mailTemplates = {
        promotion = {
            subject = "Congratulations {salutation}{lastname}",
            message = [[Hello {employeeName},

I hope this message finds you well.
I am pleased to inform you that you have been promoted to {newGradeName}!
I cannot wait to see all you do in this new role!

Regards,

    {bossName}
    {jobGradeName}
    {jobLabel}]]
        },

        demotion = {
            subject = "Notice of Demotion",
            message = [[Hello {employeeName},

I hope this message finds you well.
I regret to inform you that after a thorough review of your performance and other factors,
you have been demoted to {newGradeName} from your previous rank of {oldGradeName}.

Regards,

    {bossName}
    {jobGradeName}
    {jobLabel}]]
        },

        fire = {
            subject = "Notice of Termination from {jobLabel}",
            message = [[Hello {employeeName},

I hope this message finds you well.
I regret to inform you that after a thorough review of your performance and other factors,
you have been terminated from your position at {jobLabel}.

Regards,

    {bossName}
    {jobGradeName}
    {jobLabel}]]
        },

        hire = {
            subject = "Welcome to {jobLabel}",
            message = [[Hello {employeeName},

This message is to congratulate you on your employment at {jobLabel}.
I cannot wait to see you succeed!

Regards,

    {bossName}
    {jobGradeName}
    {jobLabel}]]
        }
    }
}

