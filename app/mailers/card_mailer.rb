class CardMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def new_card_email(user)
        @user = user
        byebug
        mail(to: @user.email, subject: "You got a new card!")
    end
end