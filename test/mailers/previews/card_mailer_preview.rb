# Preview all emails at http://localhost:3000/rails/mailers/card_mailer
class CardMailerPreview < ActionMailer::Preview
    # order = Order.new(name: "Joe Smith", email: "joe@gmail.com", address: "1-2-3 Chuo, Tokyo, 333-0000", phone: "090-7777-8888", message: "I want to place an order!")

    CardMailer.with(card: card).new_card_email
end
