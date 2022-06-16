class CardWorkerJob < ApplicationJob
  queue_as :default
 
  def perform(user_id)
    # puts 'sss'
    CardMailer.new_card_email(user_id).deliver_later(wait_until: 5.hours.from_now)
    # CardMailer.new_card_email(user).deliver
    # CardWorkerJob.perform_later(user_id)
  end
end