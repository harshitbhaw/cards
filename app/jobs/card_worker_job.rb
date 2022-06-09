class CardWorkerJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something
    CardMailer.new_card_email(user).deliver_now
  end
end
