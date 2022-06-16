class CardWorker
  include Sidekiq::Worker

  def perform
    # Do something
    # CardMailer.new_card_email(user).deliver
    # CardWorker.perform_async(5.minutes.from_now, user_id)
    puts 'sssssssssssssssss'
  end
end
