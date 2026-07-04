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

It is my pleasure to inform you that you have been promoted to **{newGradeName}**. This promotion reflects your hard work, dedication, and the contributions you have made to the team.

Congratulations on this well-deserved achievement. I am excited to see all that you accomplish in your new role and look forward to your continued success.

Best regards,

{bossName}
{jobGradeName}
{jobLabel}
]]
        },

        demotion = {
            subject = "Notice of Demotion",
            message = [[Hello {employeeName},

I hope this message finds you well.

After careful review and consideration, I regret to inform you that you have been demoted from **{oldGradeName}** to **{newGradeName}**. This decision was made following an evaluation of performance, conduct, and other relevant factors.

While this outcome is not the one we had hoped for, we encourage you to view it as an opportunity for growth and development. We remain committed to supporting your success moving forward and hope to see continued improvement in your future performance.

If you have any questions regarding this decision, please feel free to reach out.

Regards,

{bossName}
{jobGradeName}
{jobLabel}
]]
        },

        fire = {
            subject = "Notice of Termination from {jobLabel}",
            message = [[Hello {employeeName},

I hope this message finds you well.

After careful review and consideration, I regret to inform you that your employment with **{jobLabel}** has been terminated, effective immediately. This decision was made following an evaluation of performance, conduct, and other relevant factors.

We appreciate the time and effort you have contributed during your tenure with the organization and wish you the best in your future endeavors.

If you have any questions regarding this decision, please contact a member of management.

Regards,

{bossName}
{jobGradeName}
{jobLabel}
]]
        },

        hire = {
            subject = "Welcome to {jobLabel}",
            message = [[Hello {employeeName},

Congratulations!

It is my pleasure to welcome you to **{jobLabel}**. We are excited to have you join our team and look forward to seeing the skills, dedication, and enthusiasm you bring to the role.

We are confident that you will be a valuable addition to the organization, and we cannot wait to see you grow and succeed with us.

Welcome aboard, and best of luck in your new position!

Regards,

{bossName}
{jobGradeName}
{jobLabel}
]]
        }
    }
}

