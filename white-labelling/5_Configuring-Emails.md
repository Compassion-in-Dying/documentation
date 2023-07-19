# Configuring E-mails

By default E-mails are sent using [`Postmark App`](https://postmarkapp.com/) this provides the ability to customise templates to your needs. 

If you wish to use another provider such as AWS SES then this is also possible but will require writing a custom `IEmailSender` implementation. An example implementation can be see [here](https://github.com/Compassion-in-Dying/email_task/blob/main/src/Choices.Email/Adapters/PostmarkSender.cs)