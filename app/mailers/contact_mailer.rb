class ContactMailer < ApplicationMailer
    def contact_mail(contact)
        @contact = contact
        mail(
            to: @contact.email,
            subject: 'Thanks you for your contact.'
        )  
    end

    def recieved_contact(contact)
        @contact = contact
        mail(
            to: ENV['SMTP_MAIL'],
            subject: 'You recieved contact.'
        )
    end
end
